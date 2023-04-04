import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/foundation.dart';
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

  Future<void> addFeedFromUrl(String url) async {
    String xml = await FeedApi.fetchContentFromUrl(url);
    Tuple2<Feed, List<FeedItem>> result = _parseFeed(xml, url);
    // var feedItems = parseFeedItem(result.item2);
    var feedItems = await compute(parseFeedItem, result.item2);
    await FeedManager().insertFeedAndItems(result.item1, feedItems);
  }

  Future<void> fetchFeed(Feed feed) async {
    String content = await FeedApi.fetchContentFromUrl(feed.url);
    if (feed.type == FeedType.Atom) {
      var feedRaw = AtomFeed.parse(content);
      var feedItems = _parseAtomItem(feed, feedRaw.items);
      // feedItems = parseFeedItem(feedItems);
      feedItems = await compute(parseFeedItem, feedItems);
      await FeedManager().insertFeedItems(feedItems);
    } else if (feed.type == FeedType.Rss) {
      var feedRaw = RssFeed.parse(content);
      var feedItems = _parseRssItem(feed, feedRaw.items);
      feedItems = await compute(parseFeedItem, feedItems);
      // feedItems = parseFeedItem(feedItems);
      await FeedManager().insertFeedItems(feedItems);
    }
  }

  Future<void> fetchAllFeed() async {
    var feeds = await FeedManager().getAllFeeds();
    for (var feed in feeds) {
      await fetchFeed(feed);
    }
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
