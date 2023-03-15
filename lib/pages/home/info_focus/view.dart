import 'package:feed_inbox_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class InfoFocusPage extends GetView<InfoFocusController> {
  const InfoFocusPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return List.generate(
      FeedService.to.feedLength,
      (index) => TextWidget.title3(
        "${FeedService.to.feed(index).name}",
      ),
    ).toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoFocusController>(
      init: InfoFocusController(),
      id: "info_focus",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 44.h,
            backgroundColor: AppColors.background,
            elevation: 0,
            //由于title本身是接受一个widget，所以可以直接给他一个自定义的widget。
            title: TextWidget.title1(
              "待读",
              color: AppColors.secondary,
            ),
          ),
          drawer: const Drawer(
            child: Text("左侧边栏"),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
