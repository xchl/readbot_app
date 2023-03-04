import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InfoFocusPage extends GetView<InfoFocusController> {
  const InfoFocusPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("InfoFocusPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoFocusController>(
      init: Get.find<InfoFocusController>(),
      id: "info_focus",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("info_focus")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
