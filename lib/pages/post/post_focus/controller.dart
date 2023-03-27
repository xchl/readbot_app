import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';
import 'package:get/get.dart';

class PostFocusController extends GetxController {
  PostFocusController();

  _initData() {
    update(["post_focus"]);
  }

  void onTapItem(Content post) {
    // print(post.postId);
  }

  void moveExploreToArchive(int index) {
    FeedService.to.exploreToArchive(index);
    update(["post_focus"]);
  }

  void moveExploreToFocus(int index) {
    FeedService.to.exploreToFocus(index);
    update(["post_focus"]);
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
