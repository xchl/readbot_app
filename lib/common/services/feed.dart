import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed/util/function.dart';
import 'package:webfeed/webfeed.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  List<FeedItem> _parseRssItem(Feed feed, List<RssItem>? items) {
    if (items == null) {
      return [];
    }
    return items.map((item) => FeedItem.fromRssItem(item, feed)).toList();
  }

  // parse Atom item
  List<FeedItem> _parseAtomItem(Feed feed, List<AtomItem>? items) {
    if (items == null) {
      return [];
    }
    return items.map((item) => FeedItem.fromAtomItem(item, feed)).toList();
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

  static List<FeedItem> parseFeedItem(List<FeedItem> items) {
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

  Future<void> downloadHtml(List<FeedItem> feedItems) async {
    if (feedItems.isEmpty) return;
    int idx = 0;
    var headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(feedItems[idx].link!)),
      onLoadStop: (controller, url) async {
        final String htmlContent = await controller.evaluateJavascript(
            source: 'document.documentElement.outerHTML');

        var content = Content(
            type: ContentType.Html, content: htmlContent, uri: url.toString());

        FeedManager().insertContent(content);
        debugPrint("Downloaded: $url");
        if (idx < feedItems.length - 1) {
          idx += 1;
          controller.loadUrl(
              urlRequest: URLRequest(url: Uri.parse(feedItems[idx].link!)));
        }
      },
    );
    debugPrint("Download Started!");
    headlessWebView.run();
    debugPrint("Download Stop! $feedItems.length Page");
  }

  Future<void> addFeedFromUrl(String url) async {
    String xml = await FeedApi.fetchContentFromUrl(url);
    Tuple2<Feed, List<FeedItem>> result = _parseFeed(xml, url);
    var feedItems = parseFeedItem(result.item2);
    await FeedManager().insertFeedAndItems(result.item1, feedItems);
    downloadHtml(feedItems);
  }

  Future<void> fetchFeed(Feed feed) async {
    String content = await FeedApi.fetchContentFromUrl(feed.url);
    var feedItems = <FeedItem>[];
    if (feed.type == FeedType.Atom) {
      var feedRaw = AtomFeed.parse(content);
      feedItems = _parseAtomItem(feed, feedRaw.items);
      feedItems = parseFeedItem(feedItems);
    } else if (feed.type == FeedType.Rss) {
      var feedRaw = RssFeed.parse(content);
      feedItems = _parseRssItem(feed, feedRaw.items);
      feedItems = parseFeedItem(feedItems);
    }
    await FeedManager().insertFeedItems(feedItems);
    downloadHtml(feedItems);
  }

  Future<void> fetchAllFeed() async {
    var feeds = await FeedManager().getAllFeeds();
    for (var feed in feeds) {
      await fetchFeed(feed);
    }
  }
}
