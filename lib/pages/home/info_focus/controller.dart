import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

class InfoFocusController extends GetxController {
  InfoFocusController();

  _initData() {
    update(["info_focus"]);
  }

  void moveExploreToArchive(int index) {
    FeedService.to.exploreToArchive(index);
    update(["info_focus"]);
  }

  void moveExploreToFocus(int index) {
    FeedService.to.exploreToFocus(index);
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
