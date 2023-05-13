import 'package:readbot/common/index.dart';
import 'package:isar/isar.dart';

part 'feed_update_record.g.dart';

@collection
class FeedUpdateRecordModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String feedUrl;

  DateTime lastUpdate;

  String lastContentHash;

  DateTime? lastItemPublishTime;

  bool isSynced;

  bool isDeleted = false;

  @Index()
  DateTime updateTime;

  FeedUpdateRecordModel({
    required this.lastUpdate,
    required this.lastContentHash,
    required this.lastItemPublishTime,
    required this.updateTime,
    required this.feedUrl,
    required this.isSynced,
  });
}

// function to convert FeedUpdateRecordModel to FeedUpdateRecord
FeedUpdateRecord toFeedUpdateRecord(FeedUpdateRecordModel model) {
  return FeedUpdateRecord(
    feedUrl: model.feedUrl,
    lastUpdate: model.lastUpdate.millisecondsSinceEpoch,
    lastContentHash: model.lastContentHash,
    lastItemPublishTime: model.lastItemPublishTime?.millisecondsSinceEpoch,
    updateTime: model.updateTime.millisecondsSinceEpoch,
  );
}

// function to convert FeedUpdateRecordModel list to FeedUpdateRecord list
List<FeedUpdateRecord> toFeedUpdateRecordList(
    List<FeedUpdateRecordModel> models) {
  return models.map((model) => toFeedUpdateRecord(model)).toList();
}

// function to convert FeedUpdateRecord to FeedUpdateRecordModel
FeedUpdateRecordModel toFeedUpdateRecordModel(FeedUpdateRecord record) {
  return FeedUpdateRecordModel(
      feedUrl: record.feedUrl,
      lastUpdate:
          DateTime.fromMillisecondsSinceEpoch(record.lastUpdate.toInt()),
      lastContentHash: record.lastContentHash,
      lastItemPublishTime: record.lastItemPublishTime == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(record.lastItemPublishTime!),
      updateTime:
          DateTime.fromMillisecondsSinceEpoch(record.updateTime.toInt()),
      isSynced: true);
}

// function to convert FeedUpdateRecord list to FeedUpdateRecordModel list
List<FeedUpdateRecordModel> toFeedUpdateRecordModelList(
    List<FeedUpdateRecord> records) {
  return records.map((record) => toFeedUpdateRecordModel(record)).toList();
}
