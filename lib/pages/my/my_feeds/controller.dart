import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFeedsController extends GetxController {
  MyFeedsController();

  /// 定义输入控制器
  TextEditingController urlController = TextEditingController();

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  _initData() {
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

        // api 请求
        FeedInfo res = await FeedApi.addExistSingle(FeedInfo(
          url: urlController.text,
        ));

        print(res);

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
