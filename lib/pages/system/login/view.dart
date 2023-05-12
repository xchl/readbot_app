import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  // 提示
  Widget _buildTips() {
    return <Widget>[
      // 提示
      ButtonWidget.text(
        LocaleKeys.loginForgotPassword.tr,
        textSize: 12,
      ).paddingRight(10),
      // 注册文字按钮
      ButtonWidget.text(
        LocaleKeys.loginSignUp.tr,
        onTap: controller.onSignUp,
        textSize: 12,
        textColor: AppColors.primary,
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  // 表单页
  Widget _buildForm() {
    return Form(
      key: controller.formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // email
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          labelText: LocaleKeys.loginEmail.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.email(LocaleKeys.validatorEmail.tr),
          ]),
        ),

        // password
        TextFormWidget(
          controller: controller.passwordController,
          labelText: LocaleKeys.loginPassword.tr,
          isObscure: true,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            // TODO 常量化
            Validators.password(
              8,
              18,
              LocaleKeys.validatorPassword.trParams(
                {"min": "8", "max": "18"},
              ),
            ),
          ]),
        ).paddingBottom(AppSpace.listRow.w * 3),

        // 用户协议
        CheckBoxWidget(
          value: controller.isAgree,
          onChanged: controller.onCheckAgree,
          textWidget: ButtonWidget.text(
            LocaleKeys.registerUserAgreement.tr,
            onTap: controller.onUserAgreement,
            textSize: 14,
            textColor: AppColors.primary,
          ),
        ).padding(left: 0, bottom: 10),

        // 登录按钮
        ButtonWidget.primary(
          LocaleKeys.loginSignIn.tr,
          onTap: controller.onSignIn,
        ).paddingBottom(AppSpace.listRow.w),

        _buildTips(),

        // OR
        // TextWidget.body1(LocaleKeys.loginOrText.tr).paddingBottom(30.w),

        // 其它登录按钮
        // <Widget>[
        //   ButtonWidget.iconTextOutlined(
        //     IconWidget.svg(AssetsSvgs.facebookSvg),
        //     "Facebook",
        //     borderColor: AppColors.surfaceVariant,
        //     width: 149.w,
        //     height: 44.w,
        //   ),
        //   ButtonWidget.iconTextOutlined(
        //     IconWidget.svg(AssetsSvgs.googleSvg),
        //     "Google",
        //     borderColor: AppColors.surfaceVariant,
        //     width: 149.w,
        //     height: 44.w,
        //   ),
        // ].toRow(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        // ),

        // end
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 内容页
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 头部标题
        TextWidget.title1(LocaleKeys.loginBackTitle.tr).padding(
          top: AppSpace.page,
          bottom: AppSpace.titleContent,
        ),

        // 表单
        _buildForm().card(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
