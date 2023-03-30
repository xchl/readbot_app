import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/services/feed_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFeedsController extends GetxController {
  MyFeedsController();

  /// 定义输入控制器
  TextEditingController urlController = TextEditingController();

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  List<Feed> _feedList = [];

  List<Feed> get feedList => _feedList;

  void _initData() async {
    _feedList = await FeedManager().getAllFeeds();
    update(["my_feeds"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  onReady() {
    super.onReady();
    _initData();
  }

  void onAddFeed() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        await FeedService.to.addFeedFromUrl(urlController.text);

        Loading.success();
        _feedList = await FeedManager().getAllFeeds();

        update(["my_feeds"]);
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    urlController.dispose();
  }
}
