import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/pages/index.dart';
import 'package:get/get.dart';

class PostDrawerController extends GetxController {
  PostDrawerController(this._subPage);

  final PageType _subPage;
  Map<FeedGroupModel, List<FeedModel>> feedGroupedByGroup = {};

  String? selectedFeed;

  _initData() async {
    List<FeedModel> feeds = await DatabaseManager().getAllFeeds();
    List<FeedGroupModel> feedGroups = await DatabaseManager().getAllGroups();
    Map<String, List<FeedModel>> feedGroupedByGroupName = {};
    // TODO 优化
    FeedGroupModel unnamedGroup =
        FeedGroupModel(name: LocaleKeys.unnameFeedGroup.tr, isSynced: false);
    feedGroupedByGroup[unnamedGroup] = [];
    for (var feed in feeds) {
      if (feed.groupName == null) {
        feedGroupedByGroup[unnamedGroup]!.add(feed);
        continue;
      }
      if (feedGroupedByGroupName[feed.groupName] == null) {
        feedGroupedByGroupName[feed.groupName!] = [];
      }
      feedGroupedByGroupName[feed.groupName]!.add(feed);
    }
    for (var group in feedGroups) {
      feedGroupedByGroup[group] = feedGroupedByGroupName[group.name] ?? [];
    }
    update(["post_drawer"]);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void onFeedSelect(String feedUrl) async {
    if (selectedFeed == feedUrl) {
      selectedFeed = null;
    } else {
      selectedFeed = feedUrl;
    }
    update(["post_drawer"]);
    if (_subPage == PageType.explore) {
      await Get.find<PostAllController>().onFeedSelect(selectedFeed);
    }
  }
}
