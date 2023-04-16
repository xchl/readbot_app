import 'package:isar/isar.dart';

part 'sync_timestamp.g.dart';

enum ModelName {
  feed,
  feedItem,
  feedUpdateRecord,
  feedGroup,
}

@collection
class SyncTimestampModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  @enumerated
  ModelName modelName;

  DateTime syncTime;

  SyncTimestampModel(
    this.modelName, {
    required this.syncTime,
  });
}
