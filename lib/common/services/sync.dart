import 'package:feed_inbox_app/common/index.dart';
import 'package:get/get.dart';

class SyncService extends GetxService {
  static SyncService get to => Get.find();

  List<ModelName> syncModels = [];

  @override
  void onInit() async {
    super.onInit();
    // TODO 增加权限
    syncModels = [
      ModelName.feed,
      // ModelName.feedItem,
      // ModelName.feedUpdateRecord,
      ModelName.feedGroup,
    ];
  }

  // sync pull from server
  Future<void> syncPull() async {
    List<SyncTimestampModel?> syncTimestampModels =
        await DatabaseManager().getSyncTimestampModel(syncModels);
    var syncTimestamp =
        SyncTimestamp.fromSyncModels(syncModels, syncTimestampModels);
    var contentPullRequest = ContentPullRequest(syncTimestamp: syncTimestamp);

    ContentPullResponse contentPullResponse =
        await ContentSyncApi.pull(contentPullRequest);

    List<SyncTimestampModel> syncTimestampModelsToSave = [];

    if (contentPullResponse.syncTimestamp.feed != 0) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feed,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feed.toInt())));
    }
    if (contentPullResponse.syncTimestamp.feedItem != 0) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feedItem,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feedItem.toInt())));
    }
    if (contentPullResponse.syncTimestamp.feedGroup != 0) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feedGroup,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feedGroup.toInt())));
    }
    if (contentPullResponse.syncTimestamp.feedUpdateRecord != 0) {
      syncTimestampModelsToSave.add(SyncTimestampModel(
          ModelName.feedUpdateRecord,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feedUpdateRecord.toInt())));
    }

    await DatabaseManager().syncSave(
        toFeedModelList(contentPullResponse.feeds),
        toFeedItemModelList(contentPullResponse.feedItems),
        toFeedGroupModelList(contentPullResponse.feedGroups),
        toFeedUpdateRecordModelList(contentPullResponse.feedUpdateRecords),
        syncTimestampModelsToSave);
  }

  Future<void> syncPush() async {
    List<SyncTimestampModel?> syncTimestampModels =
        await DatabaseManager().getSyncTimestampModel(syncModels);

    var syncTimestamp =
        SyncTimestamp.fromSyncModels(syncModels, syncTimestampModels);

    List<FeedModel> feedModels = syncTimestamp.feed == null
        ? []
        : await DatabaseManager()
            .getLatestFeedModelListSorted(syncTimestamp.feed!);
    List<FeedItemModel> feedItemModels = syncTimestamp.feedItem == null
        ? []
        : await DatabaseManager()
            .getLatestFeedItemModelListSorted(syncTimestamp.feedItem!);
    List<FeedGroupModel> feedGroupModels = syncTimestamp.feedGroup == null
        ? []
        : await DatabaseManager()
            .getLatestFeedGroupModelListSorted(syncTimestamp.feedGroup!);
    List<FeedUpdateRecordModel> feedUpdateRecordModels =
        syncTimestamp.feedUpdateRecord == null
            ? []
            : await DatabaseManager().getLatestFeedUpdateRecordModelListSorted(
                syncTimestamp.feedUpdateRecord!);

    var contentPushRequest = ContentPushRequest(
        feeds: toFeedList(feedModels),
        feedItems: toFeedItemList(feedItemModels),
        feedGroups: toFeedGroupList(feedGroupModels),
        feedUpdateRecords: toFeedUpdateRecordList(feedUpdateRecordModels));

    await ContentSyncApi.push(contentPushRequest);

    List<SyncTimestampModel> syncTimestampModelsToSave = [];

    if (feedModels.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feed,
          syncTime: feedModels.last.updateTime));
    }
    if (feedItemModels.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feedItem,
          syncTime: feedItemModels.last.updateTime));
    }
    if (feedGroupModels.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feedGroup,
          syncTime: feedGroupModels.last.updateTime));
    }
    if (feedUpdateRecordModels.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(
          ModelName.feedUpdateRecord,
          syncTime: feedUpdateRecordModels.last.updateTime));
    }
    await DatabaseManager().saveSyncTimestampModel(syncTimestampModelsToSave);
  }
}
