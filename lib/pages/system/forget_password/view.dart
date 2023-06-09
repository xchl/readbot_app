import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';
import 'package:validatorless/validatorless.dart';

import 'index.dart';

class ForgetPasswordPage extends GetView<ForgetPasswordController> {
  const ForgetPasswordPage({Key? key}) : super(key: key);

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

        // password
        TextFormWidget(
          controller: controller.passwordEnsureController,
          isObscure: true,
          labelText: LocaleKeys.loginPasswordRepeat.tr,
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
        ).paddingBottom(AppSpace.listItem * 3),

        // 登录按钮
        ButtonWidget.primary(
          LocaleKeys.loginModifyPassword.tr,
          onTap: controller.onModifyPassword,
        ).paddingBottom(AppSpace.listItem),
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
    return GetBuilder<ForgetPasswordController>(
      init: ForgetPasswordController(),
      id: "forget_password",
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
