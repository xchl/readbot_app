import 'package:feed_inbox_app/pages/index.dart';
import 'package:get/get.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostFocusController>(() => PostFocusController());
    Get.lazyPut<PostAllController>(() => PostAllController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<PostDetailController>(() => PostDetailController());
  }
}
