import 'package:get/get.dart';

class MyFeedsController extends GetxController {
  MyFeedsController();

  _initData() {
    update(["my_feeds"]);
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
