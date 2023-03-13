import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  final _feedList = <UserFeed>[].obs;

  int get feedLength => _feedList.length;

  List<UserFeed> get feedList => _feedList;

  UserFeed feed(int i) {
    return _feedList[i];
  }

  Future<void> addFeed(UserFeed feed) async {
    UserFeed res = await FeedApi.addExistSingle(feed);
    _feedList.add(res);
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchFeedList();
  }

  Future<void> fetchFeedList() async {
    _feedList.value = await FeedApi.getFeedList();
  }
}
