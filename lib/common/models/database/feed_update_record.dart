import 'package:isar/isar.dart';

part 'feed_update_record.g.dart';

@collection
class FeedUpdateRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true, name: 'feedId')
  int feedId;

  DateTime lastUpdate;

  String lastContentHash;

  DateTime? lastItemPublishTime;

  FeedUpdateRecord({
    required this.feedId,
    required this.lastUpdate,
    required this.lastContentHash,
    this.lastItemPublishTime,
  });
}
