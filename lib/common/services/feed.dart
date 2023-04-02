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
      var feed = Feed.fromRssFeed(feedRaw, url);
      var feedItems = _parseRssItem(feed, feedRaw.items);
      return Tuple2(feed, feedItems);
    } else if (feedType == FeedType.Atom) {
      var feedRaw = AtomFeed.parse(xml);
      var feed = Feed.fromAtomFeed(feedRaw, url);
      var feedItems = _parseAtomItem(feed, feedRaw.items);
      return Tuple2(feed, feedItems);
    }
    // TODO Error handle
    return Tuple2(Feed(url), []);
  }

  Future<List<FeedItem>> downloadHtml(List<FeedItem> items) async {
    if (items.isEmpty) {
      return [];
    }
    int idx = 0;
    final headlessInAppWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(items[idx].link!)),
      onWebViewCreated: (controller) {
        debugPrint("hello");
      },
      onConsoleMessage: (controller, consoleMessage) {
        debugPrint("Console Message:, $consoleMessage.message");
      },
      onLoadStart: (controller, url) async {
        debugPrint("Start:, $url");
      },
      onLoadStop: (controller, url) async {
        String htmlContent = await controller.evaluateJavascript(
            source: "document.documentElement.outerHTML;");
        items[idx].content = htmlContent;
        debugPrint(htmlContent);

        if (idx < items.length - 1) {
          idx += 1;
          controller.loadUrl(
              urlRequest: URLRequest(url: Uri.parse(items[idx].link!)));
        }
      },
    );
    await headlessInAppWebView.run();
    headlessInAppWebView.dispose();
    return items;
  }

  parseItemContent(List<FeedItem> items) async {
    List<FeedItem> itemsWithLink =
        items.where((item) => item.link != null).toList();
    List<FeedItem> completeItems = await downloadHtml(itemsWithLink);
    FeedManager().updateFeedItems(completeItems);
  }

  Future<void> addFeedFromUrl(String url) async {
    String xml = await FeedApi.fetchContentFromUrl(url);
    Tuple2<Feed, List<FeedItem>> result = _parseFeed(xml, url);
    await FeedManager().insertFeedAndItems(result.item1, result.item2);
    await parseItemContent(result.item2);
  }

  // @override
  // void onInit() async {
  //   super.onInit();
  //   // 读 Post
  // }

  @override
  Future<void> onReady() async {
    // if (UserService.to.hasActiveAccessToken()) {
    //   await fetchFeedList();
    //   await fetchPostList();
    // }
  }
}
