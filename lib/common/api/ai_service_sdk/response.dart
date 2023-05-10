import 'index.dart';

class AIResponse {
  final AIService service;
  final String? message;

  AIResponse({
    required this.service,
    this.message,
  });

  factory AIResponse.fromOpenAI(OpenAIResponse response) {
    return AIResponse(
      service: AIService.openai,
      message: response.text,
    );
  }
}
