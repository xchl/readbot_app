import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostAllController extends GetxController {
  PostAllController();

  /// 定义输入控制器
  TextEditingController urlController = TextEditingController();

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  int _page = 0;

  _initData() async {
    _feedItems = await FeedManager().getExploreFeedItemsByPage(_page);
    update(["post_all"]);
  }

  List<FeedItem> _feedItems = [];

  List<FeedItem> get feedItems => _feedItems;

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void onAddFeed() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();
        await FeedService.to.addFeedFromUrl(urlController.text);
        Loading.success();
        refreshFeedItem();
        update(["post_all"]);
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  void turnToFocus(int index) async {
    _feedItems[index].isFocus = true;
    await FeedManager().updateFeedItem(_feedItems[index]);
    _feedItems.removeAt(index);
    update(["post_all"]);
  }

  void onTapItem(FeedItem feedItem) {
    Get.toNamed(RouteNames.postPostDetail, arguments: {'feedItem': feedItem});
  }

  Future<void> refreshFeedItem() async {
    _page = 0;
    _feedItems = await FeedManager().getExploreFeedItemsByPage(_page);
  }

  Future<void> appendFeedItem() async {
    _page++;
    var newFeedItems = await FeedManager().getExploreFeedItemsByPage(_page);
    _feedItems.addAll(newFeedItems);
  }

  void onLoadMore() async {
    try {
      appendFeedItem();
      update(["post_all"]);
    } catch (error) {
      // do nothing
    }
  }

  Future<void> onRefresh() async {
    try {
      await FeedService.to.fetchAllFeed();
      refreshFeedItem();
      // refreshController.refreshCompleted();
      update(["post_all"]);
    } catch (error) {
      // refreshController.refreshFailed();
    }
  }
}
