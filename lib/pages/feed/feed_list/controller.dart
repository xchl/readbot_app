import 'dart:io';

import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedListController extends GetxController {
  FeedListController();

  TextEditingController urlController = TextEditingController();

  /// 表单 key
  GlobalKey urlFromKey = GlobalKey<FormState>();
  GlobalKey opmlFormKey = GlobalKey<FormState>();

  Map<FeedGroupModel, List<FeedModel>> feedGroupedByGroup = {};

  _initData() async {
    List<FeedModel> feeds = await DatabaseManager().getAllFeeds();
    List<FeedGroupModel> feedGroups = await DatabaseManager().getAllGroups();
    Map<String, List<FeedModel>> feedGroupedByGroupName = {};
    // TODO 优化
    FeedGroupModel unnamedGroup =
        FeedGroupModel(name: LocaleKeys.unnameFeedGroup.tr, isSynced: false);
    feedGroupedByGroup[unnamedGroup] = [];
    for (var feed in feeds) {
      if (feed.groupName == null) {
        feedGroupedByGroup[unnamedGroup]!.add(feed);
        continue;
      }
      if (feedGroupedByGroupName[feed.groupName] == null) {
        feedGroupedByGroupName[feed.groupName!] = [];
      }
      feedGroupedByGroupName[feed.groupName]!.add(feed);
    }
    for (var group in feedGroups) {
      feedGroupedByGroup[group] = feedGroupedByGroupName[group.id] ?? [];
    }
    update(["feed_list"]);
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
        Get.find<PostAllController>().refreshFeedItem();
        if (UserService.isLogin) {
          SyncService.to.syncPush();
        }
      } catch (error) {
        Loading.error(LocaleKeys.importFromOpmlError.tr);
      }
    }
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
        Get.find<PostAllController>().refreshFeedItem();
        Get.back();
        if (UserService.isLogin) {
          SyncService.to.syncPush();
        }
      } finally {
        Loading.dismiss();
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
