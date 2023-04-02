import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
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

  List<FeedItem> parseFeedItem(List<FeedItem> items) {
    return items.map((item) {
      if (item.description == null) {
        return item;
      }
      var desc = item.description!;
      var imgSrc = matchImgSrcInHtml(desc);
      if (imgSrc != null) {
        item.cover = imgSrc;
      }
      return item;
    }).toList();
  }

  Future<void> addFeedFromUrl(String url) async {
    String xml = await FeedApi.fetchContentFromUrl(url);
    Tuple2<Feed, List<FeedItem>> result = _parseFeed(xml, url);
    var feedItems = parseFeedItem(result.item2);
    await FeedManager().insertFeedAndItems(result.item1, feedItems);
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
