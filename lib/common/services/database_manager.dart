import 'package:feed_inbox_app/common/index.dart';
import 'package:isar/isar.dart';

class FeedManager {
  static final FeedManager _instance = FeedManager._internal();
  factory FeedManager() => _instance;
  FeedManager._internal();

  late final Isar _isar;

  Future<void> init() async {
    _isar = await Isar.open([FeedSchema, FeedItemSchema]);
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

  // query all feed
  Future<List<Feed>> getAllFeeds() async {
    return await _isar.feeds.where().findAll();
  }

  // query feed by ids
  Future<List<Feed?>> getFeeds(List<int> ids) async {
    return await _isar.feeds.getAll(ids);
  }

  // FeedItem

  // insert FeedItem
  Future<void> insertFeedItem(FeedItem item) async {
    await _isar.writeTxn(() async {
      await _isar.feedItems.putByMd5String(item);
      await item.feed.save();
    });
  }

  // insert FeedItems
  Future<void> insertFeedItems(List<FeedItem> items) async {
    await _isar.writeTxn(() async {
      await _isar.feedItems.putAllByMd5String(items);
      for (var item in items) {
        await item.feed.save();
      }
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

  // query focus FeedItem by page
  // TODO
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
}
