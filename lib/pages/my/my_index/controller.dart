import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  bool isNightMode = ConfigService().isDarkModel;

  _initData() async {
    update(["my_index"]);
  }

  void onChangeTheme(bool isOn) async {
    isNightMode = isOn;
    await ConfigService().switchThemeModel();
    update(["my_index"]);
  }

  // 注销
  void onLogout() {
    UserService.to.logout();
    update(["my_index"]);
  }

  @override
  void onReady() async {
    super.onReady();
    await _initData();
  }
}
