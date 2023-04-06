import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/models/database/feed_update_record.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed/util/function.dart';
import 'package:webfeed/webfeed.dart';
import 'package:readability/readability.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  List<FeedItem> _parseRssItem(Feed feed, List<RssItem>? items) {
    return items != null
        ? items.map((item) => FeedItem.fromRssItem(item, feed)).toList()
        : [];
  }

  // parse Atom item
  List<FeedItem> _parseAtomItem(Feed feed, List<AtomItem>? items) {
    return items != null
        ? items.map((item) => FeedItem.fromAtomItem(item, feed)).toList()
        : [];
  }

  Tuple2<Feed, List<FeedItem>> _parseFeed(String xml, String url) {
    var feedType = getFeedType(xml);
    if (feedType == FeedType.Rss) {
      var feedRaw = RssFeed.parse(xml);
      var feed = Feed.fromRssFeed(feedRaw, url, FeedType.Rss);
      var feedItems = _parseRssItem(feed, feedRaw.items);
      return Tuple2(feed, feedItems);
    } else if (feedType == FeedType.Atom) {
      var feedRaw = AtomFeed.parse(xml);
      var feed = Feed.fromAtomFeed(feedRaw, url, FeedType.Atom);
      var feedItems = _parseAtomItem(feed, feedRaw.items);
      return Tuple2(feed, feedItems);
    }
    // TODO Error handle
    return Tuple2(Feed(url, FeedType.Unknown), []);
  }

  static List<FeedItem> parseCover(List<FeedItem> items) {
    return items.map((item) {
      if (item.description == null) {
        return item;
      }
      var desc = item.description!;
      // var imgSrc = matchImgSrcInHtml(desc);
      try {
        var imgSrc = findCoverImageInHtml(desc);
        item.cover = imgSrc;
      } catch (exception) {
        // do nothing
      }
      return item;
    }).toList();
  }

  // extract content from html
  static String extractReadableContent(String html) {
    var doc = HtmlDocument(input: html);
    doc.parse();
    return doc.pureHtml;
  }

  Future<void> downloadHtml(List<FeedItem> feedItems) async {
    if (feedItems.isEmpty) return;
    int idx = 0;
    var headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(feedItems[idx].link!)),
      onLoadStop: (controller, url) async {
        // final String htmlContent = await controller.evaluateJavascript(
        //     source: 'document.documentElement.outerHTML');

        final String htmlContent = await controller.getHtml() ?? "";

        String pureContent = await compute(extractReadableContent, htmlContent);

        var content = Content(
            type: ContentType.Html, content: htmlContent, uri: url.toString());

        DatabaseManager().insertContent(content);

        feedItems[idx].content = pureContent;

        DatabaseManager().updateFeedItem(feedItems[idx]);

        if (idx < feedItems.length - 1) {
          idx += 1;
          controller.loadUrl(
              urlRequest: URLRequest(url: Uri.parse(feedItems[idx].link!)));
        }
      },
    );
    debugPrint("Download Started!");
    headlessWebView.run();
    debugPrint("Download Stop! ${feedItems.length} Page");
  }

  Future<void> addFeedFromUrl(String url) async {
    String xml = await FeedApi.fetchContentFromUrl(url);
    Tuple2<Feed, List<FeedItem>> result = _parseFeed(xml, url);
    var feedItems = parseCover(result.item2);
    await DatabaseManager().insertFeedAndItems(result.item1, feedItems);
    downloadHtml(feedItems);
  }

  Future<void> fetchAllFeed() async {
    var allFeed = await DatabaseManager().getAllFeeds();
    var feedIds = allFeed.map((feed) => feed.id).toList();
    List<FeedUpdateRecord?> feedLastUpdateRecords =
        await DatabaseManager().getFeedLastUpdateRecord(feedIds);

    var feedsNeedUpdate = <int>[];
    // if there is no update record, feed need to update
    // if last update time is within config hour, feed need to update
    // otherwise, feed don't need to update
    for (var i = 0; i < allFeed.length; i++) {
      var lastUpdateRecord = feedLastUpdateRecords[i];
      if (lastUpdateRecord == null ||
          DateTime.now().difference(lastUpdateRecord.lastUpdate).inHours >=
              Constants.feedUpdateHour) {
        feedsNeedUpdate.add(i);
      }
    }

    // fetch feed content and compute md5 hash
    // if hash is different from last update record, feed need to update
    // otherwise, feed don't need to update
    for (var i in feedsNeedUpdate) {
      var feed = allFeed[i];
      var lastUpdateRecord = feedLastUpdateRecords[i];
      // TODO add error handle
      var content = await FeedApi.fetchContentFromUrl(feed.url);
      var hash = md5.convert(utf8.encode(content)).toString();
      if (lastUpdateRecord != null &&
          lastUpdateRecord.lastContentHash == hash) {
        continue;
      }
      var feedItems = parseFeedItems(content, feed);

      var feedItemsNeedInsert = <FeedItem>[];
      // if the pulish time of feed item is before last update time, feed item don't need to insert
      // if the pulish time of feed item is null, feed item need to insert
      // if there is no publish time in last update record, feed item need to insert
      // otherwise, feed item don't need to insert
      DateTime? newLastItemPublishTime;
      for (var item in feedItems) {
        if (item.publishTime == null ||
            lastUpdateRecord == null ||
            lastUpdateRecord.lastItemPublishTime == null ||
            item.publishTime!.isAfter(lastUpdateRecord.lastItemPublishTime!)) {
          feedItemsNeedInsert.add(item);
          if (item.publishTime != null &&
              (newLastItemPublishTime == null ||
                  item.publishTime!.isAfter(newLastItemPublishTime))) {
            newLastItemPublishTime = item.publishTime;
          }
        }
      }

      // if there is no feed item need to insert, feed don't need to update
      if (feedItemsNeedInsert.isEmpty) {
        continue;
      }

      var newUpdateRecord = FeedUpdateRecord(
          feedId: feed.id,
          lastUpdate: DateTime.now(),
          lastContentHash: hash,
          lastItemPublishTime: newLastItemPublishTime);
      feedItemsNeedInsert = parseCover(feedItemsNeedInsert);
      await DatabaseManager()
          .insertFeedItems(feedItemsNeedInsert, newUpdateRecord);
      downloadHtml(feedItemsNeedInsert);
    }
  }

  // parse feed items from feed content
  List<FeedItem> parseFeedItems(String content, Feed feed) {
    if (feed.type == FeedType.Atom) {
      var feedRaw = AtomFeed.parse(content);
      return _parseAtomItem(feed, feedRaw.items);
    } else if (feed.type == FeedType.Rss) {
      var feedRaw = RssFeed.parse(content);
      return _parseRssItem(feed, feedRaw.items);
    }
    return [];
  }
}
