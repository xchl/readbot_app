import 'package:isar/isar.dart';

part 'content.g.dart';

enum ContentType {
  Html,
}

@collection
class Content {
  Id id = Isar.autoIncrement;

  @enumerated
  ContentType type;

  @Index(unique: true, replace: true)
  String uri;

  String? content;

  Content({required this.type, required this.uri, this.content});
}
