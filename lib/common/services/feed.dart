import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/models/request/post_req.dart';
import 'package:get/get.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  final _feedList = <UserFeed>[].obs;
  final _postList = <UserPost>[].obs;
  final _lastestPostId = 0;

  int get feedLength => _feedList.length;
  int get postLength => _postList.length;

  List<UserFeed> get feedList => _feedList;

  List<UserPost> get postList => _postList;

  UserFeed feed(int i) {
    return feedList[i];
  }

  UserPost post(int i) {
    return postList[i];
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

  Future<void> fetchPostList() async {
    _postList.value =
        await FeedApi.getPostList(PostReq(latestPostId: _lastestPostId));
  }
}
