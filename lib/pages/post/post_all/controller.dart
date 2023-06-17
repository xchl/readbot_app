import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class PostAllController extends GetxController {
  PostAllController();

  int _page = 0;

  String? _feedUrl;

  final ScrollController scrollController = ScrollController();

  final List<FeedItemModel> _feedItems = List.empty(growable: true);
  final List<FeedModel?> _feed = List.empty(growable: true);

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feed => _feed;

  int lastTapIdx = -1;

  bool? _isAllLoaded;
  bool isLoading = false;

  @override
  void onReady() {
    super.onReady();
    refreshFeedItem();
  }

  void turnToFocus(int index) async {
    _feedItems[index].isFocus = true;
    _feedItems[index].focusTime = DateTime.now();
    await DatabaseManager().updateFeedItemNeedSync(_feedItems[index]);
    _feedItems.removeAt(index);
    _feed.removeAt(index);
    SyncService.to.pushToService();
    update(["post_all"]);
    Get.find<PostFocusController>().refreshFeedItem();
  }

  void onTapItem(FeedItemModel feedItem, int itemIdx) async {
    lastTapIdx = itemIdx;
    Get.toNamed(RouteNames.postPostDetail,
        arguments: {'feedItem': feedItem, 'fromPage': PageType.explore});
  }

  void handleCoverUpdate(Map<int, FeedItemModel> feedItemMap) {
    for (var item in _feedItems) {
      debugPrint("update cover");
      if (feedItemMap.containsKey(item.id)) {
        item.cover = feedItemMap[item.id]!.cover;
      }
    }
    update(["post_all"]);
  }

  void handleRead(FeedItemModel feedItem) {
    if (lastTapIdx >= 0) {
      feedItems[lastTapIdx] = feedItem;
      debugPrint("read");
    }
    update(["post_all"]);
  }

  Future<Tuple2<List<FeedItemModel>, List<FeedModel>>> getFeedItems(int page,
      {String? feedUrl}) async {
    List<FeedItemModel> feedItems = await DatabaseManager()
        .getExploreFeedItemsByPage(page, feedUrl: feedUrl);
    List<FeedModel?> feed = await DatabaseManager().getFeedsByUrlsIncludeDelete(
      feedItems,
    );
    List<FeedItemModel> cleanFeedItems = [];
    List<FeedModel> cleanFeed = [];

    // for every feed, if feed is not null, add to cleanFeed and add feedItem to cleanFeedItems
    for (var i = 0; i < feed.length; i++) {
      if (feed[i] != null) {
        cleanFeed.add(feed[i]!);
        cleanFeedItems.add(feedItems[i]);
      }
    }
    return Tuple2(cleanFeedItems, cleanFeed);
  }

  Future<void> refreshFeedItem() async {
    _page = 0;
    _feedItems.clear();
    _feed.clear();
    _isAllLoaded = false;
    final feedItemsAndFeed = await getFeedItems(_page, feedUrl: _feedUrl);
    _feedItems.addAll(feedItemsAndFeed.item1);
    _feed.addAll(feedItemsAndFeed.item2);
    NoticeService.to.clearExplore();
    update(["post_all"]);
  }

  Future<void> appendFeedItem() async {
    _page++;
    final feedItemsAndFeed = await getFeedItems(_page, feedUrl: _feedUrl);
    if (feedItemsAndFeed.item1.isEmpty) {
      _page--;
      _isAllLoaded = true;
      return;
    }
    _feedItems.addAll(feedItemsAndFeed.item1);
    _feed.addAll(feedItemsAndFeed.item2);
    update(["post_all"]);
  }

  void onLoadMore() async {
    if (_isAllLoaded == true || isLoading) {
      return;
    }
    isLoading = true;
    debugPrint("Current Explore FeedItem length: ${feedItems.length}");
    appendFeedItem();
    isLoading = false;
  }

  void onFeedSelect(String? feedUrl) {
    _feedUrl = feedUrl;
    refreshFeedItem();
  }

  String? getSelectedFeed() {
    return _feedUrl;
  }

  void onEndDrawerChanged(bool isOpen) {
    if (isOpen) {
      var mainController = Get.find<MainController>();
      mainController.toHideBottomBar();
    } else {
      var mainController = Get.find<MainController>();
      mainController.toShowBottomBar();
    }
  }

  Future<void> onRefresh() async {
    FeedService.to.globalPullFeed();
  }

  void acceptNotice() {
    update(["post_all"]);
  }
}
