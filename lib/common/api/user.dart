import 'package:feed_inbox_app/common/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await FeedBoxHttpService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }
}
