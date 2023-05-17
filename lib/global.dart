import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 这个表示先将原生端与flutter的接口初始化，然后再处理后续操作，这样能保证代码运行正确。
    var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // 让启动图保持在屏幕
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // 系统样式
    setSystemUi();

    // 工具类
    await Storage().init();
    await DatabaseManager().init();

    // 初始化服务
    Get.put<LogService>(LogService());
    await Get.putAsync<ConfigService>(() => ConfigService().onInit());
    Get.put<HttpService>(HttpService());
    Get.put<UserService>(UserService());
    Get.put<FeedService>(FeedService());
    Get.put<SyncService>(SyncService());
    Get.put<AIQueryService>(AIQueryService());

    // 阅读模式
    ReadModeStyle.fromConfig(
      fontSize: 16,
    );

    // 删除历史数据
    if (ConfigService.to.enableAutoDeleteData) {
      DatabaseManager().deleteHistoryData(ConfigService.to.onlySaveDataDays);
    }

    // 默认语言
    ConfigService.to.onLocaleUpdate(Translation.fallbackLocale);
  }

  // 系统样式
  static void setSystemUi() {
    if (GetPlatform.isMobile) {
      // 屏幕方向 竖直上
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      // 透明状态栏
      // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent, // transparent status bar
      // ));
    }

    if (GetPlatform.isAndroid) {
      // 去除顶部系统下拉和底部系统按键
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      // 去掉底部系统按键
      // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      //     overlays: [SystemUiOverlay.bottom]);

      // 自定义样式
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        // 顶部状态栏颜色
        statusBarColor: Colors.transparent,
        // 该属性仅用于 iOS 设备顶部状态栏亮度
        // statusBarBrightness: Brightness.light,
        // 顶部状态栏图标的亮度
        // statusBarIconBrightness: Brightness.light,

        // 底部状态栏与主内容分割线颜色
        systemNavigationBarDividerColor: Colors.transparent,
        // 底部状态栏颜色
        systemNavigationBarColor: Colors.white,
        // 底部状态栏图标样式
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
