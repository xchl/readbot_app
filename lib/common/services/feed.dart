import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Storage;
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed/util/function.dart';
import 'package:webfeed/webfeed.dart' as webfeed;
import 'package:readability/readability.dart';
import 'package:xml/xml.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  List<FeedItemModel> _parseRssItem(
      FeedModel feed, List<webfeed.RssItem>? items) {
    return items != null
        ? items.map((item) => FeedItemModel.fromRssItem(item, feed)).toList()
        : [];
  }

  // parse Atom item
  List<FeedItemModel> _parseAtomItem(
      FeedModel feed, List<webfeed.AtomItem>? items) {
    return items != null
        ? items.map((item) => FeedItemModel.fromAtomItem(item, feed)).toList()
        : [];
  }

  Tuple2<FeedModel, List<FeedItemModel>> _parseFeed(String xml, String url) {
    var feedType = getFeedType(xml);
    if (feedType == webfeed.FeedType.Rss) {
      var feedRaw = webfeed.RssFeed.parse(xml);
      var feed = FeedModel.fromRssFeed(feedRaw, url, webfeed.FeedType.Rss);
      var feedItems = _parseRssItem(feed, feedRaw.items);
      return Tuple2(feed, feedItems);
    } else if (feedType == webfeed.FeedType.Atom) {
      var feedRaw = webfeed.AtomFeed.parse(xml);
      var feed = FeedModel.fromAtomFeed(feedRaw, url, webfeed.FeedType.Atom);
      var feedItems = _parseAtomItem(feed, feedRaw.items);
      return Tuple2(feed, feedItems);
    }
    // TODO Error handle
    return Tuple2(
        FeedModel(url,
            type: FeedType.unknown,
            createTime: DateTime.now(),
            updateTime: DateTime.now()),
        []);
  }

  static List<FeedItemModel> parseCover(List<FeedItemModel> items) {
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

  Future<void> downloadHtml(List<FeedItemModel> feedItems) async {
    if (feedItems.isEmpty) return;
    int idx = 0;
    var headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(feedItems[idx].link!)),
      onLoadStop: (controller, url) async {
        // final String htmlContent = await controller.evaluateJavascript(
        //     source: 'document.documentElement.outerHTML');

        final String htmlContent = await controller.getHtml() ?? "";

        String pureContent = await compute(extractReadableContent, htmlContent);

        var content = ContentModel(
            type: ContentType.html,
            content: pureContent,
            uri: url.toString(),
            feedItemId: feedItems[idx].id);

        DatabaseManager().insertContent(content);

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

  Future<Tuple2<FeedModel, List<FeedItemModel>>?> _fetchFeedFromUrl(
      String url) async {
    String? xml = await HttpService.request(url);
    if (xml == null) {
      return null;
    }
    return _parseFeed(xml, url);
  }

  Future<void> addFeedFromUrl(String url) async {
    Tuple2<FeedModel, List<FeedItemModel>>? result =
        await _fetchFeedFromUrl(url);
    if (result == null) {
      return;
    }
    var feedItems = parseCover(result.item2);
    await DatabaseManager().insertFeedAndItems(result.item1, feedItems);
    downloadHtml(feedItems);
  }

  FeedModel? handleSingleOutline(XmlElement outline) {
    List<XmlElement> childOutlines = outline.findElements('outline').toList();
    if (childOutlines.isNotEmpty) {
      return null;
    }
    var feedName = outline.getAttribute('title');
    var feedDescription = outline.getAttribute('text');
    var feedHtmlUrl = outline.getAttribute('xmlUrl');

    if (feedHtmlUrl == null) {
      return null;
    }
    return FeedModel(feedHtmlUrl,
        customName: feedName,
        customDescription: feedDescription,
        updateTime: DateTime.now(),
        createTime: DateTime.now());
  }

  Future<void> importFeedFromOpml(String opmlContent) async {
    XmlDocument document = XmlDocument.parse(opmlContent);
    XmlElement opmlElement = document.findElements('opml').first;
    XmlElement bodyElement = opmlElement.findElements('body').first;

    var feeds = <FeedModel>[];

    for (var outline in bodyElement.findElements('outline')) {
      List<XmlElement> childOutlines = outline.findElements('outline').toList();
      if (childOutlines.isNotEmpty) {
        // create feed group
        var groupTitle = outline.getAttribute('title');
        var groupText = outline.getAttribute('text');
        var group = FeedGroupModel(
          name: groupTitle,
          description: groupText,
          updateTime: DateTime.now(),
        );
        await DatabaseManager().insertGroup(group);

        // for each child outline, add feed
        for (var childOutline in childOutlines) {
          var feed = handleSingleOutline(childOutline);
          if (feed != null) {
            feed.groupId = group.id;
            feeds.add(feed);
          }
        }
      } else {
        var feed = handleSingleOutline(outline);
        if (feed != null) {
          feeds.add(feed);
        }
      }
    }
    await DatabaseManager().insertFeeds(feeds);
    await fetchFeeds(feeds);
  }

  Future<void> fetchFeeds(List<FeedModel> feeds) async {
    var feedIds = feeds.map((feed) => feed.id).toList();
    List<FeedUpdateRecordModel?> feedLastUpdateRecords =
        await DatabaseManager().getFeedLastUpdateRecord(feedIds);

    var feedsNeedUpdate = <int>[];
    // if there is no update record, feed need to update
    // if last update time is within config hour, feed need to update
    // otherwise, feed don't need to update
    for (var i = 0; i < feeds.length; i++) {
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
      var feed = feeds[i];
      var lastUpdateRecord = feedLastUpdateRecords[i];
      // TODO add error handle
      var content = await HttpService.request(feed.url);
      if (content == null) {
        continue;
      }
      var hash = md5.convert(utf8.encode(content)).toString();
      if (lastUpdateRecord != null &&
          lastUpdateRecord.lastContentHash == hash) {
        continue;
      }

      var feedItems = feed.type != null
          ? parseFeedItems(content, feed)
          : parseFeedItemsAndUpdateFeed(content, feed);

      var feedItemsNeedInsert = <FeedItemModel>[];
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

      var newUpdateRecord = FeedUpdateRecordModel(
          feedId: feed.id,
          lastUpdate: DateTime.now(),
          updateTime: DateTime.now(),
          lastContentHash: hash,
          lastItemPublishTime: newLastItemPublishTime);
      feedItemsNeedInsert = parseCover(feedItemsNeedInsert);
      await DatabaseManager()
          .insertFeedItems(feedItemsNeedInsert, newUpdateRecord);
      downloadHtml(feedItemsNeedInsert);
    }
  }

  // parse feed items from feed content
  List<FeedItemModel> parseFeedItems(String content, FeedModel feed) {
    switch (feed.type) {
      case FeedType.atom:
        var feedRaw = webfeed.AtomFeed.parse(content);
        return _parseAtomItem(feed, feedRaw.items);
      case FeedType.rss:
        var feedRaw = webfeed.RssFeed.parse(content);
        return _parseRssItem(feed, feedRaw.items);
      default:
        return [];
    }
  }

  List<FeedItemModel> parseFeedItemsAndUpdateFeed(
      String content, FeedModel feed) {
    var feedType = getFeedType(content);
    if (feedType == webfeed.FeedType.Rss) {
      var feedRaw = webfeed.RssFeed.parse(content);
      feed.completeByRssFeed(feedRaw);
      var feedItems = _parseRssItem(feed, feedRaw.items);
      DatabaseManager().updateFeed(feed);
      return feedItems;
    } else if (feedType == webfeed.FeedType.Atom) {
      var feedRaw = webfeed.AtomFeed.parse(content);
      feed.completeByAtomFeed(feedRaw);
      var feedItems = _parseAtomItem(feed, feedRaw.items);
      DatabaseManager().updateFeed(feed);
      return feedItems;
    } else {
      return [];
    }
  }

  Future<void> fetchAllFeed() async {
    var allFeed = await DatabaseManager().getAllFeeds();
    await fetchFeeds(allFeed);
  }
}
