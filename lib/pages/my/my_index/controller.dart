import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  bool isNightMode = ConfigService().isDarkModel;

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

  Future<void> destory() async {
    if (UserService.isLogin) {
      await UserApi.destoryAccout();
      await UserService.to.logout();
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
