import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'index.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return InAppWebView(
        key: controller.webViewKey,
        initialOptions: controller.options,
        onWebViewCreated: (webController) {
          if (controller.feedItem.content == null) {
            webController.loadUrl(
                urlRequest:
                    URLRequest(url: Uri.parse(controller.feedItem.link!)));
          } else {
            webController.loadData(data: controller.feedItem.content!);
          }
        },
        onLoadStop: (webController, url) async {
          if (controller.feedItem.content != null) {
            webController.injectCSSCode(source: ReadModeStyle().css);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailController>(
      init: PostDetailController(),
      id: "post_detail",
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
