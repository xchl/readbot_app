import 'package:isar/isar.dart';

@collection
class FeedGroup {
  Id id = Isar.autoIncrement;
  String? name;
  String? description;
}
