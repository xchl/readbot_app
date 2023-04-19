import 'package:feed_inbox_app/common/index.dart';

/// 订阅源API
class ContentSyncApi {
  /// 拉取
  static Future<ContentPullResponse> pull(ContentPullRequest request) async {
    var res = await HttpService.to.get('/content/pull', data: request.toJson());
    // TODO error handle
    return ContentPullResponse.fromJson(res.data)!;
  }

  /// 推送
  static Future<ContentPushResponse> push(ContentPushRequest request) async {
    var res =
        await HttpService.to.post('/content/push', data: request.toJson());
    // TODO error handle
    return ContentPushResponse.fromJson(res.data)!;
  }
}
