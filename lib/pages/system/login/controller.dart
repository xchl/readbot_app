import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/request.pb.dart';
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

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  /// 释放
  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  /// Sign In
  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        //sha2密码加密
        var password = EncryptUtil.sha256Encode(passwordController.text);

        await UserService.to.login(LoginInfo(
          email: emailController.text,
          password: password,
        ));

        Loading.success();

        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up
  void onSignUp() {
    Get.toNamed(RouteNames.systemRegister);
  }
}
