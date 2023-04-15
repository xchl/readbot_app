import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/models/database/feed_update_record.dart';
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
      FeedGroupModelSchema
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
  Future<List<FeedUpdateRecordModel?>> getFeedLastUpdateRecord(feedIds) async {
    return await _isar.feedUpdateRecordModels.getAllByFeedId(feedIds);
  }

  // query feed by ids
  Future<List<FeedModel?>> getFeeds(List<int> ids) async {
    return await _isar.feedModels.getAll(ids);
  }

  // FeedItem

  // insert FeedItems
  Future<void> insertFeedItems(
      List<FeedItemModel> items, FeedUpdateRecordModel record) async {
    await _isar.writeTxn(() async {
      await _isar.feedItemModels.putAllByMd5String(items);
      await _isar.feedUpdateRecordModels.putByFeedId(record);
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
  Future<void> insertFeedAndItems(
      FeedModel feed, List<FeedItemModel> items) async {
    await _isar.writeTxn(() async {
      await _isar.feedModels.putByUrl(feed);
      await _isar.feedItemModels.putAllByMd5String(items);
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
  Future<List<FeedItemModel>> getFocusFeedItemsByPage(int page) async {
    var feedItems = await _isar.feedItemModels
        .filter()
        .isFocusEqualTo(true)
        .sortByPublishTimeDesc()
        .offset(page * Constants.pageSizeMobile)
        .limit(Constants.pageSizeMobile)
        .findAll();
    return feedItems;
  }

  // query feeditems by feed id
  // TODO  add page
  Future<List<FeedItemModel>> getExploreFeedItemsByFeedId(int feedId) async {
    var feedItems = await _isar.feedItemModels
        .filter()
        .feedIdEqualTo(feedId)
        .isFocusEqualTo(false)
        .sortByPublishTimeDesc()
        .findAll();
    return feedItems;
  }

  Future<List<FeedItemModel>> getExploreFeedItemsByPage(int page,
      {int? feedId}) async {
    var filter = _isar.feedItemModels.filter().isFocusEqualTo(false);
    if (feedId != null) {
      filter = filter.feedIdEqualTo(feedId);
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
  Future<ContentModel?> getContentByFeedItemId(int feedItemId) async {
    var content = await _isar.contentModels
        .filter()
        .feedItemIdEqualTo(feedItemId)
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
  Future<void> syncSave(
      List<FeedModel> feeds,
      List<FeedItemModel> feedItems,
      List<FeedGroupModel> feedGroups,
      List<FeedUpdateRecordModel> feedUpdateRecords) async {
    await _isar.writeTxn(() async {
      await _isar.feedModels.putAllByUrl(feeds);
      await _isar.feedItemModels.putAllByMd5String(feedItems);
      await _isar.feedGroupModels.putAllByName(feedGroups);
      await _isar.feedUpdateRecordModels.putAllByFeedId(feedUpdateRecords);
    });
  }
}
