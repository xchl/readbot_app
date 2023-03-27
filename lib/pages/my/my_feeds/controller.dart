import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFeedsController extends GetxController {
  MyFeedsController();

  /// 定义输入控制器
  TextEditingController urlController = TextEditingController();

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  _initData() async {
    await FeedService.to.fetchFeedList();
    update(["my_feeds"]);
  }

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

        var feed = FeedInfo(
          url: urlController.text,
        );
        await FeedService.to.addFeed(feed);

        Loading.success();
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
