import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PostDetailPage extends GetView<PostDetailController> {
  const PostDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("PostDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailController>(
      init: PostDetailController(),
      id: "post_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("post_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
