import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:readbot/common/index.dart';

import 'index.dart';

class HelpDocPage extends GetView<HelpDocController> {
  const HelpDocPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return InAppWebView(
      key: controller.webViewKey,
      initialOptions: controller.options,
      initialUrlRequest:
          URLRequest(url: Uri.parse(ConfigService.to.helpDocUrl)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpDocController>(
      init: HelpDocController(),
      id: "help_doc",
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
