import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/foundation.dart';
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
      initialUrlRequest: URLRequest(url: Uri.parse(Constants.userAgreement)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAgreementController>(
      init: UserAgreementController(),
      id: "user_agreement",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.registerUserAgreement.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
