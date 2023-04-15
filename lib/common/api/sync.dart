import 'package:feed_inbox_app/common/index.dart';

/// 订阅源API
class ContentSyncApi {
  /// 拉取
  static Future<ContentPullResponse> pull(ContentPullRequest request) async {
    var res = await HttpService.to.get('/content/pull', data: request);
    return ContentPullResponse()..mergeFromProto3Json(res.data);
  }

  /// 推送
  static Future<ContentPushResponse> push(ContentPushRequest request) async {
    var res = await HttpService.to.post('/content/push', data: request);
    return ContentPushResponse()..mergeFromProto3Json(res.data);
  }
}
