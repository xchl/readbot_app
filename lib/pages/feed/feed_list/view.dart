import 'package:readbot/common/index.dart';
import 'package:readbot/pages/feed/feed_list/widgets/muti_level_Option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

enum FeedAddButtonFunc {
  addFromUrl,
  importFromOpml,
  addGroup,
}

class FeedListPage extends GetView<FeedListController> {
  const FeedListPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    return controller.feedGroupedByGroup.isEmpty
        ? Container()
        : MyMultiLevelOptions(
            options: controller.feedGroupedByGroup,
            selectedOption: controller.selectedFeedGroup!,
            onOptionSelect: controller.onGroupSelected,
            onSubOptionSelect: (feed) {
              controller.onFeedSelected(feed);
              return showCustomModalBottomSheet(
                  context: context,
                  builder: (context) => _buildFeedModifyForm(feed));
            },
            onOptionLongPress: (feedGroup) {
              // 默认分组不允许修改
              if (feedGroup == controller.defaultFeedGroup) {
                return null;
              }
              controller.onGroupSelected(feedGroup);
              return showCustomModalBottomSheet(
                  context: context,
                  builder: (context) => _buildFeedAddGroupForm(isEdit: true));
            });
  }

  Widget _buildFeedAddFromUrlForm() {
    controller.clearUrlForm();
    return Form(
      key: controller.urlFormKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // url
        TextFormWidget(
                keyboardType: TextInputType.url,
                controller: controller.urlController,
                labelText: LocaleKeys.feedAddDesc.tr,
                validator: Validators.notEmpty(LocaleKeys.validatorRequired.tr))
            .paddingBottom(30),

        // 添加按钮
        ButtonWidget.text(
          LocaleKeys.addBtn.tr,
          onTap: controller.onAddFeed,
        ).paddingBottom(AppSpace.listItem),
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(250);
  }

  Widget _buildFeedModifyForm(FeedModel feed) {
    return Form(
      key: controller.feedFormKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        TextFormWidget(
                // TODO 预填充文字大小
                keyboardType: TextInputType.text,
                controller: controller.feedNameController,
                labelText: LocaleKeys.feedTitle.tr,
                validator: Validators.notEmpty(LocaleKeys.validatorRequired.tr))
            .paddingBottom(10),
        TextFormWidget(
                keyboardType: TextInputType.text,
                controller: controller.feedDescController,
                labelText: LocaleKeys.feedDesc.tr)
            .paddingBottom(10),
        // feed name
        DropdownButtonFormField<FeedGroupModel>(
          value: controller.selectedFeedGroup,
          icon: const Icon(Icons.arrow_downward),
          items: controller.allGroup.map((FeedGroupModel feedGroup) {
            return DropdownMenuItem<FeedGroupModel>(
              value: feedGroup,
              child: TextWidget.body1(feedGroup.name),
            );
          }).toList(),
          onChanged: (value) => {controller.onModifyFeedGroup(value)},
        ).paddingBottom(20.h),
        // url
        <Widget>[
          // 取消订阅
          ButtonWidget.text(
            LocaleKeys.feedDelete.tr,
            onTap: controller.onUnsubscribeFeed,
          ).paddingRight(20.w),
          // 修改
          ButtonWidget.text(
            LocaleKeys.commonBottomSave.tr,
            onTap: controller.onFeedSave,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center)
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(350.h);
  }

  Widget _buildFeedAddGroupForm({required isEdit}) {
    return Form(
      key: controller.addGroupKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        TextFormWidget(
                keyboardType: TextInputType.text,
                controller: controller.groupNameController,
                labelText: LocaleKeys.feedAddGroupLabel.tr,
                validator: Validators.notEmpty(LocaleKeys.validatorRequired.tr))
            .paddingBottom(10),
        TextFormWidget(
          keyboardType: TextInputType.text,
          controller: controller.groupDescController,
          labelText: LocaleKeys.feedAddGroupDescptionLabel.tr,
        ).paddingBottom(20.w),
        isEdit
            ? <Widget>[
                // 删除按钮
                ButtonWidget.text(
                  LocaleKeys.feedGroupDelete.tr,
                  onTap: controller.onGroupDelete,
                ).paddingRight(20.w),
                // 修改
                ButtonWidget.text(
                  LocaleKeys.commonBottomApply.tr,
                  onTap: controller.onGroupSave,
                )
              ].toRow(mainAxisAlignment: MainAxisAlignment.center)
            : <Widget>[
                // 取消
                ButtonWidget.text(
                  LocaleKeys.commonBottomCancel.tr,
                  onTap: () => Get.back(),
                ).paddingRight(20.w),
                // 添加按钮
                ButtonWidget.text(
                  LocaleKeys.commonBottomSave.tr,
                  onTap: controller.onGroupSave,
                )
              ].toRow(mainAxisAlignment: MainAxisAlignment.center)
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(300.h);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedListController>(
      init: FeedListController(),
      id: "feed_list",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: AppSize.appBarHeight,
            backgroundColor: AppColors.navigationBarColor,
            elevation: AppSize.appBarElevation,
            title: TextWidget.title1(
              LocaleKeys.feedPageTitle.tr,
              color: AppColors.titleColor,
            ),
            actions: [
              PopupMenuButton(
                icon: IconWidget.svg(
                  AssetsSvgs.plusLgSvg,
                  color: AppColors.titleColor,
                ).paddingRight(AppSpace.listItem),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: FeedAddButtonFunc.addFromUrl,
                    child: TextWidget.body1(
                      LocaleKeys.feedAddFromUrl.tr,
                      color: AppColors.titleColor,
                    ),
                  ),
                  PopupMenuItem(
                    value: FeedAddButtonFunc.importFromOpml,
                    child: TextWidget.body1(
                      LocaleKeys.feedAddFromOpml.tr,
                      color: AppColors.titleColor,
                    ),
                  ),
                  PopupMenuItem(
                    value: FeedAddButtonFunc.addGroup,
                    child: TextWidget.body1(
                      LocaleKeys.feedAddGroup.tr,
                      color: AppColors.titleColor,
                    ),
                  ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case FeedAddButtonFunc.addFromUrl:
                      showCustomModalBottomSheet(
                          context: context,
                          builder: (context) => _buildFeedAddFromUrlForm());
                      break;
                    case FeedAddButtonFunc.importFromOpml:
                      controller.onImportFromOpml();
                      break;
                    case FeedAddButtonFunc.addGroup:
                      controller.clearGroupForm();
                      showCustomModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              _buildFeedAddGroupForm(isEdit: false));
                      break;
                  }
                },
              )
            ],
          ),
          body: SafeArea(
            child: _buildView(context).backgroundColor(AppColors.background),
          ),
        );
      },
    );
  }
}
