import 'package:feed_inbox_app/common/services/index.dart';
import 'package:feed_inbox_app/common/values/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiSetttingController extends GetxController {
  AiSetttingController();

  bool enableAI = ConfigService.to.enableAi;
  String openAIToken = ConfigService.to.openAIToken;

  /// 定义输入控制器
  TextEditingController tokenController = TextEditingController();

  /// 表单 key
  GlobalKey tokenFromKey = GlobalKey<FormState>();

  String selectAiService = ConfigService.to.aiService == ''
      ? Constants.openAI
      : ConfigService.to.aiService;

  final List<String> aiService = [
    Constants.openAI,
  ];

  _initData() {
    update(["ai_settting"]);
  }

  void onTap() {}

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  void onEnableAIChange(bool val) async {
    enableAI = val;
    await ConfigService.to.saveEnableAiOption(enableAI);
    update(["ai_settting"]);
  }

  void onAddToken() async {
    if ((tokenFromKey.currentState as FormState).validate()) {
      openAIToken = tokenController.text;
      await ConfigService.to.saveOpenAIToken(openAIToken);
      update(["ai_settting"]);
    }
  }

  void onAiServiceChange(String? val) async {
    if (val == null) return;
    selectAiService = val;
    await ConfigService.to.saveAiService(selectAiService);
    update(["ai_settting"]);
  }
}
