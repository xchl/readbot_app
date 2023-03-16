import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
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
    return WebViewWidget(controller: controller.webViewController);
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
