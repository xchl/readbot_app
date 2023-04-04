import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({Key? key}) : super(key: key);

  // 主视图
  // Widget _buildView() {
  //   return Center(
  //     child: <Widget>[
  //       Text(controller.post.content!),
  //       Text(controller.post.link!)
  //     ].toColumn(),
  //   );
  // }

  Widget _buildView() {
    // return WebViewWidget(controller: controller.webViewController);
    // return controller.htmlBody == null
    //     ? const Center(child: CircularProgressIndicator())
    //     : Html(data: controller.htmlBody!);

    // if feedItem.content not null then InAppWebView load content as html
    // else load feeditem link

    return InAppWebView(
        key: controller.webViewKey,
        initialOptions: controller.options,
        onWebViewCreated: (webController) {
          webController.loadUrl(
              urlRequest:
                  URLRequest(url: Uri.parse(controller.feedItem.link!)));
        },
        onLoadStop: (webController, url) async {});

    // return InAppWebView(
    //     key: controller.webViewKey,
    //     initialOptions: controller.options,
    //     onWebViewCreated: (webController) {
    //       controller.feedItem.content == null
    //           ? webController.loadUrl(
    //               urlRequest:
    //                   URLRequest(url: Uri.parse(controller.feedItem.link!)))
    //           : webController.loadData(data: controller.feedItem.content!);
    //     },
    //     onLoadStart: (webController, url) {
    //       url == null ? debugPrint('load data') : debugPrint('load $url');
    //     },
    //     onLoadStop: (webController, url) async {});
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
