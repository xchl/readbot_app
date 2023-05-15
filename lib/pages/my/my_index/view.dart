import 'package:readbot/common/index.dart';
import 'package:readbot/common/components/number_select_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/index.dart';

class MyIndexPage extends GetView<MyIndexController> {
  const MyIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: <Widget>[
        // 顶部 APP 导航栏
        _buildHeader().sliverBox,
        // 服务相关
        _buildServiceButtonsList().sliverBox,
        // 主题管理
        _buildSystemButtonsList().sliverBox,

        // 系统设置
        _buildAccountButtonsList().sliverBox,

        // // 注销
        // ButtonWidget.primary(
        //   LocaleKeys.myBtnLogout.tr,
        //   height: 60,
        //   onTap: () => controller.onLogout(),
        // )
        //     .padding(
        //       left: AppSpace.page,
        //       right: AppSpace.page,
        //       top: AppSpace.listRow * 2,
        //     )
        //     .sliverBox
      ],
    );
  }

  Widget _buildHeader() {
    return <Widget>[
      // 用户信息
      <Widget>[
        Obx(() => UserService.isLogin
            ? TextWidget.title1(
                "Hi, ${UserService.to.username}",
                color: AppColors.primary,
                size: 26.sp,
              )
            : ButtonWidget.text(
                LocaleKeys.myLoginBtn.tr,
                onTap: () => Get.toNamed(RouteNames.systemLogin),
                textSize: 26.sp,
                textColor: AppColors.primary,
              )),
      ].toRow().paddingHorizontal(AppSpace.card),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        )
        .padding(
          bottom: AppSpace.card,
        );
  }

  Widget _buildSystemButtonsList() {
    return <Widget>[
      <Widget>[
        // SwitchItemWidget(
        //   title: LocaleKeys.myDartTheme.tr,
        //   statu: controller.isNightMode,
        //   onTap: (bool value) => controller.onChangeTheme(value),
        // ),
        SwitchItemWidget(
          title: LocaleKeys.mySystemAutoReadmode.tr,
          statu: controller.enableReadMode,
          onTap: (bool value) => controller.onReadModeChange(value),
        ),
        SwitchItemWidget(
          title: LocaleKeys.mySystemAutoDeleteData.tr,
          statu: controller.enableAutoDeleteData,
          onTap: (bool value) => controller.onAutoDeleteDataChange(value),
        ),
        controller.enableAutoDeleteData
            ? NumberSelectItemWidget(
                title: LocaleKeys.mySystemAutoDeleteDay.tr,
                onTap: controller.onSelectAutoDeleteDay,
                selectValue: controller.onlySaveDataDays,
                options: controller.onlySaveDataDaysList)
            : const SizedBox()
      ].toColumn().card()
    ].toColumn().padding(top: 10.h, bottom: 10.h);
  }

  Widget _buildAccountButtonsList() {
    return <Widget>[
      <Widget>[
        ButtonItemWidget(
          title: LocaleKeys.myBtnLogout.tr,
          onTap: () => controller.onLogout(),
        ),
        ButtonItemWidget(
          title: LocaleKeys.myDestroyBth.tr,
          onTap: () {
            ActionDialog.normal(
              context: Get.context!,
              title: Text(LocaleKeys.myDestroyBth.tr),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    LocaleKeys.myDestroyAccountInfo.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'YES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InputWidget(
                    hintText: 'Input',
                    fontSize: 14,
                    controller: controller.destroyConfirmInput,
                  ),
                ],
              ),
              confirm: Text(LocaleKeys.commonBottomConfirm.tr),
              confirmBackgroundColor: Colors.red,
              onConfirm: controller.onDestroy,
            );
          },
        ),
      ].toColumn().card()
    ].toColumn().padding(top: 10.h, bottom: 10.h);
  }

  Widget _buildServiceButtonsList() {
    return <Widget>[
      <Widget>[
        SwitchItemWidget(
          title: LocaleKeys.myIsNeedSync.tr,
          statu: controller.enableSync,
          onTap: (bool value) => controller.onSyncChange(value),
        ),
        ButtonItemWidget(
          title: LocaleKeys.myAISetting.tr,
          onTap: () => Get.toNamed(RouteNames.myAiSetting),
        ),
      ].toColumn().card()
    ].toColumn().padding(top: 30.h, bottom: 10.h);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyIndexController>(
      init: Get.find<MyIndexController>(),
      id: "my_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
          ),
          body: SafeArea(
              child: _buildView().backgroundColor(AppColors.background)),
        );
      },
    );
  }
}
