import 'package:readbot/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiSetttingController extends GetxController {
  AiSetttingController();

  bool enableAI = ConfigService.to.enableAi;
  String openAIToken = ConfigService.to.openAIToken ?? '';
  String openAIProxyServer = ConfigService.to.openAIProxyUrl ?? '';

  /// 定义输入控制器
  TextEditingController tokenController = TextEditingController();
  TextEditingController proxyServerController = TextEditingController();

  /// 表单 key
  GlobalKey tokenFromKey = GlobalKey<FormState>();
  GlobalKey proxyServerFromKey = GlobalKey<FormState>();

  String selectAiService = ConfigService.to.aiService.name;

  final List<String> aiService = AIService.values.map((e) => e.name).toList();

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
      openAIToken = tokenController.text.trim();
      await ConfigService.to.saveOpenAIToken(openAIToken);
      update(["ai_settting"]);
    }
    Get.back();
  }

  void onAddProxyServer() async {
    if ((proxyServerFromKey.currentState as FormState).validate()) {
      openAIProxyServer = proxyServerController.text.trim();
      await ConfigService.to.saveOpenAIProxyUrl(openAIProxyServer);
      update(["ai_settting"]);
    }
    Get.back();
  }

  void onAiServiceChange(String? val) async {
    if (val == null) return;
    selectAiService = val;
    await ConfigService.to.saveAiService(selectAiService);
    update(["ai_settting"]);
  }
}
