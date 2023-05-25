import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:readbot/common/index.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 配置服务
class ConfigService extends GetxService {
  // 这是一个单例写法
  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  late String serverUrl;
  late String privacyUrl;
  late String helpDocUrl;

  // 多语言
  Locale locale = PlatformDispatcher.instance.locale;

  // 主题
  final RxBool _isDarkModel = Get.isDarkMode.obs;
  bool get isDarkModel => _isDarkModel.value;

  // 是否首次打开
  bool get isAlreadyOpen =>
      Storage().getBool(Constants.storageAlreadyOpen) ?? false;

  bool get enableAi => Storage().getBool(Constants.storageEnableAi) ?? false;

  bool get enableAutoSummary =>
      Storage().getBool(Constants.storageEnableAutoSummary) ?? false;

  String? get openAIToken => Storage().getString(Constants.storageOpenAIToken);

  // 是否开启同步
  bool get enableSync => Storage().getBool(Constants.storageEnableSync) ?? true;

  bool get enableReadMode =>
      Storage().getBool(Constants.storageEnableReadMode) ?? true;

  bool get enableAutoDeleteData =>
      Storage().getBool(Constants.storageAutoDeleteData) ?? false;

  int get onlySaveDataDays =>
      Storage().getInt(Constants.storageSaveDataDays) ?? 90;

  String? get openAIProxyUrl =>
      Storage().getString(Constants.storageOpenAIProxyUrl);

  String? get aiModel => Storage().getString(Constants.storageAIModel);

  AIService get aiService =>
      Storage().getString(Constants.storageAiService)?.parseAIService() ??
      AIService.openai;

  bool isAIReady() {
    if (enableAi == false) return false;
    if (aiService == AIService.openai) {
      return openAIToken != null && openAIToken!.isNotEmpty;
    }
    return false;
  }

  bool isAutoSummaryReady() {
    if (isAIReady() == false) return false;
    if (enableAutoSummary == false) return false;
    return true;
  }

  late ClientInfo clientInfo;

  // 标记已打开app
  void setAlreadyOpen() {
    Storage().setBool(Constants.storageAlreadyOpen, true);
  }

  Future<void> saveClientInfo() async {
    await Storage()
        .setString(Constants.clientInfo, jsonEncode(clientInfo.toJson()));
  }

  void setClient() async {
    //todo
    String? clientInfoStr = Storage().getString(Constants.clientInfo);
    if (clientInfoStr == null) {
      clientInfo = await getDeviceInfo();
      await saveClientInfo();
    } else {
      clientInfo = ClientInfo.fromJson(jsonDecode(clientInfoStr))!;
    }
  }

  loadConfig() async {
    // if assets/configs/config.json exist read config.json from assets/configs
    try {
      var configString = await rootBundle.loadString(Constants.configFile);
      var config = jsonDecode(configString);
      serverUrl = config[Constants.serverUrlField];
      privacyUrl = config[Constants.privacyUrlField];
      helpDocUrl = config[Constants.helpDocUrlField];
    } catch (e) {
      LogService.to
          .e('Error occur when loading assets/configs/config.json: $e');
    }
  }

  Future<void> saveSycnOption(bool value) async {
    Storage().setBool(Constants.storageEnableSync, value);
  }

  Future<void> saveReadModeOption(bool value) async {
    Storage().setBool(Constants.storageEnableReadMode, value);
  }

  Future<void> saveAutoDeleteDataOption(bool value) async {
    Storage().setBool(Constants.storageAutoDeleteData, value);
  }

  Future<void> saveOnlySaveDataDays(int value) async {
    Storage().setInt(Constants.storageSaveDataDays, value);
  }

  Future<void> saveEnableAiOption(bool value) async {
    Storage().setBool(Constants.storageEnableAi, value);
  }

  Future<void> saveEnableAutoSummary(bool value) async {
    Storage().setBool(Constants.storageEnableAutoSummary, value);
  }

  Future<void> saveAiService(String value) async {
    Storage().setString(Constants.storageAiService, value);
  }

  Future<void> saveOpenAIToken(String value) async {
    Storage().setString(Constants.storageOpenAIToken, value);
  }

  Future<void> saveOpenAIProxyUrl(String value) async {
    Storage().setString(Constants.storageOpenAIProxyUrl, value);
  }

  @override
  Future<ConfigService> onInit() async {
    super.onInit();
    setClient();
    getPlatform();
    initLocale();
    initTheme();
    await loadConfig();
    return this;
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 初始语言
  void initLocale() {
    String? langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode == null) return;
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
    var name = '';
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        name = androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        name = iosInfo.name ?? "IOS";
      } else if (Platform.isWindows) {
        WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
        name = windowsInfo.computerName;
      } else if (Platform.isMacOS) {
        MacOsDeviceInfo macOsInfo = await deviceInfo.macOsInfo;
        name = macOsInfo.computerName;
      }
    } catch (e) {
      debugPrint('Failed to get device info: $e');
      clientInfo.clientName = "Unknown";
    }
    return ClientInfo(clientName: name);
  }
}
