import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  /// 定义输入控制器
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// 表单 key
  GlobalKey formKey = GlobalKey<FormState>();

  _initData() {
    update(["login"]);
  }

  // 用户协议
  bool isAgree = false;

  @override
  void onReady() async {
    super.onReady();
    await checkNetwork();
    _initData();
  }

  // 选中用户协议
  void onCheckAgree(value) {
    isAgree = value;
    update(['login']);
  }

  // 用户协议
  void onUserAgreement() {
    Get.toNamed(RouteNames.systemUserAgreement);
  }

  /// 释放
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  /// Sign In
  Future<void> onSignIn() async {
    if (isAgree == false) {
      Loading.toast(LocaleKeys.registerUserAgreementError.tr);
      return;
    }
    if ((formKey.currentState as FormState).validate()) {
      Loading.show();
      //sha2密码加密
      var password = EncryptUtil.sha256Encode(passwordController.text);
      bool isLogin = await UserService.to.login(LoginInfo(
        email: emailController.text,
        password: password,
      ));
      if (!isLogin) {
        Loading.error(LocaleKeys.loginError.tr);
        return;
      }
      Loading.success();
      Get.back(result: true);
      Loading.dismiss();
    }
  }

  /// Sign Up
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }
}
