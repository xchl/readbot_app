import 'package:readbot/common/index.dart';
// import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  factory DatabaseManager() => _instance;
  DatabaseManager._internal();

  late final Isar _isar;

  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      FeedModelSchema,
      FeedItemModelSchema,
      ContentModelSchema,
      FeedUpdateRecordModelSchema,
      FeedGroupModelSchema,
      SyncTimestampModelSchema,
    ], directory: directory.path);
  }

  // delete data which create time is days ago
  Future<void> deleteHistoryData(int days) async {
    var now = DateTime.now();
    var deleteTime = now.subtract(Duration(days: days));
    await _isar.writeTxn(() async {
      await _isar.feedItemModels
          .filter()
          .createTimeLessThan(deleteTime)
          .deleteAll();
      await _isar.contentModels
          .filter()
          .createTimeLessThan(deleteTime)
          .deleteAll();
    });
  }

  // delete data which is deleted and synced
  Future<void> deleteDeletedData() async {
    await _isar.writeTxn(() async {
      await _isar.feedItemModels
          .filter()
          .isDeletedEqualTo(true)
          .isSyncedEqualTo(true)
          .deleteAll();
      await _isar.contentModels.filter().isDeletedEqualTo(true).deleteAll();
      await _isar.feedGroupModels
          .filter()
          .isDeletedEqualTo(true)
          .isSyncedEqualTo(true)
          .deleteAll();
      await _isar.feedModels
          .filter()
          .isDeletedEqualTo(true)
          .isSyncedEqualTo(true)
          .deleteAll();
    });
  }

  // FeedGroup
  // insert Feed Groups
  Future<void> insertFeedGroups(List<FeedGroupModel> groups) async {
    await _isar.writeTxn(() async {
      await _isar.feedGroupModels.putAllByName(groups);
    });
  }

  // insert Feed Group
  Future<void> insertFeedGroup(FeedGroupModel group) async {
    await _isar.writeTxn(() async {
      return await _isar.feedGroupModels.putByName(group);
    });
  }

  // delete feed group
  Future<void> deleteFeedGroup(FeedGroupModel group) async {
    await _isar.writeTxn(() async {
      group.isDeleted = true;
      group.isSynced = false;
      group.updateTime = DateTime.now();
      await _isar.feedGroupModels.putByName(group);
    });
  }

  // update feed group
  Future<void> updateFeedGroup(
      FeedGroupModel newGroup, FeedGroupModel oldGroup) async {
    newGroup.isSynced = false;
    newGroup.updateTime = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.feedGroupModels.putByName(newGroup);
    });
    // update feed group name in feed
    await updateFeedGroupInFeed(oldGroup, newGroup);
  }

  // Feed!

  // insert Feed
  Future<int> insertFeed(FeedModel feed) async {
    var id = await _isar.writeTxn(() async {
      return await _isar.feedModels.putByUrl(feed);
    });
    return id;
  }

  // update group in feed
  Future<void> updateFeedGroupInFeed(
      FeedGroupModel oldGroup, FeedGroupModel newGroup) async {
    // read all feed by old group name
    List<FeedModel> feeds = await getFeedsByGroupName(oldGroup.name);
    // update feed group name
    for (var feed in feeds) {
      feed.groupName = newGroup.name;
      feed.isSynced = false;
      feed.updateTime = DateTime.now();
    }
    await _isar.writeTxn(() async {
      await _isar.feedModels.putAllByUrl(feeds);
    });
  }

  // insert Feed list
  Future<void> insertFeeds(List<FeedModel> feeds) async {
    await _isar.writeTxn(() async {
      await _isar.feedModels.putAllByUrl(feeds);
    });
  }

  // update Feed
  Future<void> updateFeed(FeedModel feed) async {
    feed.isSynced = false;
    feed.updateTime = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.feedModels.putByUrl(feed);
    });
  }

  // delete feed
  Future<void> deleteFeed(FeedModel feed) async {
    await _isar.writeTxn(() async {
      feed.isDeleted = true;
      feed.isSynced = false;
      feed.updateTime = DateTime.now();
      await _isar.feedModels.putByUrl(feed);
    });
    // delete all feed items
    await deleteAllFeedItemByFeed(feed);
    // delete all feed content
    await deleteAllFeedContentByFeed(feed);
    // delete all feed update record
    await deleteAllFeedUpdateRecordByFeed(feed);
  }

  // query all feed
  Future<List<FeedModel>> getAllFeeds() async {
    return await _isar.feedModels.filter().isDeletedEqualTo(false).findAll();
  }

  // get feeds last update record by feed id
  Future<List<FeedUpdateRecordModel?>> getFeedLastUpdateRecord(
      List<FeedModel> feeds) async {
    List<String> feedUrls = feeds.map((e) => e.url).toList();

    List<FeedUpdateRecordModel?> records =
        await _isar.feedUpdateRecordModels.getAllByFeedUrl(feedUrls);
    // if record is delete, replace with null
    records = records.map((e) {
      if (e == null || e.isDeleted == true) {
        return null;
      }
      return e;
    }).toList();
    return records;
  }

  // query feed by urls
  Future<List<FeedModel?>> getFeedsByUrlsIncludeDelete(
      List<FeedItemModel> feedModel) async {
    List<String> urls = feedModel.map((e) => e.feedUrl).toList();
    return await _isar.feedModels.getAllByUrl(urls);
  }

  // query feed by group name
  Future<List<FeedModel>> getFeedsByGroupName(String groupName) async {
    return await _isar.feedModels
        .filter()
        .groupNameEqualTo(groupName)
        .isDeletedEqualTo(false)
        .findAll();
  }

  // get feed by url
  Future<FeedModel?> getFeedByUrl(String url) async {
    FeedModel? feed = await _isar.feedModels.getByUrl(url);
    if (feed == null || feed.isDeleted == true) {
      return null;
    }
    return feed;
  }

  // FeedItem

  // insert FeedItems
  Future<void> insertFeedItems(
      List<FeedItemModel> items, FeedUpdateRecordModel record) async {
    await _isar.writeTxn(() async {
      await _isar.feedItemModels.putAllByMd5String(items);
      await _isar.feedUpdateRecordModels.putByFeedUrl(record);
    });
  }

  // input FeedItem list, check how many not in db, return count
  Future<List<FeedItemModel?>> checkFeedItemsInDb(
      List<FeedItemModel> items) async {
    List<String> md5Strings = items.map((e) => e.md5String).toList();
    return await _isar.feedItemModels.getAllByMd5String(md5Strings);
  }

  // input Feed list, check if feed in db
  Future<List<FeedModel?>> checkFeedsInDb(List<FeedModel> feeds) async {
    List<String> urls = feeds.map((e) => e.url).toList();
    return await _isar.feedModels.getAllByUrl(urls);
  }

  // get all feed items that contentDownloaded is null (not try downloaded)
  Future<List<FeedItemModel>> getFeedItemsNeedDownload() async {
    return _isar.feedItemModels
        .filter()
        .contentIsDownloadedIsNull()
        .isDeletedEqualTo(false)
        .findAll();
  }

  // set FeedItems read
  Future<void> setFeedItemRead(FeedItemModel item) async {
    item.isSeen = true;
    await _isar.writeTxn(() async {
      await _isar.feedItemModels.putByMd5String(item);
    });
  }

  // check if feeditem table is empty
  Future<int> feedItemTableSize() async {
    return await _isar.feedItemModels.count();
  }

  // update FeedItem
  Future<void> updateFeedItemNeedSync(FeedItemModel item) async {
    item.isSynced = false;
    item.updateTime = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.feedItemModels.putByMd5String(item);
    });
  }

  Future<void> updateFeedItemNotSync(FeedItemModel item) async {
    await _isar.writeTxn(() async {
      await _isar.feedItemModels.putByMd5String(item);
    });
  }

  // delete all feeditem by feed
  Future<void> deleteAllFeedItemByFeed(FeedModel feed) async {
    await _isar.writeTxn(() async {
      List<FeedItemModel> feedItems = await _isar.feedItemModels
          .filter()
          .feedUrlEqualTo(feed.url)
          .findAll();
      for (var item in feedItems) {
        item.isDeleted = true;
        item.isSynced = false;
        item.updateTime = DateTime.now();
      }
      await _isar.feedItemModels.putAllByMd5String(feedItems);
    });
  }

  // update FeedItems
  Future<void> updateFeedItems(List<FeedItemModel> items) async {
    for (var item in items) {
      item.isSynced = false;
      item.updateTime = DateTime.now();
    }
    await _isar.writeTxn(() async {
      await _isar.feedItemModels.putAllByMd5String(items);
    });
  }

  // save Feed and FeedItems
  Future<void> insertFeedAndItems(FeedModel feed, List<FeedItemModel> items,
      FeedUpdateRecordModel feedUpdateRecordModel) async {
    await _isar.writeTxn(() async {
      await _isar.feedModels.putByUrl(feed);
      await _isar.feedItemModels.putAllByMd5String(items);
      await _isar.feedUpdateRecordModels.putByFeedUrl(feedUpdateRecordModel);
    });
  }

  // query all FeedItem
  Future<List<FeedItemModel>> getAllFeedItems() async {
    return await _isar.feedItemModels
        .filter()
        .isDeletedEqualTo(false)
        .findAll();
  }

  // query all explore feeditems
  Future<List<FeedItemModel>> getAllExploreFeedItems() async {
    return await _isar.feedItemModels
        .filter()
        .isFocusEqualTo(false)
        .isDeletedEqualTo(false)
        .findAll();
  }

  // query all focus feeditems
  Future<List<FeedItemModel>> getAllFocusFeedItems() async {
    return await _isar.feedItemModels
        .filter()
        .isFocusEqualTo(true)
        .isDeletedEqualTo(false)
        .findAll();
  }

  // query focus FeedItem by page
  Future<List<FeedItemModel>> getFocusFeedItemsByPage(int page,
      {String? feedUrl}) async {
    var filter = _isar.feedItemModels
        .filter()
        .isFocusEqualTo(true)
        .isDeletedEqualTo(false);
    if (feedUrl != null) {
      filter = filter.feedUrlEqualTo(feedUrl);
    }
    return await filter
        .sortByFocusTimeDesc()
        .offset(page * Constants.pageSizeMobile)
        .limit(Constants.pageSizeMobile)
        .findAll();
  }

  Future<List<FeedItemModel>> getExploreFeedItemsByPage(int page,
      {String? feedUrl}) async {
    var filter = _isar.feedItemModels
        .filter()
        .isFocusEqualTo(false)
        .isDeletedEqualTo(false);
    if (feedUrl != null) {
      filter = filter.feedUrlEqualTo(feedUrl);
    }
    return await filter
        .sortByPublishTimeDesc()
        .offset(page * Constants.pageSizeMobile)
        .limit(Constants.pageSizeMobile)
        .findAll();
  }

  Future<List<FeedItemModel>> getMarkFeedItemsByPage(
    int page,
  ) async {
    return await _isar.feedItemModels
        .filter()
        .isMarkedEqualTo(true)
        .isDeletedEqualTo(false)
        .sortByUpdateTimeDesc()
        .offset(page * Constants.pageSizeMobile)
        .limit(Constants.pageSizeMobile)
        .findAll();
  }

  // Content
  // insert content
  Future<void> insertContent(ContentModel content) async {
    await _isar.writeTxn(() async {
      await _isar.contentModels.putByUri(content);
    });
  }

  // delete all feed content by feed
  Future<void> deleteAllFeedContentByFeed(FeedModel feed) async {
    await _isar.writeTxn(() async {
      await _isar.contentModels.filter().feedUrlEqualTo(feed.url).deleteAll();
    });
  }

  // get content by feeditem id
  Future<ContentModel?> getContentByFeedItemMd5(String md5String) async {
    var content = await _isar.contentModels
        .filter()
        .feedItemMd5StringEqualTo(md5String)
        .findFirst();
    return content;
  }

  // Group
  // query all group
  Future<List<FeedGroupModel>> getAllGroups() async {
    return await _isar.feedGroupModels
        .filter()
        .isDeletedEqualTo(false)
        .findAll();
  }

  // insert group
  Future<void> insertGroup(FeedGroupModel group) async {
    await _isar.writeTxn(() async {
      await _isar.feedGroupModels.putByName(group);
    });
  }

  // find group
  Future<FeedGroupModel?> findGroup(String name) async {
    return await _isar.feedGroupModels.getByName(name);
  }

  // save all content from sync pull
  Future<void> pullSyncSave(
      List<FeedModel> feeds,
      List<FeedItemModel> feedItems,
      List<FeedGroupModel> feedGroups,
      List<FeedUpdateRecordModel> feedUpdateRecords,
      List<SyncTimestampModel> syncTimestampModels) async {
    await _isar.writeTxn(() async {
      if (feeds.isNotEmpty) {
        await _isar.feedModels.putAllByUrl(feeds);
      }
      if (feedItems.isNotEmpty) {
        await _isar.feedItemModels.putAllByMd5String(feedItems);
      }
      if (feedGroups.isNotEmpty) {
        await _isar.feedGroupModels.putAllByName(feedGroups);
      }
      if (feedUpdateRecords.isNotEmpty) {
        await _isar.feedUpdateRecordModels.putAllByFeedUrl(feedUpdateRecords);
      }
      if (syncTimestampModels.isNotEmpty) {
        await _isar.syncTimestampModels.putAllByModelName(syncTimestampModels);
      }
    });
  }

  Future<void> pushSyncSave(
    List<FeedModel> feeds,
    List<FeedItemModel> feedItems,
    List<FeedGroupModel> feedGroups,
    List<FeedUpdateRecordModel> feedUpdateRecords,
  ) async {
    await _isar.writeTxn(() async {
      if (feeds.isNotEmpty) {
        await _isar.feedModels.putAllByUrl(feeds);
      }
      if (feedItems.isNotEmpty) {
        await _isar.feedItemModels.putAllByMd5String(feedItems);
      }
      if (feedGroups.isNotEmpty) {
        await _isar.feedGroupModels.putAllByName(feedGroups);
      }
      if (feedUpdateRecords.isNotEmpty) {
        await _isar.feedUpdateRecordModels.putAllByFeedUrl(feedUpdateRecords);
      }
    });
  }

  // get SyncTimestampModel of models
  Future<List<SyncTimestampModel?>> getSyncTimestampModel(
      List<ModelName> models) async {
    return await _isar.syncTimestampModels.getAllByModelName(models);
  }

  // get Feed not synced
  Future<List<FeedModel>> getFeedsNotSynced() async {
    return await _isar.feedModels.filter().isSyncedEqualTo(false).findAll();
  }

  // get FeedGroup not synced
  Future<List<FeedGroupModel>> getFeedGroupsNotSynced() async {
    return await _isar.feedGroupModels
        .filter()
        .isSyncedEqualTo(false)
        .findAll();
  }

  // get FeedItem not synced
  Future<List<FeedItemModel>> getFeedItemsNotSynced() async {
    return await _isar.feedItemModels.filter().isSyncedEqualTo(false).findAll();
  }

  // get FeedUpdateRecord not synced
  Future<List<FeedUpdateRecordModel>> getFeedUpdateRecordsNotSynced() async {
    return await _isar.feedUpdateRecordModels
        .filter()
        .isSyncedEqualTo(false)
        .findAll();
  }

  // delete feedupdate record
  Future<void> deleteAllFeedUpdateRecordByFeed(FeedModel feed) async {
    // find all feedupdate record by feed and set isDeleted to true
    await _isar.writeTxn(() async {
      FeedUpdateRecordModel? record =
          await _isar.feedUpdateRecordModels.getByFeedUrl(feed.url);
      if (record != null) {
        record.isDeleted = true;
        record.isSynced = false;
        record.updateTime = DateTime.now();
        await _isar.feedUpdateRecordModels.putByFeedUrl(record);
      }
    });
  }
}
