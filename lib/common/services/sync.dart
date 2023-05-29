import 'package:readbot/common/index.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class SyncService extends GetxService {
  static SyncService get to => Get.find();

  final List<Function> _syncQueue = [];
  bool _isSyncing = false;

  List<ModelName> syncModels = [];

  @override
  void onInit() async {
    super.onInit();
    syncModels = [
      ModelName.feed,
      ModelName.feedItem,
      ModelName.feedUpdateRecord,
      ModelName.feedGroup,
    ];
  }

  Future<void> _processSyncQueue() async {
    if (_isSyncing || _syncQueue.isEmpty) return;
    _isSyncing = true;

    await _syncQueue.first();
    _syncQueue.removeAt(0);

    _isSyncing = false;

    _processSyncQueue();
  }

  // a function wait the _syncQueue to be empty
  Future<void> waitSyncQueueEmpty() async {
    while (_syncQueue.isNotEmpty) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  void pullFromService() {
    if (!UserService.isLogin || !ConfigService().enableSync) return;
    _syncQueue.add(_syncPull);
    _processSyncQueue();
  }

  void pushToService() {
    if (!UserService.isLogin || !ConfigService().enableSync) return;
    _syncQueue.add(_syncPush);
    _processSyncQueue();
  }

  // 从数据库中获取的SyncTimestampModel转换为SyncTimestamp
  // 如果modelName不在syncModels中，默认是null，表示不会被同步
  // 如果数据库中没有对应的SyncTimestampModel，则默认为0，表示从头开始同步
  SyncTimestamp convertToSyncTimestamp(List<ModelName> syncModels,
      List<SyncTimestampModel?> syncTimestampModels) {
    SyncTimestamp syncTimestamp = SyncTimestamp();
    for (var i = 0; i < syncModels.length; i++) {
      var syncModel = syncModels[i];
      var syncTimestampModel = syncTimestampModels[i];
      switch (syncModel) {
        case ModelName.feed:
          syncTimestamp.feed = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
        case ModelName.feedItem:
          syncTimestamp.feedItem = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
        case ModelName.feedGroup:
          syncTimestamp.feedGroup = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
        case ModelName.feedUpdateRecord:
          syncTimestamp.feedUpdateRecord = syncTimestampModel != null
              ? syncTimestampModel.syncTime.millisecondsSinceEpoch
              : 0;
          break;
      }
    }
    return syncTimestamp;
  }

  // sync pull from server
  Future<void> _syncPull() async {
    List<SyncTimestampModel?> syncTimestampModels =
        await DatabaseManager().getSyncTimestampModel(syncModels);
    var syncTimestamp = convertToSyncTimestamp(syncModels, syncTimestampModels);
    var contentPullRequest = ContentPullRequest(
        client: ConfigService.to.clientInfo, syncTimestamp: syncTimestamp);

    ContentPullResponse? contentPullResponse =
        await ContentSyncApi.pull(contentPullRequest);

    if (contentPullResponse == null) return;

    List<SyncTimestampModel> syncTimestampModelsToSave = [];

    if (contentPullResponse.feeds.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feed,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feed!)));
    }
    if (contentPullResponse.feedItems.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feedItem,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feedItem!)));
    }
    if (contentPullResponse.feedGroups.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(ModelName.feedGroup,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feedGroup!)));
    }
    if (contentPullResponse.feedUpdateRecords.isNotEmpty) {
      syncTimestampModelsToSave.add(SyncTimestampModel(
          ModelName.feedUpdateRecord,
          syncTime: DateTime.fromMillisecondsSinceEpoch(
              contentPullResponse.syncTimestamp.feedUpdateRecord!)));
    }

    var feedItemList = toFeedItemModelList(contentPullResponse.feedItems);
    var feedList = toFeedModelList(contentPullResponse.feeds);
    var feedGroupList = toFeedGroupModelList(contentPullResponse.feedGroups);
    var feedUpdateRecordList =
        toFeedUpdateRecordModelList(contentPullResponse.feedUpdateRecords);

    Tuple2 updateCount = await checkFeedItemUpdate(feedItemList);
    await DatabaseManager().pullSyncSave(feedList, feedItemList, feedGroupList,
        feedUpdateRecordList, syncTimestampModelsToSave);
    NoticeService.to.updateFocus(updateCount.item1);
    NoticeService.to.updateExplore(updateCount.item2);
  }

  Future<Tuple2> checkFeedItemUpdate(
    List<FeedItemModel> feedItemList,
  ) async {
    int newFocusCount = 0;
    int newExploreCount = 0;
    List<FeedItemModel> needDownload = List.empty(growable: true);
    if (feedItemList.isNotEmpty) {
      List<FeedItemModel> notDeleteFeedItem =
          feedItemList.where((element) => element.isDeleted == false).toList();
      List<FeedItemModel?> result =
          await DatabaseManager().checkFeedItemsInDb(notDeleteFeedItem);
      for (var i = 0; i < notDeleteFeedItem.length; i++) {
        // if not in db, download new item content
        if (result[i] == null) needDownload.add(notDeleteFeedItem[i]);
        // if new item is focus, while old item is not exist or not focus or deleted, update focus count
        if (notDeleteFeedItem[i].isFocus == true) {
          if (result[i] == null ||
              result[i]!.isDeleted == true ||
              result[i]!.isFocus == false) {
            newFocusCount += 1;
          }
        } else {
          // if new item is explore, while old item is not exist or not explore or deleted, update explore count
          if (result[i] == null ||
              result[i]!.isDeleted == true ||
              result[i]!.isFocus == true) {
            newExploreCount += 1;
          }
        }
      }

      if (needDownload.isNotEmpty) {
        FeedService.to.downloadHtml(needDownload);
      }
    }
    return Tuple2(newFocusCount, newExploreCount);
  }

  Future<void> _syncPush() async {
    List<FeedModel> feedModels = [];
    List<FeedItemModel> feedItemModels = [];
    List<FeedGroupModel> feedGroupModels = [];
    List<FeedUpdateRecordModel> feedUpdateRecordModels = [];
    for (var syncModel in syncModels) {
      switch (syncModel) {
        case ModelName.feed:
          feedModels = await DatabaseManager().getFeedsNotSynced();
          break;
        case ModelName.feedItem:
          feedItemModels = await DatabaseManager().getFeedItemsNotSynced();
          break;
        case ModelName.feedGroup:
          feedGroupModels = await DatabaseManager().getFeedGroupsNotSynced();
          break;
        case ModelName.feedUpdateRecord:
          feedUpdateRecordModels =
              await DatabaseManager().getFeedUpdateRecordsNotSynced();
          break;
      }
    }

    if (feedModels.isEmpty &&
        feedItemModels.isEmpty &&
        feedGroupModels.isEmpty &&
        feedUpdateRecordModels.isEmpty) return;

    var contentPushRequest =
        ContentPushRequest(client: ConfigService.to.clientInfo);
    contentPushRequest.feeds = toFeedList(feedModels);
    contentPushRequest.feedItems = toFeedItemList(feedItemModels);
    contentPushRequest.feedGroups = toFeedGroupList(feedGroupModels);
    contentPushRequest.feedUpdateRecords =
        toFeedUpdateRecordList(feedUpdateRecordModels);

    await ContentSyncApi.push(contentPushRequest);

    // change isSynced to true for all modfels and save
    for (var feedModel in feedModels) {
      feedModel.isSynced = true;
    }
    for (var feedItemModel in feedItemModels) {
      feedItemModel.isSynced = true;
    }
    for (var feedGroupModel in feedGroupModels) {
      feedGroupModel.isSynced = true;
    }
    for (var feedUpdateRecordModel in feedUpdateRecordModels) {
      feedUpdateRecordModel.isSynced = true;
    }

    await DatabaseManager().pushSyncSave(
        feedModels, feedItemModels, feedGroupModels, feedUpdateRecordModels);
  }
}
