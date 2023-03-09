import 'package:get/get.dart';

class InfoAllController extends GetxController {
  InfoAllController();

  _initData() {
    update(["info_all"]);
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

  void onAppBarTap() {}

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
