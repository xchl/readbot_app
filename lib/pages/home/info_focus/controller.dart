import 'package:get/get.dart';

class InfoFocusController extends GetxController {
  InfoFocusController();

  _initData() {
    update(["info_focus"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

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
