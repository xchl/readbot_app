import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:readbot/pages/my/ai_settting/widgets/button_show_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiSettingPage extends GetView<AiSetttingController> {
  const AiSettingPage({Key? key}) : super(key: key);

  Widget _buildAiChoiceSetting() {
    return <Widget>[
      <Widget>[
        SwitchItemWidget(
          title: LocaleKeys.myAISettingEnableAI.tr,
          statu: controller.enableAI,
          onTap: (bool value) => controller.onEnableAIChange(value),
        ),
        if (controller.enableAI)
          SelectItemWidget(
              title: LocaleKeys.myAIServiceSelect.tr,
              onTap: controller.onAiServiceChange,
              selectValue: controller.selectAiService,
              options: controller.aiService)
      ].toColumn().backgroundColor(AppColors.background)
    ].toColumn();
  }

  Widget _buildAddTokenForm() {
    return Form(
      key: controller.tokenFromKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // url
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.text,
          controller: controller.tokenController,
          labelText: LocaleKeys.myAIServiceApiTokenAddDesc.tr,
        ).paddingBottom(AppSpace.listItem),

        // 添加按钮
        ButtonWidget.text(
          LocaleKeys.addBtn.tr,
          onTap: controller.onAddToken,
        ).paddingBottom(AppSpace.listItem),
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(AppSize.commonFormHeight);
  }

  Widget _buildAddProxyServerForm() {
    return Form(
      key: controller.proxyServerFromKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // url
        TextFormWidget(
          autofocus: true,
          keyboardType: TextInputType.text,
          controller: controller.proxyServerController,
          labelText: LocaleKeys.myAIServiceProxyServer.tr,
        ).paddingBottom(AppSpace.listItem),

        // 添加按钮
        ButtonWidget.text(
          LocaleKeys.addBtn.tr,
          onTap: controller.onAddProxyServer,
        ).paddingBottom(AppSpace.listItem),
      ].toColumn(),
    ).paddingAll(AppSpace.card).height(AppSize.commonFormHeight);
  }

  Widget _buildOpenAISetting() {
    return <Widget>[
      TextWidget.body1(
        LocaleKeys.openAI.tr,
        color: AppColors.hideColor,
      ).alignLeft().padding(left: AppSpace.page, bottom: AppSpace.listItem),
      <Widget>[
        ButtonShowItemWidget(
                title: LocaleKeys.myAIServiceApiToken.tr,
                content: controller.openAIToken,
                onTap: () => showCustomModalBottomSheet(
                    context: Get.context!,
                    builder: (context) => _buildAddTokenForm()))
            .paddingBottom(AppSpace.listItem),
        ButtonShowItemWidget(
            title: LocaleKeys.myAIServiceProxyServer.tr,
            content: controller.openAIProxyServer,
            onTap: () => showCustomModalBottomSheet(
                context: Get.context!,
                builder: (context) => _buildAddProxyServerForm())),
      ].toColumn().backgroundColor(AppColors.background)
    ].toColumn().paddingTop(AppSpace.card);
  }

  // 主视图
  Widget _buildView() {
    return <Widget>[
      _buildAiChoiceSetting(),
      if (controller.enableAI &&
          controller.selectAiService == AIService.openai.name)
        _buildOpenAISetting()
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiSetttingController>(
      init: AiSetttingController(),
      id: "ai_settting",
      builder: (_) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: AppColors.background,
                elevation: 0,
                title: TextWidget.title1(
                  LocaleKeys.myAISetting.tr,
                  color: AppColors.titleColor,
                )),
            body: SafeArea(
              child: _buildView(),
            ));
      },
    );
  }
}
