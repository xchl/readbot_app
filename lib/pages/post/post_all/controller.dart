import 'dart:io';

import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/system/main/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum FeedAddButtonFunc {
  addFromUrl,
  importFromOpml,
}

class PostAllController extends GetxController {
  PostAllController();

  /// 定义输入控制器
  TextEditingController urlController = TextEditingController();

  /// 表单 key
  GlobalKey urlFromKey = GlobalKey<FormState>();
  GlobalKey opmlFormKey = GlobalKey<FormState>();

  int _page = 0;

  _initData() async {
    _feedItems = await DatabaseManager().getExploreFeedItemsByPage(_page);
    update(["post_all"]);
  }

  List<FeedItem> _feedItems = [];

  List<FeedItem> get feedItems => _feedItems;

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void onAddFeed() async {
    if ((urlFromKey.currentState as FormState).validate()) {
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
    await DatabaseManager().updateFeedItem(_feedItems[index]);
    _feedItems.removeAt(index);
    update(["post_all"]);
  }

  void onTapItem(FeedItem feedItem) {
    Get.toNamed(RouteNames.postPostDetail, arguments: {'feedItem': feedItem});
  }

  Future<void> refreshFeedItem() async {
    _page = 0;
    _feedItems = await DatabaseManager().getExploreFeedItemsByPage(_page);
  }

  Future<void> appendFeedItem() async {
    _page++;
    var newFeedItems = await DatabaseManager().getExploreFeedItemsByPage(_page);
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

  Future<void> onFeedSelect(int feedId) async {
    _feedItems = await DatabaseManager().getExploreFeedItemsByFeedId(feedId);
    update(["post_all"]);
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

  Future<void> onImportFromOpml() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // type: FileType.custom,
        // allowedExtensions: ['opml'],
        );

    if (result != null) {
      File file = File(result.files.single.path!);
      String contents = await file.readAsString();
      try {
        Loading.show();
        await FeedService.to.importFeedFromOpml(contents);
        Loading.success();
      } catch (error) {
        // TODO 处理错误
        debugPrint(error.toString());
      }
    }
  }

  void openDrawer() {}

  Future<void> onRefresh() async {
    try {
      await FeedService.to.fetchAllFeed();
      refreshFeedItem();
      update(["post_all"]);
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
