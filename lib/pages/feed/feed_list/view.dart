import 'package:readbot/common/index.dart';
import 'package:readbot/common/widgets/dropdown_menu_form.dart';
import 'package:readbot/pages/feed/feed_list/widgets/muti_level_Option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

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
            .paddingBottom(AppSpace.listItem),

        // 添加按钮
        ButtonWidget.text(
          LocaleKeys.addBtn.tr,
          onTap: controller.onAddFeed,
        ).paddingBottom(AppSpace.listItem),
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(AppSize.addFeedFormHeight);
  }

  Widget _buildFeedModifyForm(FeedModel feed) {
    return Form(
      key: controller.feedFormKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        TextFormWidget(
                keyboardType: TextInputType.text,
                controller: controller.feedNameController,
                labelText: LocaleKeys.feedTitle.tr,
                validator: Validators.notEmpty(LocaleKeys.validatorRequired.tr))
            .paddingBottom(AppSpace.listItem),
        TextFormWidget(
                keyboardType: TextInputType.text,
                controller: controller.feedDescController,
                labelText: LocaleKeys.feedDesc.tr)
            .paddingBottom(AppSpace.listItem),
        // feed name
        DropDownMenuFormWidget(
                onTap: (value) => {controller.onModifyFeedGroup(value)},
                options: controller.allGroup,
                selectValue: controller.selectedFeedGroup)
            .paddingBottom(AppSpace.listItem),
        // url
        <Widget>[
          // 取消订阅
          ButtonWidget.text(
            LocaleKeys.feedDelete.tr,
            onTap: controller.onUnsubscribeFeed,
          ).paddingRight(AppSpace.seqx2Horization),
          // 修改
          ButtonWidget.text(
            LocaleKeys.commonBottomSave.tr,
            onTap: controller.onFeedSave,
          )
        ].toRow(mainAxisAlignment: MainAxisAlignment.center)
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(AppSize.addFeedFormHeight);
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
            .paddingBottom(AppSpace.listItem),
        TextFormWidget(
          keyboardType: TextInputType.text,
          controller: controller.groupDescController,
          labelText: LocaleKeys.feedAddGroupDescptionLabel.tr,
        ).paddingBottom(AppSpace.listItem),
        isEdit
            ? <Widget>[
                // 删除按钮
                ButtonWidget.text(
                  LocaleKeys.feedGroupDelete.tr,
                  onTap: controller.onGroupDelete,
                ).paddingRight(AppSpace.seqx2Horization),
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
                ).paddingRight(AppSpace.seqx2Horization),
                // 添加按钮
                ButtonWidget.text(
                  LocaleKeys.commonBottomSave.tr,
                  onTap: controller.onGroupSave,
                )
              ].toRow(mainAxisAlignment: MainAxisAlignment.center)
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(AppSize.addGroupFormHeight);
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
                PopupButtonWidget(
                  options: [
                    ButtonWidget.text(
                      LocaleKeys.feedAddFromUrl.tr,
                      onTap: () => showCustomModalBottomSheet(
                          context: context,
                          builder: (context) => _buildFeedAddFromUrlForm()),
                    ),
                    ButtonWidget.text(
                      LocaleKeys.feedAddFromOpml.tr,
                      onTap: () => controller.onImportFromOpml(),
                    ),
                    ButtonWidget.text(
                      LocaleKeys.feedAddGroup.tr,
                      onTap: () {
                        controller.clearGroupForm();
                        showCustomModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                _buildFeedAddGroupForm(isEdit: false));
                      },
                    ),
                  ],
                  width: AppSize.popupMenuWidth,
                )
              ]),
          body: SafeArea(
            child: _buildView(context).backgroundColor(AppColors.background),
          ),
        );
      },
    );
  }
}
