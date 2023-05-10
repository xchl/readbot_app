import 'package:feed_inbox_app/common/api/ai_service_sdk/index.dart';

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

  OpenAIRequest toOpenAI() {
    return OpenAIRequest(
      prompt: prompt,
      header: headers,
      maxTokens: otherParms?['maxTokens'],
      temperature: otherParms?['temperature'],
    );
  }
}
