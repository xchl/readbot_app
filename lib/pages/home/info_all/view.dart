import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InfoAllPage extends GetView<InfoAllController> {
  const InfoAllPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("InfoAllPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoAllController>(
      init: Get.find<InfoAllController>(),
      id: "info_all",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("info_all")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
