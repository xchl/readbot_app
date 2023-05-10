import 'package:feed_inbox_app/common/api/ai_service_sdk/index.dart';

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
      OpenAIResponse? response = await OpenAI.complete(request.toOpenAI());
      if (response != null) {
        return AIResponse.fromOpenAI(response);
      }
    }
    return null;
  }
}
