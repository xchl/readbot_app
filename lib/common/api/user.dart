import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

/// 用户 api
class UserApi {
  final ApiType apiType = ApiType.system;

  /// 注册
  static Future<bool> register(RegisterInfo info) async {
    var request =
        RegisterRequest(client: ConfigService.to.clientInfo, registerInfo: info)
            .toJson();
    try {
      await HttpService.to.post(
        '/user/register',
        data: request,
      );
      return true;
    } catch (e) {
      LogService.to.e(e);
      return false;
    }
  }

  /// 注销用户
  static Future<bool> destoryAccout() async {
    try {
      await HttpService.to.delete('/user/destroy');
      await UserService.to.logout();
      return true;
    } catch (e) {
      LogService.to.e(e);
      return false;
    }
  }

  /// 登录
  static Future<AuthResponse?> login(LoginInfo info) async {
    var request =
        LoginRequest(client: ConfigService.to.clientInfo, loginInfo: info)
            .toJson();
    try {
      var res = await HttpService.to.post(
        '/user/login',
        data: request,
      );
      return AuthResponse.fromJson(res.data);
    } catch (e) {
      LogService.to.e(e);
      return null;
    }
  }

  static Future<AuthResponse?> refreshToken(String refreshToken) async {
    var request = RefreshTokenRequest(
            client: ConfigService.to.clientInfo, refreshToken: refreshToken)
        .toJson();
    try {
      var res = await HttpService.to.post('/user/refresh_token', data: request);
      return AuthResponse.fromJson(res.data);
    } catch (e) {
      LogService.to.e(e);
      return null;
    }
  }
}
