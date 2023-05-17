import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'index.dart';

class UserAgreementPage extends GetView<UserAgreementController> {
  const UserAgreementPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return InAppWebView(
      key: controller.webViewKey,
      initialOptions: controller.options,
      initialUrlRequest:
          URLRequest(url: Uri.parse(ConfigService.to.privacyUrl)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAgreementController>(
      init: UserAgreementController(),
      id: "user_agreement",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            title: TextWidget.title1(
              LocaleKeys.registerUserAgreement.tr,
              color: AppColors.titleColor,
            ),
            backgroundColor: AppColors.navigationBarColor,
            elevation: AppSize.appBarElevation,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
