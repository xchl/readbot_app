import 'dart:convert';

import 'package:feed_inbox_app/common/values/js.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    return controller.htmlBody == null
        ? const Center(child: CircularProgressIndicator())
        : Html(data: controller.htmlBody!);
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
