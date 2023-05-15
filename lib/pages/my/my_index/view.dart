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

        // 账户相关
        _buildAccountButtonsList().sliverBox,
      ],
    );
  }

  Widget _buildLoginHeader() {
    return <Widget>[
      ImageWidget.url(
        // TODO
        "https://ae01.alicdn.com/kf/HTB1umFObCWD3KVjSZSg763CxVXad.png",
        width: AppSize.avatorImageWidth,
        height: AppSize.avatorImageHeight,
        fit: BoxFit.fill,
      ).paddingRight(AppSpace.listItem),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget.title1(
            "${UserService.to.username}",
            color: AppColors.titleColor,
          ).paddingBottom(AppSpace.listItem),
          TextWidget.body1(
            "${UserService.to.email}",
            color: AppColors.hideColor,
          )
        ],
      ),
    ].toRow().paddingHorizontal(AppSpace.card);
  }

  Widget _buildUnLoginHeader() {
    return <Widget>[
      // 头像
      ImageWidget.url(
        // 测试需要改成自定义头像
        AssetsImages.defaultPng,
        width: AppSize.avatorImageWidth,
        height: AppSize.avatorImageHeight,
        fit: BoxFit.fill,
      ).paddingRight(AppSpace.listItem),

      // 称呼
      ButtonWidget.text(
        LocaleKeys.myLoginBtn.tr,
        onTap: () => Get.toNamed(RouteNames.systemLogin),
        textSize: AppSize.buttonTextSize,
        textColor: AppColors.primary,
      ),
    ].toRow().paddingHorizontal(AppSpace.card);
  }

  Widget _buildHeader() {
    // 内容
    return <Widget>[
      // 用户信息
      Obx(() =>
              UserService.isLogin ? _buildLoginHeader() : _buildUnLoginHeader())
          .height(AppSize.headerHeight)
          .backgroundColor(AppColors.background)
    ].toColumn();
  }

  Widget _buildSystemButtonsList() {
    return <Widget>[
      // TextWidget.body1(
      //   LocaleKeys.mySystemPart.tr,
      //   color: AppColors.hideColor,
      // ).alignLeft().padding(left: AppSpace.card, bottom: AppSpace.listItem),
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
        if (controller.enableAutoDeleteData)
          NumberSelectItemWidget(
              title: LocaleKeys.mySystemAutoDeleteDay.tr,
              onTap: controller.onSelectAutoDeleteDay,
              selectValue: controller.onlySaveDataDays,
              options: controller.onlySaveDataDaysList)
      ].toColumn().backgroundColor(AppColors.background)
    ].toColumn().padding(top: 10.h, bottom: 10.h);
  }

  Widget _buildAccountButtonsList() {
    return <Widget>[
      // TextWidget.body1(
      //   LocaleKeys.myAccountPart.tr,
      //   color: AppColors.hideColor,
      // ).alignLeft().padding(left: AppSpace.card, bottom: AppSpace.listItem),
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
      ].toColumn().backgroundColor(AppColors.background)
    ].toColumn().padding(top: 10.h, bottom: 10.h);
  }

  Widget _buildServiceButtonsList() {
    return <Widget>[
      // TextWidget.body1(
      //   LocaleKeys.myServicePart.tr,
      //   color: AppColors.hideColor,
      // ).alignLeft().padding(left: AppSpace.page, bottom: AppSpace.listItem),
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
      ].toColumn().backgroundColor(AppColors.background)
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
          body: SafeArea(child: _buildView()),
        );
      },
    );
  }
}
