import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(RegisterInfo? req) async {
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

  static Future<UserTokenModel> refreshToken(String refreshToken) async {
    var res = await FeedBoxHttpService.to
        .post('/user/refresh_token', data: refreshToken);
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
