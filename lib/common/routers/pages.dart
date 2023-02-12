import 'package:feed_inbox_app/pages/system/login/index.dart';
import 'package:feed_inbox_app/pages/system/splash/index.dart';
import 'package:get/get.dart';

// 路由 Pages
class RoutePages {
  // 列表
  static List<GetPage> list = [
    GetPage(
      name: "/",
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: "/splash",
      page: () => const SplashPage(),
    ),
  ];
}
