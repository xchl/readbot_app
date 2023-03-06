import 'dart:convert';
import 'package:get/get.dart';

import '../index.dart';

/// 用户服务
class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  String accessToken = '';
  String refreshToken = '';
  final _profile = UserInfo().obs;

  /// 是否登录
  bool get isLogin => _isLogin.value;

  /// 用户 profile
  UserInfo get profile => _profile.value;

  /// 是否有令牌 token
  bool get hasAccessToken => accessToken.isNotEmpty;
  bool get hasRefreshToken => refreshToken.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    // 读 token
    accessToken = Storage().getString(Constants.storageAccessToken);
    refreshToken = Storage().getString(Constants.storageRefreshToken);
    // 读 profile
    var profileOffline = Storage().getString(Constants.storageProfile);

    if (profileOffline.isNotEmpty) {
      _profile(UserInfo.fromJson(jsonDecode(profileOffline)));
    }
  }

  /// 设置令牌
  Future<void> setAccessToken(UserTokenModel token) async {
    await Storage().setString(Constants.storageAccessToken, token.accessToken!);
    accessToken = token.accessToken!;

    await Storage()
        .setString(Constants.storageRefreshToken, token.refreshToken!);
    refreshToken = token.refreshToken!;

    _isLogin.value = true;
  }

  /// 获取用户 profile
  Future<void> getProfile() async {
    if (accessToken.isEmpty) return;
    UserInfo result = await UserApi.info();
    _profile(result);
    Storage().setString(Constants.storageProfile, jsonEncode(result));
  }

  /// 设置用户 profile
  Future<void> setProfile(UserInfo profile) async {
    if (accessToken.isEmpty) return;
    _isLogin.value = true;
    _profile(profile);
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  /// 注销
  Future<void> logout() async {
    // if (_isLogin.value) await UserAPIs.logout();
    await Storage().remove(Constants.storageAccessToken);
    await Storage().remove(Constants.storageRefreshToken);
    _profile(UserInfo());
    _isLogin.value = false;
    accessToken = '';
    refreshToken = '';
  }

  /// 登录
  Future<void> login() async {
    await logout();
    Get.toNamed(RouteNames.systemLogin);
  }

  /// 检查是否登录
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      await Get.toNamed(RouteNames.systemLogin);
      return false;
    }
    return true;
  }
}
