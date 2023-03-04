import 'dart:convert';
import 'package:get/get.dart';

import '../index.dart';

/// 用户服务
class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  String access_token = '';
  String refresh_token = '';
  final _profile = UserProfileModel().obs;

  /// 是否登录
  bool get isLogin => _isLogin.value;

  /// 用户 profile
  UserProfileModel get profile => _profile.value;

  /// 是否有令牌 token
  bool get hasAccessToken => access_token.isNotEmpty;
  bool get hasRefreshToken => refresh_token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    // 读 token
    access_token = Storage().getString(Constants.storageAccessToken);
    refresh_token = Storage().getString(Constants.storageRefreshToken);

    // 读 profile
    var profileOffline = Storage().getString(Constants.storageProfile);
    if (profileOffline.isNotEmpty) {
      _profile(UserProfileModel.fromJson(jsonDecode(profileOffline)));
    }
  }

  /// 设置令牌 todo
  Future<void> setAccessToken(String value) async {
    await Storage().setString(Constants.storageAccessToken, value);
    access_token = value;
    _isLogin.value = true;
  }

  /// 设置令牌
  Future<void> setRefreshToken(String value) async {
    await Storage().setString(Constants.storageRefreshToken, value);
    refresh_token = value;
  }

  /// 获取用户 profile
  Future<void> getProfile() async {
    if (access_token.isEmpty) return;
    UserProfileModel result = await UserApi.profile();
    _profile(result);
    Storage().setString(Constants.storageProfile, jsonEncode(result));
  }

  /// 设置用户 profile
  Future<void> setProfile(UserProfileModel profile) async {
    if (access_token.isEmpty) return;
    _isLogin.value = true;
    _profile(profile);
    Storage().setString(Constants.storageProfile, jsonEncode(profile));
  }

  /// 注销
  Future<void> logout() async {
    // if (_isLogin.value) await UserAPIs.logout();
    await Storage().remove(Constants.storageAccessToken);
    await Storage().remove(Constants.storageRefreshToken);
    _profile(UserProfileModel());
    _isLogin.value = false;
    access_token = '';
    refresh_token = '';
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
