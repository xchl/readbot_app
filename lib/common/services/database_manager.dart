import 'package:feed_inbox_app/common/index.dart';
import 'package:isar/isar.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  factory DatabaseManager() => _instance;
  DatabaseManager._internal();

  late final Isar _isar;

  Future<void> init() async {
    _isar = await Isar.open([
      FeedModelSchema,
      FeedItemModelSchema,
      ContentModelSchema,
      FeedUpdateRecordModelSchema,
      FeedGroupModelSchema,
      SyncTimestampModelSchema,
    ]);
  }

  // FeedGroup
  // insert Feed Groups
  Future<void> insertFeedGroups(List<FeedGroupModel> groups) async {
    await _isar.writeTxn(() async {
      await _isar.feedGroupModels.putAllByName(groups);
    });
  }

  // Feed!

  // insert Feed
  Future<int> insertFeed(FeedModel feed) async {
    var id = await _isar.writeTxn(() async {
      return await _isar.feedModels.putByUrl(feed);
    });
    return id;
  }

  // insert Feed list
  Future<void> insertFeeds(List<FeedModel> feeds) async {
    await _isar.writeTxn(() async {
      await _isar.feedModels.putAllByUrl(feeds);
    });
  }

  // update Feed
  Future<void> updateFeed(FeedModel feed) async {
    await _isar.writeTxn(() async {
      await _isar.feedModels.putByUrl(feed);
    });
  }

  // query all feed
  Future<List<FeedModel>> getAllFeeds() async {
    return await _isar.feedModels.where().findAll();
  }

  // get feeds last update record by feed id
  Future<List<FeedUpdateRecordModel?>> getFeedLastUpdateRecord(
      List<String> feedUrl) async {
    return await _isar.feedUpdateRecordModels.getAllByFeedUrl(feedUrl);
  }

  // query feed by urls
  Future<List<FeedModel?>> getFeedsByUrls(List<String> urls) async {
    return await _isar.feedModels.getAllByUrl(urls);
  }

  // get feed by url
  Future<FeedModel?> getFeedByUrl(String url) async {
    return await _isar.feedModels.getByUrl(url);
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

  // update FeedItem
  Future<void> updateFeedItem(FeedItemModel item) async {
    await _isar.writeTxn(() async {
      await _isar.feedItemModels.putByMd5String(item);
    });
  }

  // update FeedItems
  Future<void> updateFeedItems(List<FeedItemModel> items) async {
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
    return await _isar.feedItemModels.where().findAll();
  }

  // query all explore feeditems
  Future<List<FeedItemModel>> getAllExploreFeedItems() async {
    return await _isar.feedItemModels.filter().isFocusEqualTo(false).findAll();
  }

  // query all focus feeditems
  Future<List<FeedItemModel>> getAllFocusFeedItems() async {
    return await _isar.feedItemModels.filter().isFocusEqualTo(true).findAll();
  }

  // query focus FeedItem by page
  Future<List<FeedItemModel>> getFocusFeedItemsByPage(int page,
      {String? feedUrl}) async {
    var filter = _isar.feedItemModels.filter().isFocusEqualTo(true);
    if (feedUrl != null) {
      filter = filter.feedUrlEqualTo(feedUrl);
    }
    return await filter
        .sortByPublishTimeDesc()
        .offset(page * Constants.pageSizeMobile)
        .limit(Constants.pageSizeMobile)
        .findAll();
  }

  Future<List<FeedItemModel>> getExploreFeedItemsByPage(int page,
      {String? feedUrl}) async {
    var filter = _isar.feedItemModels.filter().isFocusEqualTo(false);
    if (feedUrl != null) {
      filter = filter.feedUrlEqualTo(feedUrl);
    }
    return await filter
        .sortByPublishTimeDesc()
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
    return await _isar.feedGroupModels.where().findAll();
  }

  // insert group
  Future<void> insertGroup(FeedGroupModel group) async {
    await _isar.writeTxn(() async {
      await _isar.feedGroupModels.putByName(group);
    });
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
}
