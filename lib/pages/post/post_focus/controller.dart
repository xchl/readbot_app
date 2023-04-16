import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

class PostFocusController extends GetxController {
  PostFocusController();

  List<FeedItemModel> _feedItems = [];
  List<FeedModel?> _feeds = [];

  int _page = 0;

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feeds => _feeds;

  _initData() async {
    _feedItems = await DatabaseManager().getFocusFeedItemsByPage(_page);
    _feeds = await DatabaseManager().getFeeds(
      _feedItems.map((e) => e.feedId).toList(),
    );
    update(["post_focus"]);
  }

  void onTapItem(FeedItemModel feedItem) async {
    var content = await DatabaseManager().getContentByFeedItemId(feedItem.id);
    Get.toNamed(RouteNames.postPostDetail,
        arguments: {'feedItem': feedItem, 'content': content});
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }
}
