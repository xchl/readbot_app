import 'package:feed_inbox_app/common/index.dart';

class SyncTimestamp {
  int? feed;
  int? feedItem;
  int? feedGroup;
  int? feedUpdateRecord;

  SyncTimestamp(
      {this.feed, this.feedItem, this.feedGroup, this.feedUpdateRecord});

  // 从数据库中获取的SyncTimestampModel转换为SyncTimestamp
  // 如果modelName不在syncModels中，默认是null，表示不会被同步
  // 如果数据库中没有对应的SyncTimestampModel，则默认为0，表示从头开始同步
  SyncTimestamp.fromSyncModels(List<ModelName> syncModels,
      List<SyncTimestampModel?> syncTimestampModels) {
    for (var i = 0; i < syncModels.length; i++) {
      var syncModel = syncModels[i];
      var syncTimestampModel = syncTimestampModels[i];
      switch (syncModel) {
        case ModelName.feed:
          feed = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
        case ModelName.feedItem:
          feedItem = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
        case ModelName.feedGroup:
          feedGroup = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
        case ModelName.feedUpdateRecord:
          feedUpdateRecord = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
      }
    }
  }

  SyncTimestamp.fromJson(Map<String, dynamic> json) {
    feed = json['feed'];
    feedItem = json['feedItem'];
    feedGroup = json['feedGroup'];
    feedUpdateRecord = json['feedUpdateRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feed'] = feed;
    data['feedItem'] = feedItem;
    data['feedGroup'] = feedGroup;
    data['feedUpdateRecord'] = feedUpdateRecord;
    return data;
  }
}

class ContentPullRequest {
  SyncTimestamp syncTimestamp;

  ContentPullRequest({required this.syncTimestamp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['syncTimestamp'] = syncTimestamp.toJson();
    return data;
  }
}