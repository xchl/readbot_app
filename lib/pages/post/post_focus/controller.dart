import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:get/get.dart';

class PostFocusController extends GetxController {
  PostFocusController();

  final List<FeedItemModel> _feedItems = List.empty(growable: true);
  final List<FeedModel?> _feeds = List.empty(growable: true);

  int _page = 0;
  String? _feedUrl;

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feeds => _feeds;

  int lastTapIdx = -1;

  // TODO 是否不应该按找时间排？
  refreshFeedItem() async {
    _page = 0;
    _feedItems.clear();
    _feeds.clear();
    var feedItems = await DatabaseManager().getFocusFeedItemsByPage(_page);
    var feeds = await DatabaseManager().getFeedsByUrls(
      feedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(feedItems);
    _feeds.addAll(feeds);
    update(["post_focus"]);
  }

  void onTapItem(FeedItemModel feedItem, int itemIdx) async {
    var content =
        await DatabaseManager().getContentByFeedItemMd5(feedItem.md5String);
    lastTapIdx = itemIdx;
    Get.toNamed(RouteNames.postPostDetail, arguments: {
      'feedItem': feedItem,
      'content': content,
      'fromPage': PageType.focus
    });
  }

  void handleCoverUpdate(Map<int, FeedItemModel> feedItemMap) {
    for (var item in _feedItems) {
      if (feedItemMap.containsKey(item.id)) {
        item.cover = feedItemMap[item.id]!.cover;
      }
    }
    update(["post_focus"]);
  }

  Future<void> appendFeedItem() async {
    _page++;
    var newFeedItems = await DatabaseManager()
        .getFocusFeedItemsByPage(_page, feedUrl: _feedUrl);
    if (newFeedItems.isEmpty) {
      _page--;
      return;
    }
    var newFeed = await DatabaseManager().getFeedsByUrls(
      newFeedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(newFeedItems);
    _feeds.addAll(newFeed);
    update(["post_focus"]);
  }

  void handleRead(FeedItemModel feedItem) {
    if (lastTapIdx >= 0) {
      feedItems[lastTapIdx] = feedItem;
    }
    update(["post_focus"]);
  }

  void onLoadMore() async {
    appendFeedItem();
  }

  @override
  void onReady() {
    super.onReady();
    refreshFeedItem();
  }
}
