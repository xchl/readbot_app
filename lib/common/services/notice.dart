import 'package:get/get.dart';
import 'package:readbot/pages/index.dart';

/// 用户服务
class NoticeService extends GetxService {
  static NoticeService get to => Get.find();

  int exploreUpdateCount = 0;
  bool isFeedUpdated = false;

  void updateExplore(int count) {
    exploreUpdateCount = count;
    Get.find<MainController>().acceptNotice();
  }

  void updateFeed() {
    isFeedUpdated = true;
    if (Get.isRegistered<FeedListController>()) {
      Get.find<FeedListController>().acceptNotice();
    }
  }

  void clearExplore() {
    exploreUpdateCount = 0;
    Get.find<MainController>().acceptNotice();
  }
}
