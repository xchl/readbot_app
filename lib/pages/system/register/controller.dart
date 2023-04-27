import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  GlobalKey formKey = GlobalKey<FormState>();

  // 用户名
  TextEditingController userNameController = TextEditingController();
  // 邮件
  TextEditingController emailController = TextEditingController();
  // 密码
  TextEditingController passwordController = TextEditingController();

  // 用户协议
  bool isAgree = false;

  _initData() {
    update(["register"]);
  }

  // 选中用户协议
  void onCheckAgree(value) {
    isAgree = value;
    update(['register']);
  }

  // 用户协议
  void onUserAgreement() {
    Get.toNamed(RouteNames.systemUserAgreement);
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // 注册
  void onSignUp() {
    if (isAgree == false) {
      Loading.toast(LocaleKeys.registerUserAgreementError.tr);
      return;
    }
    if ((formKey.currentState as FormState).validate()) {
      // sha2 加密密码
      var password = EncryptUtil.sha256Encode(passwordController.text);

      //验证通过
      Get.offNamed(
        RouteNames.systemRegisterPin,
        arguments: RegisterInfo(
          username: userNameController.text,
          email: emailController.text,
          password: password,
        ),
      );
    }
  }

  // 登录
  void onSignIn() {
    Get.offNamed(RouteNames.systemLogin);
  }
}
