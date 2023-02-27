import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InfoDetailPage extends GetView<InfoDetailController> {
  const InfoDetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("InfoDetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoDetailController>(
      init: InfoDetailController(),
      id: "info_detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("info_detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
