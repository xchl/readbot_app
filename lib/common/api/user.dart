import 'package:feed_inbox_app/common/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await FeedBoxHttpService.to.post(
      '/user/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await FeedBoxHttpService.to.post(
      '/user/login',
      data: req,
    );
    return UserTokenModel.fromJson(res.data);
  }

  /// Profile
  static Future<UserInfo> info() async {
    var res = await FeedBoxHttpService.to.get(
      '/user/me',
    );
    return UserInfo.fromJson(res.data);
  }
}
