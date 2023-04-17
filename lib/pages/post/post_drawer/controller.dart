import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:get/get.dart';

class PostDrawerController extends GetxController {
  PostDrawerController(this._subPage);

  final SubPage _subPage;
  Map<FeedGroupModel, List<FeedModel>> feedGroupedByGroup = {};

  String? selectedFeed;

  _initData() async {
    List<FeedModel> feeds = await DatabaseManager().getAllFeeds();
    List<FeedGroupModel> feedGroups = await DatabaseManager().getAllGroups();
    Map<String, List<FeedModel>> feedGroupedByGroupId = {};
    for (var feed in feeds) {
      if (feedGroupedByGroupId[feed.groupName] == null) {
        feedGroupedByGroupId[feed.groupName!] = [];
      }
      feedGroupedByGroupId[feed.groupName]!.add(feed);
    }
    for (var group in feedGroups) {
      feedGroupedByGroup[group] = feedGroupedByGroupId[group.id] ?? [];
    }
    update(["post_drawer"]);
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  void onFeedSelect(String feedUrl) async {
    if (selectedFeed != null) {
      selectedFeed = null;
    } else {
      selectedFeed = feedUrl;
    }
    update(["post_drawer"]);
    if (_subPage == SubPage.explore) {
      await Get.find<PostAllController>().onFeedSelect(selectedFeed);
    }
  }
}
