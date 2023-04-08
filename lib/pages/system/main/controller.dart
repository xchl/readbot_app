import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void onJumpToPage(int page) async {
    pageController.jumpToPage(page);
  }

  void onEndDrawerChanged(bool isOpen) {
    if (isOpen) {
      debugPrint('Hello Drawer');
    } else {
      debugPrint('Bye Drawer');
    }
  }

  _initData() {
    // 读取用户 profile
    // await UserService.to.getProfile();

    // 测试用
    // Get.toNamed(RouteNames.systemLogin);
    update(["main"]);
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

  @override
  void onClose() {
    super.onClose();
    // 释放页控制器
    pageController.dispose();
  }
}
