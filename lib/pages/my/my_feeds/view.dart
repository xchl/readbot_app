import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MyFeedsPage extends GetView<MyFeedsController> {
  const MyFeedsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("MyFeedsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFeedsController>(
      init: MyFeedsController(),
      id: "my_feeds",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("my_feeds")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
