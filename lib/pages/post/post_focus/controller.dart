import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

class PostFocusController extends GetxController {
  PostFocusController();

  final List<FeedItemModel> _feedItems = List.empty(growable: true);
  final List<FeedModel?> _feeds = List.empty(growable: true);

  int _page = 0;
  String? _feedUrl;

  List<FeedItemModel> get feedItems => _feedItems;
  List<FeedModel?> get feeds => _feeds;

  // TODO 是否不应该按找时间排？
  refreshFeedItem() async {
    _page = 0;
    _feedItems.clear();
    _feeds.clear();
    var feedItems = await DatabaseManager().getFocusFeedItemsByPage(_page);
    var feeds = await DatabaseManager().getFeedsByUrls(
      feedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(feedItems);
    _feeds.addAll(feeds);
    update(["post_focus"]);
  }

  void onTapItem(FeedItemModel feedItem) async {
    var content =
        await DatabaseManager().getContentByFeedItemMd5(feedItem.md5String);
    Get.toNamed(RouteNames.postPostDetail,
        arguments: {'feedItem': feedItem, 'content': content});
  }

  Future<void> appendFeedItem() async {
    _page++;
    var newFeedItems = await DatabaseManager()
        .getFocusFeedItemsByPage(_page, feedUrl: _feedUrl);
    if (newFeedItems.isEmpty) {
      _page--;
      return;
    }
    var newFeed = await DatabaseManager().getFeedsByUrls(
      newFeedItems.map((e) => e.feedUrl).toList(),
    );
    _feedItems.addAll(newFeedItems);
    _feeds.addAll(newFeed);
    update(["post_focus"]);
  }

  void onLoadMore() async {
    appendFeedItem();
  }

  @override
  void onReady() {
    super.onReady();
    refreshFeedItem();
  }
}
