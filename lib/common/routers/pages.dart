import 'package:feed_inbox_app/pages/index.dart';
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
      name: RouteNames.myMyFeeds,
      page: () => const MyFeedsPage(),
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
      name: RouteNames.stylesButtomSheet,
      page: () => const ButtomSheetPage(),
    ),
    GetPage(
      name: RouteNames.stylesButtons,
      page: () => const ButtonsPage(),
    ),
    GetPage(
      name: RouteNames.stylesCarousel,
      page: () => const CarouselPage(),
    ),
    GetPage(
      name: RouteNames.stylesComponents,
      page: () => const ComponentsPage(),
    ),
    GetPage(
      name: RouteNames.stylesGroupList,
      page: () => const GroupListPage(),
    ),
    GetPage(
      name: RouteNames.stylesIcon,
      page: () => const IconPage(),
    ),
    GetPage(
      name: RouteNames.stylesImage,
      page: () => const ImagePage(),
    ),
    GetPage(
      name: RouteNames.stylesInputs,
      page: () => const InputsPage(),
    ),
    GetPage(
      name: RouteNames.stylesOther,
      page: () => const OtherPage(),
    ),
    GetPage(
      name: RouteNames.stylesStylesIndex,
      page: () => const StylesIndexPage(),
    ),
    GetPage(
      name: RouteNames.stylesText,
      page: () => const TextPage(),
    ),
    GetPage(
      name: RouteNames.stylesTextForm,
      page: () => const TextFormPage(),
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
    GetPage(
      name: RouteNames.systemWelcome,
      page: () => const WelcomePage(),
    ),
  ];
}
