import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  // _initData() {
  //   update(["splash"]);
  // }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (ConfigService.to.isAlreadyOpen) {
        Get.offAllNamed(RouteNames.main);
      } else {
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    _jumpToPage();
    //_initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
