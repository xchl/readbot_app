import 'package:feed_inbox_app/common/models/proto/model.pb.dart' as pb_model;
import 'package:fixnum/fixnum.dart';
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

  @Index()
  DateTime updateTime;

  FeedUpdateRecordModel({
    required this.lastUpdate,
    required this.lastContentHash,
    required this.lastItemPublishTime,
    required this.updateTime,
    required this.feedUrl,
  });
}

// function to convert FeedUpdateRecordModel to FeedUpdateRecord
pb_model.FeedUpdateRecord toFeedUpdateRecord(FeedUpdateRecordModel model) {
  return pb_model.FeedUpdateRecord(
    feedUrl: model.feedUrl,
    lastUpdate: Int64(model.lastUpdate.millisecondsSinceEpoch),
    lastContentHash: model.lastContentHash,
    lastItemPublishTime: model.lastItemPublishTime == null
        ? null
        : Int64(model.lastItemPublishTime!.millisecondsSinceEpoch),
    updateTime: Int64(model.updateTime.millisecondsSinceEpoch),
  );
}

// function to convert FeedUpdateRecordModel list to FeedUpdateRecord list
List<pb_model.FeedUpdateRecord> toFeedUpdateRecordList(
    List<FeedUpdateRecordModel> models) {
  return models.map((model) => toFeedUpdateRecord(model)).toList();
}

// function to convert FeedUpdateRecord to FeedUpdateRecordModel
FeedUpdateRecordModel toFeedUpdateRecordModel(
    pb_model.FeedUpdateRecord record) {
  return FeedUpdateRecordModel(
    feedUrl: record.feedUrl,
    lastUpdate: DateTime.fromMillisecondsSinceEpoch(record.lastUpdate.toInt()),
    lastContentHash: record.lastContentHash,
    lastItemPublishTime:
        DateTime.fromMillisecondsSinceEpoch(record.lastItemPublishTime.toInt()),
    updateTime: DateTime.fromMillisecondsSinceEpoch(record.updateTime.toInt()),
  );
}

// function to convert FeedUpdateRecord list to FeedUpdateRecordModel list
List<FeedUpdateRecordModel> toFeedUpdateRecordModelList(
    List<pb_model.FeedUpdateRecord> records) {
  return records.map((record) => toFeedUpdateRecordModel(record)).toList();
}
