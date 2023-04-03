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
    _feedItems = await FeedManager().getExploreFeedItemsByPage(_page);
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

  void turnToSeen(int index) async {
    _feedItems[index].isSeen = true;
    await FeedManager().updateFeedItem(_feedItems[index]);
    update(["post_all"]);
  }

  void turnToFocus(int index) async {
    _feedItems[index].isFocus = true;
    await FeedManager().updateFeedItem(_feedItems[index]);
    _feedItems.removeAt(index);
    update(["post_all"]);
  }

  void onTapItem(FeedItem feedItem) {
    Get.toNamed(RouteNames.postPostDetail, arguments: {'feedItem': feedItem});
  }

  void onLoadMore() async {
    try {
      _page++;
      _feedItems.addAll(await FeedManager().getExploreFeedItemsByPage(_page));
      refreshController.loadComplete();
    } catch (error) {
      refreshController.loadFailed();
    }
    update(["post_all"]);
  }

  Future<void> onRefresh() async {
    try {
      await FeedService.to.fetchAllFeed();
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
