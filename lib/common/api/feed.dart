import 'package:feed_inbox_app/common/index.dart';

/// 订阅源API
class FeedApi {
  /// 增加外部订阅源
  static Future<UserFeed> addExistSingle(feedInfo) async {
    var res = await FeedBoxHttpService.to
        .post('/feed/add/${Constants.existUrlType}', data: feedInfo);
    return UserFeed.fromJson(res.data);
  }

  /// 获取订阅源列表
  static Future<List<UserFeed>> getFeedList() async {
    var res = await FeedBoxHttpService.to.get('/feed');
    List<UserFeed> feeds = [];
    for (var item in res.data) {
      feeds.add(UserFeed.fromJson(item));
    }
    return feeds;
  }
}
