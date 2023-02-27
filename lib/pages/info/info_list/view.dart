import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InfoListPage extends GetView<InfoListController> {
  const InfoListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("InfoListPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoListController>(
      init: InfoListController(),
      id: "info_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("info_list")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
