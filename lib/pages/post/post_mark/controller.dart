import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:tuple/tuple.dart';

class PostMarkController extends GetxController {
  PostMarkController();

  int _page = 0;

  final List<FeedItemModel> _feedItems = List.empty(growable: true);
  final List<FeedModel?> _feed = List.empty(growable: true);

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feed => _feed;

  bool? isAllLoaded;
  bool isLoading = false;

  @override
  void onReady() {
    super.onReady();
    refreshFeedItem();
  }

  Future<Tuple2<List<FeedItemModel>, List<FeedModel>>> getFeedItems(int page,
      {String? feedUrl}) async {
    List<FeedItemModel> feedItems =
        await DatabaseManager().getMarkFeedItemsByPage(page);
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

  void onTapItem(FeedItemModel feedItem, int itemIdx) async {
    Get.toNamed(RouteNames.postPostDetail,
        arguments: {'feedItem': feedItem, 'fromPage': PageType.favorite});
  }

  Future<void> refreshFeedItem() async {
    _page = 0;
    _feedItems.clear();
    _feed.clear();

    isAllLoaded = false;

    final feedItemsAndFeed = await getFeedItems(_page);
    _feedItems.addAll(feedItemsAndFeed.item1);
    _feed.addAll(feedItemsAndFeed.item2);

    update(["post_mark"]);
  }

  Future<void> appendFeedItem() async {
    _page++;
    final feedItemsAndFeed = await getFeedItems(_page);
    if (feedItemsAndFeed.item1.isEmpty) {
      _page--;
      isAllLoaded = true;
      return;
    }
    _feedItems.addAll(feedItemsAndFeed.item1);
    _feed.addAll(feedItemsAndFeed.item2);
    update(["post_mark"]);
  }

  void onLoadMore() async {
    if (isAllLoaded == true || isLoading) {
      return;
    }
    isLoading = true;
    debugPrint("Current Mark FeedItem length: ${feedItems.length}");
    appendFeedItem();
    isLoading = false;
  }
}
