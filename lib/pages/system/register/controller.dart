import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  // 用户名
  TextEditingController userNameController =
      TextEditingController(text: "username");
  // 邮件
  TextEditingController emailController =
      TextEditingController(text: "username@example.com");
  // 密码
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  _initData() {
    update(["register"]);
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

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  // 注册
  void onSignUp() {}

  // 登录
  void onSignIn() {}
}
