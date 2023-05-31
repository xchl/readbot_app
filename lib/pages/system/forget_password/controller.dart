import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController();

  GlobalKey formKey = GlobalKey<FormState>();

  // 邮件
  TextEditingController emailController = TextEditingController();
  // 密码
  TextEditingController passwordController = TextEditingController();
  // 确认密码
  TextEditingController passwordEnsureController = TextEditingController();

  _initData() {
    update(["forget_password"]);
  }

  void onTap() {}

  void onModifyPassword() async {
    if ((formKey.currentState as FormState).validate()) {
      String newPassword = passwordController.text;
      String newPasswordEnsure = passwordEnsureController.text;
      if (newPassword != newPasswordEnsure) {
        Loading.toast(LocaleKeys.passwordNotSame.tr);
        return;
      }
      Loading.show();
      //sha2密码加密
      var password = EncryptUtil.sha256Encode(passwordController.text);
      bool isSuccess = await UserService.to.modifyPassword(LoginInfo(
        email: emailController.text,
        password: password,
      ));
      if (!isSuccess) {
        Loading.error(LocaleKeys.passwordModifyError.tr);
        return;
      }
      Loading.success(LocaleKeys.commonMessageSuccess.tr);
      Get.back(result: true);
      Loading.dismiss();
    }
  }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
