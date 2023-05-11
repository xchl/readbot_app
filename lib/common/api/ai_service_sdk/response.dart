import 'index.dart';

class AIResponse {
  final AIService service;
  final String? message;

  AIResponse({
    required this.service,
    this.message,
  });

  factory AIResponse.fromOpenAIComplte(OpenAICompleteResponse response) {
    return AIResponse(
      service: AIService.openai,
      message: response.text,
    );
  }

  factory AIResponse.fromOpenAIChat(OpenAIChatResponse response) {
    return AIResponse(
      service: AIService.openai,
      message: response.text,
    );
  }
}
