import 'package:feed_inbox_app/pages/index.dart';
import 'package:get/get.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoFocusController>(() => InfoFocusController());
    Get.lazyPut<InfoAllController>(() => InfoAllController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
