import 'package:isar/isar.dart';

part 'feed_group.g.dart';

@collection
class FeedGroup {
  Id id = Isar.autoIncrement;
  String? name;
  String? description;
}
