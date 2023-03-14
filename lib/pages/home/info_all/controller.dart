import 'package:feed_inbox_app/common/services/feed.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class InfoAllController extends GetxController {
  InfoAllController();

  // 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  _initData() async {
    await FeedService.to.fetchPostList();
    update(["info_all"]);
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

  void addToArchive(int index) {
    FeedService.to.postList.removeAt(index);
    update(["info_all"]);
  }

  void addToFocus(int index) {
    FeedService.to.postList.removeAt(index);
    update(["info_all"]);
  }

  Future<void> onRefresh() async {
    try {
      await FeedService.to.fetchPostList();
      refreshController.refreshCompleted();
    } catch (error) {
      refreshController.refreshFailed();
    }
    update(["info_all"]);
  }

  void onAppBarTap() {}

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}
