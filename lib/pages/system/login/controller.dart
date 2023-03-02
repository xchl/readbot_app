import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  /// 定义输入控制器
  TextEditingController userNameController =
      TextEditingController(text: "ducafecat5");
  TextEditingController passwordController =
      TextEditingController(text: "123456");

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
    userNameController.dispose();
    passwordController.dispose();
  }

  /// Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  /// Sign Up
  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }
}
