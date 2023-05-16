import 'package:readbot/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

// 路由 Pages
class RoutePages {
  static final RouteObservers<Route> observer = RouteObservers();
  static List<String> history = [];
  // 列表
  static List<GetPage> list = [
    // app 首页
    GetPage(
      name: RouteNames.feeds,
      page: () => const FeedListPage(),
    ),
    GetPage(name: RouteNames.myAiSetting, page: () => const AiSettingPage()),
    GetPage(
      name: RouteNames.myMyIndex,
      page: () => const MyIndexPage(),
    ),
    GetPage(
      name: RouteNames.postPostAll,
      page: () => const PostAllPage(),
    ),
    GetPage(
      name: RouteNames.postPostDetail,
      page: () => const PostDetailPage(),
    ),
    GetPage(
      name: RouteNames.postPostFocus,
      page: () => const PostFocusPage(),
    ),
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.systemMain,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteNames.systemRegister,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: RouteNames.systemRegisterPin,
      page: () => const RegisterPinPage(),
    ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.systemUserAgreement,
      page: () => const UserAgreementPage(),
    ),
  ];
}
