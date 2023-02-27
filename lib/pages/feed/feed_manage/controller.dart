import 'package:get/get.dart';

class FeedManageController extends GetxController {
  FeedManageController();

  _initData() {
    update(["feed_manage"]);
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
