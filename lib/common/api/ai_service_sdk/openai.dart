import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:readbot/common/index.dart';

enum OpenAIModel { gpt35 }

extension OpenAIModelExtension on OpenAIModel {
  String get name {
    switch (this) {
      case OpenAIModel.gpt35:
        return 'gpt-3.5-turbo';
    }
  }

  int get maxToken {
    switch (this) {
      case OpenAIModel.gpt35:
        return 4000;
    }
  }
}

class OpenAI {
  static Api get completeApi =>
      Api(url: '$baseUrl/v1/completions', method: HttpMethod.post);

  static get chatApi =>
      Api(url: '$baseUrl/v1/chat/completions', method: HttpMethod.post);

  static get baseUrl =>
      ConfigService.to.openAIProxyUrl ?? 'https://api.openai.com';

  static Future<OpenAICompleteResponse?> complete(
      OpenAICompleteRequest request) async {
    try {
      var res = await HttpService.to.post(completeApi.url,
          data: request.toJson(),
          options: Options(
              headers: request.header,
              // TODO
              receiveTimeout: const Duration(seconds: 90)));
      return OpenAICompleteResponse.fromJson(res.data);
    } catch (e) {
      LogService.to.e(e);
      return null;
    }
  }

  static Future<OpenAIChatResponse?> chat(OpenAIChatRequest request) async {
    try {
      debugPrint(chatApi.url);
      var res = await HttpService.to.post(chatApi.url,
          data: request.toJson(),
          options: Options(
              headers: request.header,
              //TODO
              receiveTimeout: const Duration(seconds: 60)));
      return OpenAIChatResponse.fromJson(res.data);
    } catch (e) {
      Loading.toast('Openai request error');
      LogService.to.e(e);
      return null;
    }
  }
}

class OpenAICompleteRequest {
  final OpenAIModel model;
  final String prompt;
  final int? maxTokens;
  final int? temperature;
  final Map<String, String> header;

  OpenAICompleteRequest(
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

class Message {
  final String role;
  final String content;

  Message({required this.role, required this.content});

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
    };
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(role: json['role'], content: json['content']);
  }
}

class OpenAIChatRequest {
  final OpenAIModel model;
  final List<Message> messages;
  final int? maxTokens;
  final int? temperature;
  final Map<String, String> header;

  OpenAIChatRequest(
      {this.model = OpenAIModel.gpt35,
      required this.messages,
      this.maxTokens,
      this.temperature,
      required this.header});

  Map<String, dynamic> toJson() {
    return {
      'model': model.name,
      'messages': messages.map((e) => e.toJson()).toList(),
      'max_tokens': maxTokens,
      'temperature': temperature,
    };
  }
}

class CompleteChoice {
  final String text;
  final double? logprobs;
  final int index;
  final String finishReason;

  CompleteChoice(
      {required this.text,
      this.logprobs,
      required this.finishReason,
      required this.index});

  factory CompleteChoice.fromJson(Map<String, dynamic> json) {
    return CompleteChoice(
        text: json['text'],
        logprobs: json['logprobs'],
        finishReason: json['finish_reason'],
        index: json['index']);
  }
}

class ChatChoice {
  final Message message;
  final int index;
  final String finishReason;

  ChatChoice(
      {required this.message, required this.finishReason, required this.index});

  factory ChatChoice.fromJson(Map<String, dynamic> json) {
    return ChatChoice(
        message: Message.fromJson(json['message']),
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

class OpenAICompleteResponse {
  final String id;
  final String object;
  final int created;
  final int model;
  final List<CompleteChoice> choicesList;
  final Usage usage;

  OpenAICompleteResponse(
      {required this.id,
      required this.object,
      required this.created,
      required this.model,
      required this.choicesList,
      required this.usage});

  factory OpenAICompleteResponse.fromJson(Map<String, dynamic> json) {
    return OpenAICompleteResponse(
        id: json['id'],
        object: json['object'],
        created: json['created'],
        model: json['model'],
        choicesList: json['choices']
            .map<CompleteChoice>((choice) => CompleteChoice.fromJson(choice))
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

class OpenAIChatResponse {
  final String id;
  final String object;
  final int created;
  final String model;
  final List<ChatChoice> choicesList;
  final Usage usage;

  OpenAIChatResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.choicesList,
    required this.usage,
    required this.model,
  });

  factory OpenAIChatResponse.fromJson(Map<String, dynamic> json) {
    return OpenAIChatResponse(
        id: json['id'],
        object: json['object'],
        created: json['created'],
        model: json['model'],
        choicesList: json['choices']
            .map<ChatChoice>((choice) => ChatChoice.fromJson(choice))
            .toList(),
        usage: Usage.fromJson(json['usage']));
  }

  String? get text {
    for (var choice in choicesList) {
      if (choice.finishReason == 'stop') {
        return choice.message.content;
      }
    }
    return null;
  }
}
