import 'package:feed_inbox_app/common/models/proto/model.pb.dart' as pb_model;
import 'package:fixnum/fixnum.dart';
import 'package:isar/isar.dart';

part 'feed_group.g.dart';

@collection
class FeedGroupModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? name;

  String? description;

  DateTime updateTime = DateTime.now();

  FeedGroupModel({this.name, this.description, required this.updateTime});
}

// function to convert FeedGroupModel to FeedGroup
pb_model.FeedGroup toFeedGroup(FeedGroupModel model) {
  return pb_model.FeedGroup(
    id: model.id,
    name: model.name,
    description: model.description,
    updateTime: Int64(model.updateTime.millisecondsSinceEpoch),
  );
}

// function to convert FeedGroupModel list to FeedGroup list
List<pb_model.FeedGroup> toFeedGroupList(List<FeedGroupModel> models) {
  return models.map((model) => toFeedGroup(model)).toList();
}

// function to convert FeedGroup to FeedGroupModel
FeedGroupModel toFeedGroupModel(pb_model.FeedGroup feedGroup) {
  return FeedGroupModel(
    name: feedGroup.name,
    description: feedGroup.description,
    updateTime:
        DateTime.fromMillisecondsSinceEpoch(feedGroup.updateTime.toInt()),
  );
}

// function to convert FeedGroup list to FeedGroupModel list
List<FeedGroupModel> toFeedGroupModelList(List<pb_model.FeedGroup> feedGroups) {
  return feedGroups.map((feedGroup) => toFeedGroupModel(feedGroup)).toList();
}
