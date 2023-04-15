import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDrawerController extends GetxController {
  PostDrawerController(this._subPage);

  final SubPage _subPage;
  Map<FeedGroupModel, List<FeedModel>> feedGroupedByGroup = {};

  int? selectedFeedId;

  _initData() async {
    List<FeedModel> feeds = await DatabaseManager().getAllFeeds();
    List<FeedGroupModel> feedGroups = await DatabaseManager().getAllGroups();
    Map<int, List<FeedModel>> feedGroupedByGroupId = {};
    for (var feed in feeds) {
      if (feedGroupedByGroupId[feed.groupId] == null) {
        feedGroupedByGroupId[feed.groupId!] = [];
      }
      feedGroupedByGroupId[feed.groupId]!.add(feed);
    }
    for (var group in feedGroups) {
      feedGroupedByGroup[group] = feedGroupedByGroupId[group.id] ?? [];
    }
    update(["post_drawer"]);
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void onFeedSelect(int feedId) async {
    if (selectedFeedId != null) {
      selectedFeedId = null;
    } else {
      selectedFeedId = feedId;
    }
    update(["post_drawer"]);
    if (_subPage == SubPage.explore) {
      await Get.find<PostAllController>().onFeedSelect(selectedFeedId);
    }
  }
}
