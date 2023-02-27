import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FeedManagePage extends GetView<FeedManageController> {
  const FeedManagePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FeedManagePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedManageController>(
      init: FeedManageController(),
      id: "feed_manage",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("feed_manage")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
