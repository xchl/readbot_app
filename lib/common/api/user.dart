import 'package:feed_inbox_app/common/index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(RegisterInfo info) async {
    var request =
        RegisterRequest(client: ConfigService.to.clientInfo, registerInfo: info)
            .toJson();
    try {
      await HttpService.to.post('/user/register', data: request);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 注销用户
  static Future<bool> destoryAccout() async {
    try {
      await HttpService.to.delete('/user/destroy');
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 登录
  static Future<AuthResponse> login(LoginInfo info) async {
    var request =
        LoginRequest(client: ConfigService.to.clientInfo, loginInfo: info)
            .toJson();
    var res = await HttpService.to.post(
      '/user/login',
      data: request,
    );
    // TODO error handle
    var response = AuthResponse.fromJson(res.data)!;
    return response;
  }

  static Future<AuthResponse> refreshToken(String refreshToken) async {
    var request = RefreshTokenRequest(
            client: ConfigService.to.clientInfo, refreshToken: refreshToken)
        .toJson();
    var res = await HttpService.to.post('/user/refresh_token', data: request);
    // TODO error handle
    return AuthResponse.fromJson(res.data)!;
  }
}
