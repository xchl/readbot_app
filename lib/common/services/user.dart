import 'dart:convert';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../index.dart';

/// 用户服务
class UserService extends GetxService {
  static UserService get to => Get.find();

  String accessToken = '';
  String refreshToken = '';
  DateTime _accessTokenExpirTime = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _refreshTokenExpirTime = DateTime.fromMillisecondsSinceEpoch(0);
  final _basicProfile = BasicProfile().obs;

  bool hasActiveAccessToken() {
    if (accessToken.isEmpty) return false;
    return _accessTokenExpirTime
        .isAfter(DateTime.now().toUtc().add(Constants.tokenExpiredEpsSecond));
  }

  bool hasActiveRefreshToken() {
    if (refreshToken.isEmpty) return false;
    return _refreshTokenExpirTime
        .isAfter(DateTime.now().toUtc().add(Constants.tokenExpiredEpsSecond));
  }

  Future<bool> isLogin() async {
    await refreshTokenIfNeed();
    return hasActiveAccessToken();
  }

  /// 用户 profile
  BasicProfile get basicProfile => _basicProfile.value;

  @override
  void onInit() async {
    super.onInit();
    // 读 token
    accessToken = Storage().getString(Constants.storageAccessToken);
    refreshToken = Storage().getString(Constants.storageRefreshToken);

    // 解析Token
    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      parseToken(accessToken, refreshToken);
    }
    await refreshTokenIfNeed();
    parseProfile();
  }

  void parseProfile() {
    var decodedAccessToken = JwtDecoder.decode(accessToken);
    _basicProfile(BasicProfile.fromJson(decodedAccessToken['data']));
  }

  void parseToken(String accessToken, String refreshToken) {
    var decodedAccessToken = JwtDecoder.decode(accessToken);
    _accessTokenExpirTime =
        DateTime.fromMillisecondsSinceEpoch(decodedAccessToken['exp']);

    _basicProfile(BasicProfile.fromJson(decodedAccessToken['data']));

    var decodedRefreshToken = JwtDecoder.decode(refreshToken);
    _refreshTokenExpirTime =
        DateTime.fromMillisecondsSinceEpoch(decodedRefreshToken['exp']);
  }

  /// 设置令牌
  Future<void> setToken(UserTokenModel token) async {
    await Storage().setString(Constants.storageAccessToken, token.accessToken!);
    accessToken = token.accessToken!;

    await Storage()
        .setString(Constants.storageRefreshToken, token.refreshToken!);
    refreshToken = token.refreshToken!;

    parseToken(accessToken, refreshToken);
  }

  /// 获取用户 profile
  // Future<void> getProfile() async {
  //   if (accessToken.isEmpty) return;
  //   UserInfo result = await UserApi.info();
  //   _basicProfile(result);
  //   Storage().setString(Constants.storageProfile, jsonEncode(result));
  // }

  /// 设置用户 profile
  Future<void> setProfile(BasicProfile profile) async {
    if (accessToken.isEmpty) return;
    _basicProfile(profile);
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  /// 注销
  Future<void> logout() async {
    // if (_isLogin.value) await UserAPIs.logout();
    await Storage().remove(Constants.storageAccessToken);
    await Storage().remove(Constants.storageRefreshToken);
    _basicProfile(BasicProfile());
    accessToken = '';
    refreshToken = '';
  }

  /// 登录
  Future<void> login(UserLoginReq req) async {
    UserTokenModel res = await UserApi.login(req);
    await setToken(res);
  }

  /// 刷新token
  Future<void> refreshTokenIfNeed() async {
    if (!hasActiveAccessToken() && hasActiveRefreshToken()) {
      UserTokenModel res = await UserApi.refreshToken(refreshToken);
      await setToken(res);
      // parseProfile();
    }
  }
}
