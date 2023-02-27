import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ButtomSheetPage extends GetView<ButtomSheetController> {
  const ButtomSheetPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("ButtomSheetPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtomSheetController>(
      init: ButtomSheetController(),
      id: "buttom_sheet",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("buttom_sheet")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
