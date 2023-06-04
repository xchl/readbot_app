import 'package:readbot/pages/index.dart';
import 'package:get/get.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostFocusController>(() => PostFocusController());
    Get.lazyPut<PostAllController>(() => PostAllController());
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    // Get.lazyPut<PostDrawerController>(
    //     () => PostDrawerController(PageType.explore),
    //     tag: 'explore');
  }
}
