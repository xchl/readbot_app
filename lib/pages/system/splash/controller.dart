import 'package:readbot/common/index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  void onTap() {}

  _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (!ConfigService.to.isAlreadyOpen) {
        Get.offAllNamed(RouteNames.systemWelcome);
      } else {
        Get.offAllNamed(RouteNames.systemMain);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    _jumpToPage();
  }
}
