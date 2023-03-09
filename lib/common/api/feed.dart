import 'package:feed_inbox_app/common/index.dart';

/// 订阅源API
class FeedApi {
  /// 增加外部订阅源
  static Future<FeedInfo> addExistSingle(feedInfo) async {
    var res = await FeedBoxHttpService.to
        .post('/feed/add/${Constants.existUrlType}', data: feedInfo);
    return FeedInfo.fromJson(res.data);
  }

  /// 获取订阅源列表
  static Future<List<FeedInfo>> getFeedList() async {
    var res = await FeedBoxHttpService.to.get('/feed');
    List<FeedInfo> feeds = [];
    for (var item in res.data) {
      feeds.add(FeedInfo.fromJson(item));
    }
    return feeds;
  }
}
