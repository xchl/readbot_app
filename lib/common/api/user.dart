import 'package:readbot/common/index.dart';

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

  /// 修改密码
  static Future<bool> modifyPassword(LoginInfo info) async {
    var request = ModifyPasswordRequest(
            client: ConfigService.to.clientInfo, loginInfo: info)
        .toJson();
    try {
      await HttpService.to.post('/user/modify_password', data: request);
      return true;
    } catch (e) {
      LogService.to.e(e);
      return false;
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
