import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/components/feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class MyFeedsPage extends GetView<MyFeedsController> {
  const MyFeedsPage({Key? key}) : super(key: key);

  // 表单页
  Widget _buildForm() {
    return Form(
      key: controller.formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // url
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.url,
          controller: controller.urlController,
          labelText: LocaleKeys.feedAddDesc.tr,
        ).paddingBottom(30),

        // 添加按钮
        ButtonWidget.text(
          LocaleKeys.feedAddBtn.tr,
          onTap: controller.onAddFeed,
        ).paddingBottom(AppSpace.listRow.w),
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 表单页
  Widget _buildFeedList() {
    return <Widget>[
      // 订阅源管理
      _buildFeedButtonsList(),
      ButtonWidget.secondary(
        LocaleKeys.myBtnAddSource.tr,
        height: 40,
        onTap: () => showDialog(
            context: Get.context!,
            builder: (context) => SimpleDialog(
                  children: [_buildForm()],
                )),
      ).padding(
        left: AppSpace.page,
        right: AppSpace.page,
        top: AppSpace.listRow * 2,
      )
    ].toColumn();
  }

  // 按钮列表
  Widget _buildFeedButtonsList() {
    return List.generate(
      controller.feedList.length,
      (index) => FeedItemWidget(
        title: controller.feedList[index].name ?? LocaleKeys.feedNoTitle.tr,
        logoUrl: controller.feedList[index].logo,
        onTap: () => Get.toNamed(RouteNames.stylesStylesIndex),
      ),
    ).toColumn();
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[_buildFeedList()].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFeedsController>(
      init: MyFeedsController(),
      id: "my_feeds",
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("my_feeds")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
