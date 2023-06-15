import 'package:readbot/common/api/ai_service_sdk/index.dart';

enum AIService {
  openai,
}

extension AIServiceExtension on AIService {
  String get name {
    switch (this) {
      case AIService.openai:
        return 'openai';
    }
  }

  int get maxToken {
    switch (this) {
      case AIService.openai:
        return 15000;
    }
  }

  static AIService? parse(String serviceName) {
    switch (serviceName.toLowerCase()) {
      case 'openai':
        return AIService.openai;
    }
    return null;
  }
}

extension ParseAIServiceExtension on String {
  AIService? parseAIService() {
    return AIServiceExtension.parse(this);
  }
}

class AIProxy {
  static Future<AIResponse?> summary(AIRequest request) async {
    if (request.service == AIService.openai) {
      OpenAIChatResponse? response = await OpenAI.chat(request);
      if (response != null) {
        return AIResponse.fromOpenAIChat(response);
      }
    }
    return null;
  }
}
