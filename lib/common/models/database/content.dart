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

  @Index()
  String feedItemMd5String;

  @Index()
  String feedUrl;

  DateTime createTime = DateTime.now();

  bool isDeleted = false;

  ContentModel(
      {required this.type,
      required this.uri,
      required this.content,
      required this.feedItemMd5String,
      required this.feedUrl});
}
