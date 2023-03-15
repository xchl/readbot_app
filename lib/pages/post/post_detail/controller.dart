import 'package:get/get.dart';

class PostDetailController extends GetxController {
  PostDetailController();

  _initData() {
    update(["post_detail"]);
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
