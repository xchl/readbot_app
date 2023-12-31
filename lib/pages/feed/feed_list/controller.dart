import 'dart:io';

import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
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

  FeedModel? selectedFeed;

  List<FeedGroupModel> get allGroup => feedGroupedByGroup.keys.toList();

  final defaultFeedGroup = FeedGroupModel(
    name: LocaleKeys.unnameFeedGroup.tr,
  );

  FeedGroupModel? selectedFeedGroup;

  _initData() async {
    feedGroupedByGroup = {};
    List<FeedModel> feeds = await DatabaseManager().getAllFeeds();
    List<FeedGroupModel> feedGroups = await DatabaseManager().getAllGroups();
    Map<String, List<FeedModel>> feedGroupedByGroupName = {};

    if (feeds.isEmpty) return;

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
    selectedFeedGroup = defaultFeedGroup;
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
        refreshFeedItemPage();
        refreshCurrentPage();
        Loading.success();
        Get.find<PostAllController>().refreshFeedItem();
        SyncService.to.pushToService();
      } catch (error) {
        Loading.error(LocaleKeys.importFromOpmlError.tr);
      }
    }
  }

  Future<void> onGroupSave(bool isEdit) async {
    if ((addGroupKey.currentState as FormState).validate()) {
      var group = FeedGroupModel(
        name: groupNameController.text,
        description: groupDescController.text,
      );
      if (isEdit) {
        await DatabaseManager().updateFeedGroup(group, selectedFeedGroup!);
        feedGroupedByGroup[group] = feedGroupedByGroup[selectedFeedGroup] ?? [];
        feedGroupedByGroup.remove(selectedFeedGroup);
        selectedFeedGroup = group;
      } else {
        var existGroup = await DatabaseManager().findGroup(group.name);
        if (existGroup != null) {
          Loading.error(LocaleKeys.groupExistError.tr);
        } else {
          await DatabaseManager().insertFeedGroup(group);
          feedGroupedByGroup[group] = [];
          selectedFeedGroup = group;
        }
      }

      Get.back();
      SyncService.to.pushToService();
      update(["feed_list"]);
    }
  }

  void onModifyFeedGroup(FeedGroupModel? feedGroup) {
    modifiedFeedGroup = feedGroup;
  }

  void onUnsubscribeFeed() async {
    if (selectedFeed == null) return;
    await DatabaseManager().deleteFeed(selectedFeed!);
    feedGroupedByGroup[selectedFeedGroup]!.remove(selectedFeed);
    SyncService.to.pushToService();
    update(["feed_list"]);
    refreshFeedItemPage();
    Get.back();
  }

  void onFeedSave() async {
    if ((feedFormKey.currentState as FormState).validate()) {
      if (selectedFeed!.name != feedNameController.text) {
        selectedFeed!.customName = feedNameController.text;
      }
      selectedFeed!.description = feedDescController.text;
      if (modifiedFeedGroup != null && selectedFeedGroup != modifiedFeedGroup) {
        selectedFeed!.groupName = modifiedFeedGroup != defaultFeedGroup
            ? modifiedFeedGroup!.name
            : null;
        feedGroupedByGroup[selectedFeedGroup]!.remove(selectedFeed);
        feedGroupedByGroup[modifiedFeedGroup!]!.add(selectedFeed!);
      }
      update(["feed_list"]);
      await DatabaseManager().updateFeed(selectedFeed!);
      SyncService.to.pushToService();
      Get.back();
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
    SyncService.to.pushToService();
  }

  void initGroupForm(FeedGroupModel? feedGroup) {
    if (feedGroup == null) return;
    groupNameController.text = feedGroup.name;
    groupDescController.text = feedGroup.description ?? "";
  }

  // clear Group form
  void clearGroupForm() {
    groupNameController.text = "";
    groupDescController.text = "";
  }

  void initFeedForm(FeedModel feed) {
    feedNameController.text = feed.title;
    feedDescController.text = feed.description ?? "";
  }

  // clear Url form
  void clearUrlForm() {
    urlController.text = "";
  }

  void acceptNotice() {
    refreshCurrentPage();
  }

  void onAddFeed() async {
    if ((urlFormKey.currentState as FormState).validate()) {
      var feed = await DatabaseManager().getFeedByUrl(urlController.text);
      if (feed != null) {
        Loading.toast(LocaleKeys.feedAlreadyExists.tr);
        return;
      }
      Loading.show();
      bool isSuccess = await FeedService.to.addFeedFromUrl(urlController.text);
      if (isSuccess) {
        selectedFeedGroup = defaultFeedGroup;
        Loading.success();
        refreshFeedItemPage();
        refreshCurrentPage();
        SyncService.to.pushToService();
      } else {
        Loading.error(LocaleKeys.addFeedError.tr);
      }
      Loading.dismiss();
      Get.back();
    }
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    groupNameController.dispose();
    groupDescController.dispose();
    feedNameController.dispose();
    feedDescController.dispose();
    urlController.dispose();
  }
}
