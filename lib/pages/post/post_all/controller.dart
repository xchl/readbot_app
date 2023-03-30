import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostAllController extends GetxController {
  PostAllController();

  // 刷新控制器
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  int _page = 0;

  _initData() async {
    _feedItems = await FeedManager().getFeedItemsByPage(_page);
    update(["post_all"]);
  }

  List<FeedItem> _feedItems = [];

  List<FeedItem> get feedItems => _feedItems;

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

  void onTapItem(FeedItem post) {
    Get.toNamed(RouteNames.postPostDetail, arguments: {'content': post});
  }

  Future<void> onRefresh() async {
    try {
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
