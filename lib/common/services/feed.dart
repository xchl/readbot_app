import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  List<FeedInfo> _feedList = [];

  @override
  void onInit() async {
    super.onInit();
    await fetchFeedList();
  }

  Future<void> fetchFeedList() async {
    _feedList = await FeedApi.getFeedList();
  }
}
