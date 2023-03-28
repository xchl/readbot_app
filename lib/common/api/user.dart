import 'dart:convert';

import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(RegisterInfo info) async {
    var request = RegisterRequest(
            clientInfo: ConfigService.to.clientInfo, registerInfo: info)
        .toProto3Json();
    var res = await FeedBoxHttpService.to.post('/user/register', data: request);
    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<AuthResponse> login(LoginInfo? info) async {
    var request =
        LoginRequest(clientInfo: ConfigService.to.clientInfo, loginInfo: info)
            .toProto3Json();
    var res = await FeedBoxHttpService.to.post(
      '/user/login',
      data: request,
    );
    var response = AuthResponse()..mergeFromProto3Json(res.data);
    return response;
  }

  static Future<AuthResponse> refreshToken(String refreshToken) async {
    var res = await FeedBoxHttpService.to
        .post('/user/refresh_token', data: refreshToken);
    return AuthResponse.fromJson(res.data);
  }

  /// Profile
  static Future<UserProfile> info() async {
    var res = await FeedBoxHttpService.to.get(
      '/user/me',
    );
    return UserProfile.fromJson(res.data);
  }
}
