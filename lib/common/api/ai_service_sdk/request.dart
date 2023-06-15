import 'package:readbot/common/api/ai_service_sdk/index.dart';

enum HttpMethod { get, post }

enum TaskType { summary }

class Api {
  String url;
  HttpMethod method;

  Api({required this.url, required this.method});
}

class AIRequest {
  final AIService service;
  final Map<String, String> headers;
  final Map<String, dynamic>? otherParms;
  final TaskType taskType;
  final String userContent;

  final String? model;

  AIRequest({
    required this.service,
    required this.headers,
    required this.taskType,
    required this.userContent,
    this.model,
    this.otherParms,
  });
}
