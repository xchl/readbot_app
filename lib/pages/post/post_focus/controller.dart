import 'package:flutter/foundation.dart';
import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class PostFocusController extends GetxController {
  PostFocusController();

  final List<FeedItemModel> _feedItems =
      List<FeedItemModel>.empty(growable: true);
  final List<FeedModel?> _feeds = List.empty(growable: true);

  int _page = 0;
  String? _feedUrl;
  bool? _isAllLoaded;
  bool isLoading = false;

  bool isUserConfused = false;

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feeds => _feeds;

  int lastTapIdx = -1;

  Future<Tuple2<List<FeedItemModel>, List<FeedModel>>> getFeedItems(int page,
      {String? feedUrl}) async {
    List<FeedItemModel> feedItems =
        await DatabaseManager().getFocusFeedItemsByPage(page, feedUrl: feedUrl);
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

  refreshFeedItem() async {
    // TODO isUserConfused放在这里有点难看
    var feedItemCount = await DatabaseManager().feedItemTableSize();
    if (feedItemCount == 0) {
      isUserConfused = true;
      update(["post_focus"]);
      return;
    } else {
      isUserConfused = false;
    }

    _page = 0;
    _feedItems.clear();
    _feeds.clear();
    _isAllLoaded = false;

    final feedItemsAndFeed = await getFeedItems(_page, feedUrl: _feedUrl);
    _feedItems.addAll(feedItemsAndFeed.item1);
    _feeds.addAll(feedItemsAndFeed.item2);

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
    final feedItemsAndFeed = await getFeedItems(_page, feedUrl: _feedUrl);

    if (feedItemsAndFeed.item1.isEmpty) {
      _page--;
      _isAllLoaded = true;
      return;
    }

    _feedItems.addAll(feedItemsAndFeed.item1);
    _feeds.addAll(feedItemsAndFeed.item2);
    update(["post_focus"]);
    autoSummary(feedItemsAndFeed.item1);
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
    if (_isAllLoaded == true || isLoading) {
      return;
    }
    isLoading = true;
    debugPrint("Current Focus FeedItem length: ${feedItems.length}");
    appendFeedItem();
    isLoading = false;
  }

  @override
  void onReady() async {
    super.onReady();
    refreshFeedItem();
  }

  Future<void> onRefresh() async {
    FeedService.to.globalPullFeed();
    // refreshFeedItem();
  }

  void acceptNotice() {
    update(["post_focus"]);
  }
}
