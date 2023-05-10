import 'dart:io';

import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedListController extends GetxController {
  FeedListController();

  TextEditingController urlController = TextEditingController();

  TextEditingController groupNameController = TextEditingController();
  TextEditingController groupDescController = TextEditingController();

  TextEditingController feedNameController = TextEditingController();
  TextEditingController feedDescController = TextEditingController();
  FeedGroupModel? modifiedFeedGroup;

  /// 表单 key
  GlobalKey urlFormKey = GlobalKey<FormState>();
  GlobalKey addGroupKey = GlobalKey<FormState>();
  GlobalKey opmlFormKey = GlobalKey<FormState>();
  GlobalKey feedFormKey = GlobalKey<FormState>();

  Map<FeedGroupModel, List<FeedModel>> feedGroupedByGroup = {};

  FeedGroupModel? selectedFeedGroup;
  FeedModel? selectedFeed;

  List<FeedGroupModel> get allGroup => feedGroupedByGroup.keys.toList();

  final defaultFeedGroup = FeedGroupModel(
    name: LocaleKeys.unnameFeedGroup.tr,
  );

  _initData() async {
    List<FeedModel> feeds = await DatabaseManager().getAllFeeds();
    List<FeedGroupModel> feedGroups = await DatabaseManager().getAllGroups();
    Map<String, List<FeedModel>> feedGroupedByGroupName = {};

    feedGroupedByGroup[defaultFeedGroup] = [];
    for (var feed in feeds) {
      if (feed.groupName == null) {
        feedGroupedByGroup[defaultFeedGroup]!.add(feed);
        continue;
      }
      if (feedGroupedByGroupName[feed.groupName] == null) {
        feedGroupedByGroupName[feed.groupName!] = [];
      }
      feedGroupedByGroupName[feed.groupName]!.add(feed);
    }
    for (var group in feedGroups) {
      feedGroupedByGroup[group] = feedGroupedByGroupName[group.name] ?? [];
    }
    if (feedGroupedByGroup.isNotEmpty) {
      selectedFeedGroup = feedGroupedByGroup.keys.first;
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

  Future<void> onGroupSave() async {
    var group = FeedGroupModel(
      name: groupNameController.text,
      description: groupDescController.text,
    );
    if ((addGroupKey.currentState as FormState).validate()) {
      if (selectedFeedGroup != null && selectedFeedGroup!.name != group.name) {
        await DatabaseManager().updateFeedGroup(group, selectedFeedGroup!);
        // TODO 如何不改变顺序
        feedGroupedByGroup[group] = feedGroupedByGroup[selectedFeedGroup] ?? [];
        feedGroupedByGroup.remove(selectedFeedGroup);
      } else {
        await DatabaseManager().insertFeedGroup(group);
        feedGroupedByGroup[group] = [];
      }
      selectedFeedGroup = group;
      Get.back();
      if (UserService.isLogin) {
        SyncService.to.syncPush();
      }
      update(["feed_list"]);
    }
  }

  void onModifyFeedGroup(FeedGroupModel? feedGroup) {
    modifiedFeedGroup = feedGroup;
  }

  void onUnsubscribeFeed() {
    if (selectedFeed == null) return;
    DatabaseManager().deleteFeed(selectedFeed!);
    feedGroupedByGroup[selectedFeedGroup]!.remove(selectedFeed);
    update(["feed_list"]);
    refreshFeedItemPage();
    Get.back();
  }

  void onFeedSave() {
    if ((feedFormKey.currentState as FormState).validate()) {
      selectedFeed!.name = feedNameController.text;
      selectedFeed!.description = feedDescController.text;
      if (modifiedFeedGroup != null && selectedFeedGroup != modifiedFeedGroup) {
        selectedFeed!.groupName = modifiedFeedGroup == defaultFeedGroup
            ? modifiedFeedGroup!.name
            : null;
        feedGroupedByGroup[selectedFeedGroup]!.remove(selectedFeed);
        feedGroupedByGroup[modifiedFeedGroup!]!.add(selectedFeed!);
      }
      DatabaseManager().updateFeed(selectedFeed!);

      update(["feed_list"]);
      Get.back();
      if (UserService.isLogin) {
        SyncService.to.syncPush();
      }
    }
  }

  // refresh current page
  void refreshCurrentPage() {
    _initData();
  }

  void refreshFeedItemPage() {
    Get.find<PostAllController>().refreshFeedItem();
    Get.find<PostFocusController>().refreshFeedItem();
  }

  void onGroupSelected(FeedGroupModel group) {
    selectedFeedGroup = group;
    initGroupForm(group);
    update(["feed_list"]);
  }

  void onFeedSelected(FeedModel feed) {
    selectedFeed = feed;
    initFeedForm(feed);
    update(["feed_list"]);
  }

  void onGroupDelete() async {
    if (selectedFeedGroup == null) return;
    await DatabaseManager().deleteFeedGroup(selectedFeedGroup!);
    feedGroupedByGroup.remove(selectedFeedGroup);
    if (feedGroupedByGroup.isNotEmpty) {
      selectedFeedGroup = feedGroupedByGroup.keys.first;
    }
    Get.back();
    update(["feed_list"]);
    // TODO 数据库删除同步
    if (UserService.isLogin) {
      SyncService.to.syncPush();
    }
  }

  void initGroupForm(FeedGroupModel? feedGroup) {
    if (feedGroup == null) return;
    groupNameController.text = feedGroup.name;
    groupDescController.text = feedGroup.description ?? "";
  }

  void initFeedForm(FeedModel feed) {
    feedNameController.text = feed.name ?? "";
    feedDescController.text = feed.description ?? "";
  }

  void onAddFeed() async {
    if ((urlFormKey.currentState as FormState).validate()) {
      var feed = await DatabaseManager().getFeedByUrl(urlController.text);
      if (feed != null) {
        Loading.toast(LocaleKeys.feedAlreadyExists.tr);
        return;
      }
      try {
        Loading.show();
        await FeedService.to.addFeedFromUrl(urlController.text);
        selectedFeedGroup = defaultFeedGroup;
        Loading.success();
        refreshFeedItemPage();
        refreshCurrentPage();
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
