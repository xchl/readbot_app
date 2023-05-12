import 'package:readbot/common/index.dart';

class AiApi {
  final ApiType apiType = ApiType.thirdPart;
  static Future<String?> summary(String content) async {
    String prompt = createSummaryPrompt(content);
    AIRequest request = createAIRequest(prompt);
    AIResponse? response = await AIProxy.summary(request);
    return response?.message;
  }

  static AIRequest createAIRequest(String prompt) {
    AIService service = ConfigService.to.aiService;
    return AIRequest(
      service: service,
      prompt: prompt.length > service.maxToken
          ? prompt.substring(0, service.maxToken)
          : prompt,
      headers: Map.from({
        'Authorization': 'Bearer ${ConfigService.to.openAIToken}',
      }),
    );
  }

  static String createSummaryPrompt(content) {
    return """
    请以列表的方式返回下面文章的主要内容，语言尽量简洁，最多5条总结。

    $content
    """;
  }
}
