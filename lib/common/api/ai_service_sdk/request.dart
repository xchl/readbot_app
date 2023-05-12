import 'package:readbot/common/api/ai_service_sdk/index.dart';

enum HttpMethod { get, post }

class Api {
  String url;
  HttpMethod method;

  Api({required this.url, required this.method});
}

class AIRequest {
  final AIService service;
  final Map<String, String> headers;
  final Map<String, dynamic>? otherParms;
  final String? model;
  final String prompt;

  AIRequest({
    required this.service,
    required this.headers,
    this.model,
    required this.prompt,
    this.otherParms,
  });

  OpenAIChatRequest toOpenAIChat() {
    return OpenAIChatRequest(
      messages: [Message(content: prompt, role: 'user')],
      header: headers,
      maxTokens: otherParms?['maxTokens'],
      temperature: otherParms?['temperature'],
    );
  }

  OpenAICompleteRequest toOpenAIComplete() {
    return OpenAICompleteRequest(
      prompt: prompt,
      header: headers,
      maxTokens: otherParms?['maxTokens'],
      temperature: otherParms?['temperature'],
    );
  }
}
