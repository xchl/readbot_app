import 'package:get/get.dart';

class PostDrawerController extends GetxController {
  PostDrawerController();

  _initData() {
    update(["post_drawer"]);
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
