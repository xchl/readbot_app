import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostAllController extends GetxController {
  PostAllController();

  // 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  _initData() async {
    await FeedService.to.fetchPostList();
    update(["post_all"]);
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

  void moveExploreToArchive(int index) {
    FeedService.to.exploreToArchive(index);
    update(["post_all"]);
  }

  void moveExploreToFocus(int index) {
    FeedService.to.exploreToFocus(index);
    update(["post_all"]);
  }

  void onTapItem(Content post) {
    Get.toNamed(RouteNames.postPostDetail, arguments: {'content': post});
  }

  Future<void> onRefresh() async {
    try {
      await FeedService.to.fetchPostList();
      refreshController.refreshCompleted();
    } catch (error) {
      refreshController.refreshFailed();
    }
    update(["post_all"]);
  }

  void onAppBarTap() {}

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
