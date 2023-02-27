import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class FeedListPage extends GetView<FeedListController> {
  const FeedListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("FeedListPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedListController>(
      init: FeedListController(),
      id: "feed_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("feed_list")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
