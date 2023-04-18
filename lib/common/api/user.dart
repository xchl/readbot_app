import 'package:feed_inbox_app/common/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(RegisterInfo info) async {
    var request =
        RegisterRequest(client: ConfigService.to.clientInfo, registerInfo: info)
            .toProto3Json();
    var res = await HttpService.to.post('/user/register', data: request);
    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<AuthResponse> login(LoginInfo? info) async {
    var request =
        LoginRequest(client: ConfigService.to.clientInfo, loginInfo: info)
            .toProto3Json();
    var res = await HttpService.to.post(
      '/user/login',
      data: request,
    );
    var response = AuthResponse()..mergeFromProto3Json(res.data);
    return response;
  }

  static Future<AuthResponse> refreshToken(String refreshToken) async {
    var request = RefreshTokenRequest(
            client: ConfigService.to.clientInfo, refreshToken: refreshToken)
        .toProto3Json();
    var res = await HttpService.to.post('/user/refresh_token', data: request);
    return AuthResponse.fromJson(res.data);
  }
}
