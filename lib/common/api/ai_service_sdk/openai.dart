import 'package:dio/dio.dart';
import 'package:feed_inbox_app/common/index.dart';

enum OpenAIModel { gpt35 }

extension OpenAIModelExtension on OpenAIModel {
  String get name {
    switch (this) {
      case OpenAIModel.gpt35:
        return 'gpt-3.5-turbo';
    }
  }
}

class OpenAI {
  static final completeApi = Api(
      url: 'https://api.openai.com/v1/completions', method: HttpMethod.post);
  static final chatApi = Api(
      url: 'https://api.openai.com/v1/chat/completions',
      method: HttpMethod.post);

  static Future<OpenAIResponse?> complete(OpenAIRequest request) async {
    try {
      var res = await HttpService.to.post(completeApi.url,
          data: request.toJson(), options: Options(headers: request.header));
      return OpenAIResponse.fromJson(res.data);
    } catch (e) {
      Loading.toast('Openai request error');
      LogService.to.e(e);
      return null;
    }
  }
}

class OpenAIRequest {
  final OpenAIModel model;
  final String prompt;
  final int? maxTokens;
  final int? temperature;
  final Map<String, String> header;

  OpenAIRequest(
      {this.model = OpenAIModel.gpt35,
      required this.prompt,
      this.maxTokens,
      this.temperature,
      required this.header});

  Map<String, dynamic> toJson() {
    return {
      'model': model.name,
      'prompt': prompt,
      'max_tokens': maxTokens,
      'temperature': temperature,
    };
  }
}

class Choice {
  final String text;
  final double? logprobs;
  final int index;
  final String finishReason;

  Choice(
      {required this.text,
      this.logprobs,
      required this.finishReason,
      required this.index});

  factory Choice.fromJson(Map<String, dynamic> json) {
    return Choice(
        text: json['text'],
        logprobs: json['logprobs'],
        finishReason: json['finish_reason'],
        index: json['index']);
  }
}

class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  Usage(
      {required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens});

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
        promptTokens: json['prompt_tokens'],
        completionTokens: json['completion_tokens'],
        totalTokens: json['total_tokens']);
  }
}

class OpenAIResponse {
  final String id;
  final String object;
  final int created;
  final int model;
  final List<Choice> choicesList;
  final Usage usage;

  OpenAIResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.choicesList,
      required this.usage});

  factory OpenAIResponse.fromJson(Map<String, dynamic> json) {
    return OpenAIResponse(
        id: json['id'],
        object: json['object'],
        created: json['created'],
        model: json['model'],
        choicesList: json['choices']
            .map<Choice>((choice) => Choice.fromJson(choice))
            .toList(),
        usage: Usage.fromJson(json['usage']));
  }

  String? get text {
    for (var choice in choicesList) {
      if (choice.finishReason == 'stop') {
        return choice.text;
      }
    }
    return null;
  }
}
