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
      FeedSchema,
      FeedItemSchema,
      ContentSchema,
      FeedUpdateRecordSchema,
      FeedGroupSchema
    ]);
  }

  // FeedGroup

  // insert Feed Groups
  Future<void> insertFeedGroups(List<FeedGroup> groups) async {
    await _isar.writeTxn(() async {
      await _isar.feedGroups.putAllByName(groups);
    });
  }

  // Feed!

  // insert Feed
  Future<int> insertFeed(Feed feed) async {
    var id = await _isar.writeTxn(() async {
      return await _isar.feeds.putByUrl(feed);
    });
    return id;
  }

  // insert Feed list
  Future<void> insertFeeds(List<Feed> feeds) async {
    await _isar.writeTxn(() async {
      await _isar.feeds.putAllByUrl(feeds);
    });
  }

  // update Feed
  Future<void> updateFeed(Feed feed) async {
    await _isar.writeTxn(() async {
      await _isar.feeds.putByUrl(feed);
    });
  }

  // query all feed
  Future<List<Feed>> getAllFeeds() async {
    return await _isar.feeds.where().findAll();
  }

  // get feeds last update record by feed id
  Future<List<FeedUpdateRecord?>> getFeedLastUpdateRecord(feedIds) async {
    return await _isar.feedUpdateRecords.getAllByFeedId(feedIds);
  }

  // query feed by ids
  Future<List<Feed?>> getFeeds(List<int> ids) async {
    return await _isar.feeds.getAll(ids);
  }

  // FeedItem

  // insert FeedItems
  Future<void> insertFeedItems(
      List<FeedItem> items, FeedUpdateRecord record) async {
    await _isar.writeTxn(() async {
      await _isar.feedItems.putAllByMd5String(items);
      for (var item in items) {
        await item.feed.save();
      }
      await _isar.feedUpdateRecords.putByFeedId(record);
    });
  }

  // update FeedItem
  Future<void> updateFeedItem(FeedItem item) async {
    await _isar.writeTxn(() async {
      await _isar.feedItems.putByMd5String(item);
    });
  }

  // update FeedItems
  Future<void> updateFeedItems(List<FeedItem> items) async {
    await _isar.writeTxn(() async {
      await _isar.feedItems.putAllByMd5String(items);
    });
  }

  // save Feed and FeedItems
  Future<void> insertFeedAndItems(Feed feed, List<FeedItem> items) async {
    await _isar.writeTxn(() async {
      await _isar.feeds.putByUrl(feed);
      await _isar.feedItems.putAllByMd5String(items);
      for (var item in items) {
        await item.feed.save();
      }
    });
  }

  // query all FeedItem
  Future<List<FeedItem>> getAllFeedItems() async {
    return await _isar.feedItems.where().findAll();
  }

  // query all explore feeditems
  Future<List<FeedItem>> getAllExploreFeedItems() async {
    return await _isar.feedItems.filter().isFocusEqualTo(false).findAll();
  }

  // query all focus feeditems
  Future<List<FeedItem>> getAllFocusFeedItems() async {
    return await _isar.feedItems.filter().isFocusEqualTo(true).findAll();
  }

  // query focus FeedItem by page
  Future<List<FeedItem>> getFocusFeedItemsByPage(int page) async {
    var feedItems = await _isar.feedItems
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
  Future<List<FeedItem>> getExploreFeedItemsByFeedId(int feedId) async {
    var feedItems = await _isar.feedItems
        .filter()
        .feed(
          (q) => q.idEqualTo(feedId),
        )
        .isFocusEqualTo(false)
        .sortByPublishTimeDesc()
        .findAll();
    return feedItems;
  }

  // query explore FeedItem by page
  // TODO
  Future<List<FeedItem>> getExploreFeedItemsByPage(int page) async {
    var feedItems = await _isar.feedItems
        .filter()
        .isFocusEqualTo(false)
        .sortByPublishTimeDesc()
        .offset(page * Constants.pageSizeMobile)
        .limit(Constants.pageSizeMobile)
        .findAll();
    return feedItems;
  }

  // Content
  // insert content
  Future<void> insertContent(Content content) async {
    await _isar.writeTxn(() async {
      await _isar.contents.putByUri(content);
    });
  }

  // Group
  // query all group
  Future<List<FeedGroup>> getAllGroups() async {
    return await _isar.feedGroups.where().findAll();
  }

  // insert group
  Future<void> insertGroup(FeedGroup group) async {
    await _isar.writeTxn(() async {
      await _isar.feedGroups.putByName(group);
    });
  }
}
