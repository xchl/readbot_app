import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  bool isNightMode = ConfigService().isDarkModel;

  bool enableSync = ConfigService().enableSync;

  bool enableReadMode = ConfigService().enableReadMode;

  bool enableAutoDeleteData = ConfigService().enableAutoDeleteData;

  int onlySaveDataDays = ConfigService().onlySaveDataDays;

  final List<int> onlySaveDataDaysList = [30, 60, 90, 180];

  final destroyConfirmCode = "YES";

  /// 定义输入控制器
  TextEditingController destroyConfirmInput = TextEditingController();

  _initData() async {
    update(["my_index"]);
  }

  void onChangeTheme(bool isOn) async {
    isNightMode = isOn;
    await ConfigService.to.switchThemeModel();
    update(["my_index"]);
  }

  void onSyncChange(bool isOn) async {
    enableSync = isOn;
    await ConfigService.to.saveSycnOption(enableSync);
    update(["my_index"]);
  }

  void onReadModeChange(bool isOn) async {
    enableReadMode = isOn;
    await ConfigService.to.saveReadModeOption(enableReadMode);
    update(["my_index"]);
  }

  void onAutoDeleteDataChange(bool isOn) async {
    enableAutoDeleteData = isOn;
    await ConfigService.to.saveAutoDeleteDataOption(enableAutoDeleteData);
    update(["my_index"]);
  }

  void onSelectAutoDeleteDay(int? days) async {
    if (days == null) return;
    onlySaveDataDays = days;
    await ConfigService.to.saveOnlySaveDataDays(onlySaveDataDays);
    update(["my_index"]);
  }

  Future<void> destory() async {
    if (UserService.isLogin) {
      Loading.show();
      bool res = await UserApi.destoryAccout();
      if (!res) {
        Loading.error(LocaleKeys.destoryAccoutError.tr);
      } else {
        Loading.success();
      }
      Loading.dismiss();
    }
  }

  void toHelpDoc() {
    Get.toNamed(RouteNames.systemHelpDoc);
  }

  // 注销
  void onLogout() {
    UserService.to.logout();
    update(["my_index"]);
  }

  void onDestroy() async {
    if (destroyConfirmInput.value.text != destroyConfirmCode) {
      Loading.toast(LocaleKeys.inputNotRight.tr);
      return;
    }
    await destory();
  }

  @override
  void onReady() async {
    super.onReady();
    await _initData();
  }
}
