import 'package:readbot/common/index.dart';

class AiApi {
  final ApiType apiType = ApiType.thirdPart;
  static Future<String?> summary(String content) async {
    AIService service = ConfigService.to.aiService;
    if (content.length > service.maxToken) {
      return null;
    }
    AIRequest request = AIRequest(
        taskType: TaskType.summary,
        userContent: content,
        service: service,
        headers: Map.from({
          'Authorization': 'Bearer ${ConfigService.to.openAIToken}',
        }),
        otherParms: {
          'maxTokens': 200,
          'temperature': 0,
        });
    AIResponse? response = await AIProxy.summary(request);
    return response?.message;
  }
}
