import 'dart:convert';
import 'package:feed_inbox_app/common/models/proto/model.pb.dart';
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

  final _basicProfile = UserProfile().obs;
  final _isLogin = false.obs;

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

  Future<bool> tryLogin() async {
    await refreshTokenIfNeed();
    if (hasActiveAccessToken()) {
      _isLogin(true);
    }
    return _isLogin.value;
  }

  UserProfile get basicProfile => _basicProfile.value;
  static bool get isLogin => UserService.to._isLogin.value;

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

    if (hasActiveAccessToken()) {
      _isLogin(true);
    }
  }

  @override
  void onReady() async {}

  void parseProfile() {
    if (accessToken.isNotEmpty) {
      var decodedAccessToken = JwtDecoder.decode(accessToken);
      _basicProfile(
          UserProfile()..mergeFromProto3Json(decodedAccessToken['data']));
    }
  }

  void parseToken(String accessToken, String refreshToken) {
    var decodedAccessToken = JwtDecoder.decode(accessToken);
    _accessTokenExpirTime =
        DateTime.fromMillisecondsSinceEpoch(decodedAccessToken['exp']);

    _basicProfile(
        UserProfile()..mergeFromProto3Json(decodedAccessToken['data']));

    var decodedRefreshToken = JwtDecoder.decode(refreshToken);
    _refreshTokenExpirTime =
        DateTime.fromMillisecondsSinceEpoch(decodedRefreshToken['exp']);
  }

  /// 设置令牌
  Future<void> setToken(JwtTokens token) async {
    await Storage().setString(Constants.storageAccessToken, token.accessToken);
    accessToken = token.accessToken;

    await Storage()
        .setString(Constants.storageRefreshToken, token.refreshToken);
    refreshToken = token.refreshToken;

    parseToken(accessToken, refreshToken);
  }

  /// 设置用户 profile
  Future<void> setProfile(UserProfile profile) async {
    if (accessToken.isEmpty) return;
    _basicProfile(profile);
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  /// 注销
  Future<void> logout() async {
    await Storage().remove(Constants.storageAccessToken);
    await Storage().remove(Constants.storageRefreshToken);
    _basicProfile(UserProfile());
    accessToken = '';
    refreshToken = '';
    _isLogin.value = false;
  }

  /// 登录
  Future<void> login(LoginInfo req) async {
    AuthResponse res = await UserApi.login(req);
    var token = res.jwtTokens;
    await setToken(token);
    if (ConfigService.to.clientInfo.clientId == 0) {
      ConfigService.to.clientInfo.clientId = res.client.clientId;
      await ConfigService.to.saveClientInfo();
    }
    _isLogin.value = true;
  }

  /// 刷新token
  Future<void> refreshTokenIfNeed() async {
    if (!hasActiveAccessToken() && hasActiveRefreshToken()) {
      AuthResponse res = await UserApi.refreshToken(refreshToken);
      var token = res.jwtTokens;
      await setToken(token);
    }
  }
}
