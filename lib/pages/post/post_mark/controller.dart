import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';

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

  void onTapItem(FeedItemModel feedItem, int itemIdx) async {
    Get.toNamed(RouteNames.postPostDetail,
        arguments: {'feedItem': feedItem, 'fromPage': PageType.favorite});
  }

  Future<void> refreshFeedItem() async {
    _page = 0;
    _feedItems.clear();
    _feed.clear();
    var feedItems = await DatabaseManager().getMarkFeedItemsByPage(_page);
    var feed = await DatabaseManager().getFeedsByUrls(
      feedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(feedItems);
    _feed.addAll(feed);
    update(["post_mark"]);
  }

  Future<void> appendFeedItem() async {
    _page++;
    var newFeedItems = await DatabaseManager().getMarkFeedItemsByPage(_page);
    if (newFeedItems.isEmpty) {
      _page--;
      isAllLoaded = true;
      return;
    }
    var newFeed = await DatabaseManager().getFeedsByUrls(
      newFeedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(newFeedItems);
    _feed.addAll(newFeed);
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
