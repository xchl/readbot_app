import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // username
        TextFormWidget(
          autofocus: true,
          controller: controller.userNameController,
          labelText: LocaleKeys.loginUsername.tr,
          validator: Validatorless.multiple([
            Validatorless.required(LocaleKeys.validatorRequired.tr),
            Validatorless.min(
                2, LocaleKeys.validatorMin.trParams({"size": "2"})),
            Validatorless.max(
                20, LocaleKeys.validatorMax.trParams({"size": "20"})),
          ]),
        ),

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
        ).paddingBottom(AppSpace.seqx2Vertical),

        // 用户协议
        CheckBoxWidget(
          value: controller.isAgree,
          activeColor: AppColors.primary,
          onChanged: controller.onCheckAgree,
          textWidget: ButtonWidget.text(
            LocaleKeys.registerUserAgreement.tr,
            onTap: controller.onUserAgreement,
            textSize: AppSize.body1,
            textColor: AppColors.primary,
          ),
        ).paddingBottom(AppSpace.listItem),

        // 注册按钮
        _buildBtnSignUp(),

        // 提示文字
        _buildTips(),

        //
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 按钮
  Widget _buildBtnSignUp() {
    return ButtonWidget.primary(
      LocaleKeys.loginSignUp.tr,
      onTap: controller.onSignUp,
    ).paddingBottom(AppSpace.listItem);
  }

  // 提示
  Widget _buildTips() {
    return <Widget>[
      // 提示
      TextWidget.body1(LocaleKeys.registerHaveAccount.tr),
      // 登录文字按钮
      ButtonWidget.text(
        LocaleKeys.loginSignIn.tr,
        onTap: controller.onSignIn,
        textSize: AppSize.body1,
        textColor: AppColors.primary,
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  // 内容页
  Widget _buildView() {
    return CustomScrollView(slivers: <Widget>[
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            <Widget>[
              // 头部标题
              TextWidget.bigTitle(LocaleKeys.registerTitle.tr)
                  .padding(
                    top: AppSpace.page,
                    bottom: AppSpace.title,
                  )
                  .alignLeft()
                  .paddingHorizontal(AppSpace.card),

              // 表单
              _buildForm(),
            ]
                .toColumn(crossAxisAlignment: CrossAxisAlignment.center)
                .paddingHorizontal(AppSpace.page),
          ],
        ),
      ).sliverBox,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
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
