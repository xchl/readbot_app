import 'package:isar/isar.dart';

part 'feed_group.g.dart';

@collection
class FeedGroup {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? name;

  String? description;

  FeedGroup({
    this.name,
    this.description,
  });
}
