import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterController();

  GlobalKey formKey = GlobalKey<FormState>();

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
  void onSignUp() {
    if ((formKey.currentState as FormState).validate()) {
      // aes 加密密码
      // var password = EncryptUtil().aesEncode(passwordController.text);
      var password = passwordController.text;

      //验证通过
      Get.offNamed(
        RouteNames.systemRegisterPin,
        arguments: UserRegisterReq(
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
