import 'package:feed_inbox_app/common/index.dart';

class AiApi {
  final ApiType apiType = ApiType.thirdPart;
  static Future<String?> summary(String content) async {
    String prompt = createSummaryPrompt(content);
    AIRequest request = createAIRequest(prompt);
    AIResponse? response = await AIProxy.summary(request);
    return response?.message;
  }

  static AIRequest createAIRequest(String prompt) {
    return AIRequest(
      service: ConfigService.to.aiService,
      prompt: prompt,
      headers: Map.from({
        'Authorization': 'Bearer ${ConfigService.to.openAIToken}',
      }),
    );
  }

  static String createSummaryPrompt(content) {
    return """
    请以列表的形式返回下面文章的主要内容，语言尽量简洁

    $content
    """;
  }
}
