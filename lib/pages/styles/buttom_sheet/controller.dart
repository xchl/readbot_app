import 'package:get/get.dart';

class ButtomSheetController extends GetxController {
  ButtomSheetController();

  _initData() {
    update(["buttom_sheet"]);
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
