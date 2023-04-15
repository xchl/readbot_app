import 'package:isar/isar.dart';

part 'content.g.dart';

enum ContentType {
  html,
}

@collection
class ContentModel {
  Id id = Isar.autoIncrement;

  @enumerated
  ContentType type;

  @Index(unique: true, replace: true)
  String uri;

  String content;

  int feedItemId;

  ContentModel(
      {required this.type,
      required this.uri,
      required this.content,
      required this.feedItemId});
}
