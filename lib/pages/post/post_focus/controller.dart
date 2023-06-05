import 'package:flutter/foundation.dart';
import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:get/get.dart';

class PostFocusController extends GetxController {
  PostFocusController();

  final List<FeedItemModel> _feedItems =
      List<FeedItemModel>.empty(growable: true);
  final List<FeedModel?> _feeds = List.empty(growable: true);

  int _page = 0;
  String? _feedUrl;
  bool? _isAllLoaded;

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feeds => _feeds;

  int lastTapIdx = -1;

  refreshFeedItem() async {
    _page = 0;
    _feedItems.clear();
    _feeds.clear();
    _isAllLoaded = false;
    var feedItems = await DatabaseManager().getFocusFeedItemsByPage(_page);
    var feeds = await DatabaseManager().getFeedsByUrls(
      feedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(feedItems);
    _feeds.addAll(feeds);
    update(["post_focus"]);
    NoticeService.to.clearFocus();
    autoSummary(_feedItems);
  }

  void autoSummary(List<FeedItemModel> feedItems) {
    if (feedItems.isNotEmpty && ConfigService.to.isAutoSummaryReady()) {
      AIQueryService.summaryFeedItems(
          _feedItems.where((element) => element.summaryAlgo == null).toList());
    }
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
      _isAllLoaded = true;
      return;
    }
    var newFeed = await DatabaseManager().getFeedsByUrls(
      newFeedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(newFeedItems);
    _feeds.addAll(newFeed);
    update(["post_focus"]);
    autoSummary(newFeedItems);
  }

  void refreshCurrentPage() {
    update(["post_focus"]);
  }

  void handleRead(FeedItemModel feedItem) {
    if (lastTapIdx >= 0) {
      feedItems[lastTapIdx] = feedItem;
    }
    update(["post_focus"]);
  }

  void onLoadMore() async {
    if (_isAllLoaded == true) {
      return;
    }
    debugPrint("Current Focus FeedItem length: ${feedItems.length}");
    appendFeedItem();
  }

  @override
  void onReady() {
    super.onReady();
    refreshFeedItem();
  }

  Future<void> onRefresh() async {
    await FeedService.to.globalPullFeed();
    refreshFeedItem();
  }
}
