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

  String? _feedUrl;

  _initData() async {
    _feedItems = await DatabaseManager().getExploreFeedItemsByPage(_page);
    _feed = await DatabaseManager().getFeedsByUrls(
      _feedItems.map((e) => e.feedUrl).toList(),
    );
    update(["post_all"]);
  }

  List<FeedItemModel> _feedItems = [];
  List<FeedModel?> _feed = [];

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feed => _feed;

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void onAddFeed() async {
    if ((urlFromKey.currentState as FormState).validate()) {
      var feed = await DatabaseManager().getFeedByUrl(urlController.text);
      if (feed != null) {
        Loading.toast(LocaleKeys.feedAlreadyExists.tr);
        return;
      }
      try {
        Loading.show();
        await FeedService.to.addFeedFromUrl(urlController.text);
        Loading.success();
        await refreshFeedItem();
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
    _feed.removeAt(index);
    update(["post_all"]);
  }

  void onTapItem(FeedItemModel feedItem) async {
    var content =
        await DatabaseManager().getContentByFeedItemMd5(feedItem.md5String);
    Get.toNamed(RouteNames.postPostDetail,
        arguments: {'feedItem': feedItem, 'content': content});
  }

  Future<void> refreshFeedItem() async {
    _page = 0;
    _feedItems = await DatabaseManager()
        .getExploreFeedItemsByPage(_page, feedUrl: _feedUrl);
    _feed = await DatabaseManager().getFeedsByUrls(
      _feedItems.map((e) => e.feedUrl).toList(),
    );
    update(["post_all"]);
  }

  Future<void> appendFeedItem() async {
    _page++;
    var newFeedItems = await DatabaseManager()
        .getExploreFeedItemsByPage(_page, feedUrl: _feedUrl);
    if (newFeedItems.isEmpty) {
      _page--;
      return;
    }
    var newFeed = await DatabaseManager().getFeedsByUrls(
      newFeedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(newFeedItems);
    _feed.addAll(newFeed);
    update(["post_all"]);
  }

  void onLoadMore() async {
    try {
      appendFeedItem();
    } catch (error) {
      // do nothing
    }
  }

  Future<void> onFeedSelect(String? feedUrl) async {
    _feedUrl = feedUrl;
    refreshFeedItem();
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
      type: FileType.custom,
      allowedExtensions: ['xml', 'opml'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String contents = await file.readAsString();
      try {
        Loading.show();
        await FeedService.to.importFeedFromOpml(contents);
        Loading.success();
        refreshFeedItem();
      } catch (error) {
        Loading.error(LocaleKeys.importFromOpmlError.tr);
      }
    }
  }

  Future<void> onRefresh() async {
    try {
      await FeedService.to.fetchAllFeed();
      refreshFeedItem();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
