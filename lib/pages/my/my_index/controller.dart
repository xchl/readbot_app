import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:get/get.dart';

class MyIndexController extends GetxController {
  MyIndexController();

  _initData() {
    update(["my_index"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // 注销
  void onLogout() {
    UserService.to.logout();
    Get.find<MainController>().onJumpToPage(0);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
