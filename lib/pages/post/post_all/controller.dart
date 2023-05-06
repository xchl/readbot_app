import 'dart:io';

import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
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

  // _initData() async {
  //   var feedItems = await DatabaseManager().getExploreFeedItemsByPage(_page);
  //   var feed = await DatabaseManager().getFeedsByUrls(
  //     feedItems.map((e) => e.feedUrl).toList(),
  //   );
  //   _feedItems.addAll(feedItems);
  //   _feed.addAll(feed);
  //   update(["post_all"]);
  // }

  final List<FeedItemModel> _feedItems = List.empty(growable: true);
  final List<FeedModel?> _feed = List.empty(growable: true);

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feed => _feed;

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    refreshFeedItem();
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
        refreshFeedItem();
        Get.back();
        if (UserService.isLogin) {
          SyncService.to.syncPush();
        }
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
    if (UserService.isLogin) {
      SyncService.to.syncPush();
    }
    update(["post_all"]);
    Get.find<PostFocusController>().refreshFeedItem();
  }

  void onTapItem(FeedItemModel feedItem) async {
    var content =
        await DatabaseManager().getContentByFeedItemMd5(feedItem.md5String);
    Get.toNamed(RouteNames.postPostDetail,
        arguments: {'feedItem': feedItem, 'content': content});
  }

  Future<void> refreshFeedItem() async {
    _page = 0;
    _feedItems.clear();
    _feed.clear();
    var feedItems = await DatabaseManager()
        .getExploreFeedItemsByPage(_page, feedUrl: _feedUrl);
    var feed = await DatabaseManager().getFeedsByUrls(
      feedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(feedItems);
    _feed.addAll(feed);
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
    appendFeedItem();
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
        if (UserService.isLogin) {
          SyncService.to.syncPush();
        }
      } catch (error) {
        Loading.error(LocaleKeys.importFromOpmlError.tr);
      }
    }
  }

  Future<void> onRefresh() async {
    try {
      await FeedService.to.fetchAllFeed();
      refreshFeedItem();
      if (UserService.isLogin) {
        SyncService.to.syncPush();
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
