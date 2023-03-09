import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InfoAllPage extends GetView<InfoAllController> {
  const InfoAllPage({Key? key}) : super(key: key);

  // 导航栏
  AppBar _buildAppBar() {
    return AppBar(
      // 背景透明
      backgroundColor: Colors.transparent,
      // 取消阴影
      elevation: 0,
      // 标题栏左侧间距
      titleSpacing: AppSpace.listItem,
      // 搜索栏
      title: InputWidget.search(
        // 提示文字，多语言
        hintText: LocaleKeys.myBtnLanguage.tr,
        // 点击事件
        onTap: controller.onAppBarTap,
        // 只读
        readOnly: true,
      ),
      // 右侧的按钮区
      actions: [
        // 图标
        IconWidget.svg(
          AssetsSvgs.pNotificationsSvg,
          size: 20,
          isDot: true, // 未读消息 小圆点
        )
            .unconstrained() // 去掉约束, appBar 会有个约束下来
            .padding(
              left: AppSpace.listItem,
              right: AppSpace.page,
            ),
      ],
    );
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ).paddingAll(AppSpace.card),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoAllController>(
      init: Get.find<InfoAllController>(),
      id: "info_all",
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
