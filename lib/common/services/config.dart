import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/models/proto/model.pbserver.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 配置服务
class ConfigService extends GetxService {
  // 这是一个单例写法
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  // 多语言
  Locale locale = PlatformDispatcher.instance.locale;

  // 主题
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  // 是否首次打开
  bool get isAlreadyOpen => Storage().getBool(Constants.storageAlreadyOpen);

  late ClientInfo clientInfo;

  // 标记已打开app
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageAlreadyOpen, true);
  }

  Future<void> saveClientInfo() async {
    await Storage()
        .setString(Constants.clientInfo, jsonEncode(clientInfo.toProto3Json()));
  }

  void setClient() async {
    //todo
    String clientInfoStr = Storage().getString(Constants.clientInfo);
    if (clientInfoStr == '') {
      clientInfo = await getDeviceInfo();
      await saveClientInfo();
    } else {
      clientInfo = ClientInfo()..mergeFromProto3Json(jsonDecode(clientInfoStr));
    }
  }

  // 初始化
  Future<ConfigService> init() async {
    await getPlatform();
    return this;
  }

  @override
  void onInit() {
    super.onInit();
    setClient();
    getPlatform();
    initLocale();
    initTheme();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始语言
  void initLocale() {
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
  }

  // 更改语言
  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  // 切换 theme
  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(
      _isDarkModel.value == true ? AppTheme.dark : AppTheme.light,
    );
    await Storage().setString(Constants.storageThemeCode,
        _isDarkModel.value == true ? "dark" : "light");
  }

  // 初始 theme
  void initTheme() {
    var themeCode = Storage().getString(Constants.storageThemeCode);
    _isDarkModel.value = themeCode == "dark" ? true : false;
    Get.changeTheme(
      themeCode == "dark" ? AppTheme.dark : AppTheme.light,
    );
  }

  Future<ClientInfo> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var clientInfo = ClientInfo();
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        clientInfo.clientName = androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        clientInfo.clientName = iosInfo.name ?? "IOS";
      } else if (Platform.isWindows) {
        WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
        clientInfo.clientName = windowsInfo.computerName;
      } else if (Platform.isMacOS) {
        MacOsDeviceInfo macOsInfo = await deviceInfo.macOsInfo;
        clientInfo.clientName = macOsInfo.computerName;
      }
    } catch (e) {
      debugPrint('Failed to get device info: $e');
      clientInfo.clientName = "Unknown";
    }
    return clientInfo;
  }
}
