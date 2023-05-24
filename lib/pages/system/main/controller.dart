import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:readbot/pages/index.dart';

class MainController extends GetxController {
  MainController();

  // 分页管理
  final PageController pageController = PageController();
  final ScrollController scrollController = ScrollController();

  var showBottomBar = true;

  // 当前的 tab index
  int currentIndex = 0;

  // 导航栏切换
  void onIndexChanged(int index) {
    currentIndex = index;
    update(['navigation']);
  }

  void toHideBottomBar() {
    showBottomBar = false;
    update(['main']);
  }

  void toShowBottomBar() {
    showBottomBar = true;
    update(['main']);
  }

  void onJumpToPage(int page) {
    pageController.jumpToPage(page);
  }

  void onRefreshPage(int page) {
    if (page == 1) {
      debugPrint(
          "Notice: ${NoticeService.to.exploreUpdateCount} explore need update");
      if (NoticeService.to.exploreUpdateCount > 0) {
        Get.find<PostAllController>().refreshFeedItem();
      }
    }
  }

  void onEndDrawerChanged(bool isOpen) {
    if (isOpen) {
      debugPrint('Hello Drawer');
    } else {
      debugPrint('Bye Drawer');
    }
  }

  _initData() async {
    await UserService.to.tryLogin();
    SyncService.to.pullFromService();
    SyncService.to.pushToService();
    update(["main"]);
  }

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    // 释放页控制器
    pageController.dispose();
  }

  void acceptNotice() {
    update(["navigation"]);
  }
}
