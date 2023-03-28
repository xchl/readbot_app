import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';

/// 订阅源API
class FeedApi {
  /// 增加外部订阅源
  static Future<CreateFeedResponse> addExistSingle(feedInfo) async {
    var request = CreateFeedRequest(feedInfo: feedInfo).toProto3Json();
    var res = await FeedBoxHttpService.to
        .post('/feed/add/${Constants.existUrlType}', data: request);
    var response = CreateFeedResponse()..mergeFromProto3Json(res.data);
    return response;
  }

  /// 通过URL获取订阅源
  static Future<String> fetchFeedFromUrl(String url) async {
    var res = await FeedBoxHttpService.to.get(url);
    return res.data;
  }

  /// 获取订阅源列表
  static Future<FecthFeedResponse> getFeedList() async {
    var res = await FeedBoxHttpService.to.get('/feed');
    return FecthFeedResponse()..mergeFromProto3Json(res.data);
  }

  /// 获取文章列表
  static Future<FetchContentResponse> getPostList(
      int latestId, int nums, bool isLatest) async {
    var res = await FeedBoxHttpService.to.get('/post/pull',
        params: {'latest_id': latestId, 'nums': nums, 'is_latest': isLatest});

    return FetchContentResponse()..mergeFromProto3Json(res.data);
  }
}
