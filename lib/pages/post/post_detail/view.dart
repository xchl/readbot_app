import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({Key? key}) : super(key: key);

  Widget _buildView() {
    // return InAppWebView(
    //     key: controller.webViewKey,
    //     initialOptions: controller.options,
    //     onWebViewCreated: (webController) {
    //       webController.loadUrl(
    //           urlRequest:
    //               URLRequest(url: Uri.parse(controller.feedItem.link!)));
    //     },
    //     // TODO Save the html
    //     onLoadStop: (webController, url) async {});

    return InAppWebView(
        key: controller.webViewKey,
        initialOptions: controller.options,
        onWebViewCreated: (webController) {
          controller.feedItem.content == null
              ? webController.loadUrl(
                  urlRequest:
                      URLRequest(url: Uri.parse(controller.feedItem.link!)))
              : webController.loadData(data: controller.feedItem.content!);
        },
        onLoadStart: (webController, url) {
          debugPrint('load $url, origin url ${controller.feedItem.link!}');
        },
        onLoadStop: (webController, url) async {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailController>(
      init: PostDetailController(),
      id: "post_detail",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("post_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
