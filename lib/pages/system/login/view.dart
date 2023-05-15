import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
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
        textSize: AppSize.body2,
      ).paddingRight(AppSpace.seqHorization),
      // 注册文字按钮
      ButtonWidget.text(
        LocaleKeys.loginSignUp.tr,
        onTap: controller.onSignUp,
        textSize: AppSize.body2,
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
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          labelText: LocaleKeys.loginEmail.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.email(LocaleKeys.validatorEmail.tr),
          ]),
        ).paddingBottom(AppSpace.listItem),

        // password
        TextFormWidget(
          controller: controller.passwordController,
          isObscure: true,
          labelText: LocaleKeys.loginPassword.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validators.password(
              Constants.passwordMinLength,
              Constants.passwordMaxLength,
              LocaleKeys.validatorPassword.trParams(
                {
                  "min": "${Constants.passwordMinLength}",
                  "max": "${Constants.passwordMaxLength}"
                },
              ),
            ),
          ]),
        ).paddingBottom(AppSpace.listItem),

        // 用户协议
        CheckBoxWidget(
          value: controller.isAgree,
          activeColor: AppColors.primary,
          onChanged: controller.onCheckAgree,
          textWidget: ButtonWidget.text(
            LocaleKeys.registerUserAgreement.tr,
            onTap: controller.onUserAgreement,
            textSize: AppSize.body2,
            textColor: AppColors.primary,
          ),
        ).paddingBottom(AppSpace.listItem),

        // 登录按钮
        ButtonWidget.primary(
          LocaleKeys.loginSignIn.tr,
          onTap: controller.onSignIn,
        ).paddingBottom(AppSpace.listItem),

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
    return CustomScrollView(
      slivers: <Widget>[
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max, // 新增此行
            children: <Widget>[
              TextWidget.bigTitle(LocaleKeys.loginBackTitle.tr)
                  .padding(
                    top: AppSpace.page,
                    bottom: AppSpace.title,
                  )
                  .alignLeft()
                  .paddingHorizontal(AppSpace.card),
              // 表单
              _buildForm()
            ],
          ).paddingHorizontal(AppSpace.page),
        ).sliverBox,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: AppSize.appBarElevation,
          ),
          body: SafeArea(
            bottom: false,
            child: _buildView().backgroundColor(AppColors.background),
          ),
        );
      },
    );
  }
}
