import 'package:feed_inbox_app/common/index.dart';
import 'package:isar/isar.dart';

part 'feed_group.g.dart';

@collection
class FeedGroupModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String name;

  String? description;

  DateTime updateTime = DateTime.now();

  bool isSynced;

  FeedGroupModel(
      {required this.name,
      this.description,
      required this.updateTime,
      this.isSynced = false});
}

// function to convert FeedGroupModel to FeedGroup
FeedGroup toFeedGroup(FeedGroupModel model) {
  return FeedGroup(
    name: model.name,
    description: model.description,
    updateTime: model.updateTime.millisecondsSinceEpoch,
  );
}

// function to convert FeedGroupModel list to FeedGroup list
List<FeedGroup> toFeedGroupList(List<FeedGroupModel> models) {
  return models.map((model) => toFeedGroup(model)).toList();
}

// function to convert FeedGroup to FeedGroupModel
FeedGroupModel toFeedGroupModel(FeedGroup feedGroup) {
  return FeedGroupModel(
      name: feedGroup.name,
      description: feedGroup.description,
      updateTime:
          DateTime.fromMillisecondsSinceEpoch(feedGroup.updateTime.toInt()),
      isSynced: true);
}

// function to convert FeedGroup list to FeedGroupModel list
List<FeedGroupModel> toFeedGroupModelList(List<FeedGroup> feedGroups) {
  return feedGroups.map((feedGroup) => toFeedGroupModel(feedGroup)).toList();
}
