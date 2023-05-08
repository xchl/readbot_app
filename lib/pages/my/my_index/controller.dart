import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  bool isNightMode = ConfigService().isDarkModel;

  bool enableSync = ConfigService().enableSync;

  bool enableReadMode = ConfigService().enableReadMode;

  bool enableAutoDeleteData = ConfigService().enableAutoDeleteData;

  int onlySaveDataDays = ConfigService().onlySaveDataDays;

  /// 定义输入控制器
  TextEditingController destroyConfirmInput = TextEditingController();

  _initData() async {
    update(["my_index"]);
  }

  void onChangeTheme(bool isOn) async {
    isNightMode = isOn;
    await ConfigService().switchThemeModel();
    update(["my_index"]);
  }

  void onSyncChange(bool isOn) async {
    enableSync = isOn;
    await ConfigService().saveSycnOption(enableSync);
    update(["my_index"]);
  }

  void onReadModeChange(bool isOn) async {
    enableReadMode = isOn;
    await ConfigService().saveReadModeOption(enableReadMode);
    update(["my_index"]);
  }

  void onAutoDeleteDataChange(bool isOn) async {
    enableAutoDeleteData = isOn;
    await ConfigService().saveAutoDeleteDataOption(enableAutoDeleteData);
    update(["my_index"]);
  }

  void onSelectAutoDeleteDay(int? days) async {
    if (days == null) return;
    onlySaveDataDays = days;
    await ConfigService().saveOnlySaveDataDays(onlySaveDataDays);
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

  // 注销
  void onLogout() {
    UserService.to.logout();
    update(["my_index"]);
  }

  void onDestroy() async {
    if (destroyConfirmInput.value.text.toLowerCase() != 'yes') {
      Loading.toast('Code error');
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
