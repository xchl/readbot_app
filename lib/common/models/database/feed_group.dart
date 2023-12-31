import 'package:readbot/common/index.dart';
import 'package:isar/isar.dart';

part 'feed_group.g.dart';

@collection
class FeedGroupModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String name;

  String? description;

  DateTime updateTime;

  bool isSynced;

  bool isDeleted;

  FeedGroupModel({
    required this.name,
    this.description,
    this.isSynced = false,
    this.isDeleted = false,
  }) : updateTime = DateTime.now();

  @override
  String toString() {
    return name;
  }
}

// function to convert FeedGroupModel to FeedGroup
FeedGroup toFeedGroup(FeedGroupModel model) {
  return FeedGroup(
      name: model.name,
      description: model.description,
      updateTime: model.updateTime.millisecondsSinceEpoch,
      isDeleted: model.isDeleted);
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
      isSynced: true,
      isDeleted: feedGroup.isDeleted)
    ..updateTime = DateTime.fromMillisecondsSinceEpoch(feedGroup.updateTime);
}

// function to convert FeedGroup list to FeedGroupModel list
List<FeedGroupModel> toFeedGroupModelList(List<FeedGroup> feedGroups) {
  return feedGroups.map((feedGroup) => toFeedGroupModel(feedGroup)).toList();
}
