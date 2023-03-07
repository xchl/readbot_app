import 'package:feed_inbox_app/common/index.dart';
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
        ButtonWidget.primary(
          LocaleKeys.feedAddBtn.tr,
          onTap: controller.onAddFeed,
        ).paddingBottom(AppSpace.listRow.w),
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[_buildForm()].toColumn();
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
