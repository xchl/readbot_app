import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

class PostFocusController extends GetxController {
  PostFocusController();

  List<FeedItem> _feedItems = [];

  int _page = 0;

  List<FeedItem> get feedItems => _feedItems;

  _initData() async {
    _feedItems = await DatabaseManager().getFocusFeedItemsByPage(_page);
    update(["post_focus"]);
  }

  void onTapItem(FeedItem feedItem) {
    Get.toNamed(RouteNames.postPostDetail, arguments: {'feedItem': feedItem});
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
