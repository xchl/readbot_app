import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 这个表示先将原生端与flutter的接口初始化，然后再处理后续操作，这样能保证代码运行正确。
    var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // 让启动图保持在屏幕
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // 工具类
    await Storage().init();
    Loading();

    // 初始化服务
    Get.put<ConfigService>(ConfigService());
    Get.put<FeedBoxHttpService>(FeedBoxHttpService());
    Get.put<UserService>(UserService());

    // 默认语言
    ConfigService.to.onLocaleUpdate(Translation.fallbackLocale);
  }
}
