import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:get/get.dart';

class PostDrawerController extends GetxController {
  PostDrawerController(this._subPage);

  final PageType _subPage;
  Map<String, List<FeedModel>> feedGroupedByGroup = {};

  String? selectedFeed;

  _initData() async {
    List<FeedModel> feeds = await DatabaseManager().getAllFeeds();
    String unnameGroupName = LocaleKeys.unnameFeedGroup.tr;
    feedGroupedByGroup[LocaleKeys.unnameFeedGroup.tr] = [];
    for (var feed in feeds) {
      if (feed.groupName == null) {
        feedGroupedByGroup[unnameGroupName]!.add(feed);
        continue;
      }
      feedGroupedByGroup[feed.groupName!] ??= [];
      feedGroupedByGroup[feed.groupName]!.add(feed);
    }
    // remove empty key
    feedGroupedByGroup.removeWhere((key, value) => value.isEmpty);
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
