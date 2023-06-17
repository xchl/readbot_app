import 'package:readbot/common/index.dart';
import 'package:get/get.dart';

/// 订阅源API
class ContentSyncApi {
  final ApiType apiType = ApiType.system;

  /// 拉取
  static Future<ContentPullResponse?> pull(ContentPullRequest request) async {
    try {
      var res = await HttpService.to.get(
        '/content/pull',
        data: request.toJson(),
      );
      return ContentPullResponse.fromJson(res.data)!;
    } catch (e) {
      // Loading.toast(LocaleKeys.syncPullError.tr);
      LogService.to.e(e);
      return null;
    }
  }

  /// 推送
  static Future<ContentPushResponse?> push(ContentPushRequest request) async {
    try {
      var res =
          await HttpService.to.post('/content/push', data: request.toJson());
      return ContentPushResponse.fromJson(res.data)!;
    } catch (e) {
      Loading.toast(LocaleKeys.syncPushError.tr);
      LogService.to.e(e);
      return null;
    }
  }
}
