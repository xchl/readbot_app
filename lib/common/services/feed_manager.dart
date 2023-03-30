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

  // insert Feed
  Future<int> addFeed(Feed feed) async {
    var id = await _isar.writeTxn(() async {
      return await _isar.feeds.put(feed);
    });
    return id;
  }

  // insert Feed list
  Future<void> addFeeds(List<Feed> feeds) async {
    await _isar.writeTxn(() async {
      await _isar.feeds.putAll(feeds);
    });
  }

  // insert FeedItem
  Future<void> addFeedItem(FeedItem item) async {
    await _isar.writeTxn(() async {
      await _isar.feedItems.put(item);
    });
  }

  // insert FeedItem list
  Future<void> addFeedItems(List<FeedItem> items) async {
    await _isar.writeTxn(() async {
      await _isar.feedItems.putAll(items);
    });
  }

  // save Feed and FeedItems
  Future<void> saveFeedAndItems(Feed feed, List<FeedItem> items) async {
    await _isar.writeTxn(() async {
      await _isar.feeds.put(feed);
      await _isar.feedItems.putAll(items);
      for (var item in items) {
        await item.feed.save();
      }
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

  // query all FeedItem
  Future<List<FeedItem>> getAllFeedItems() async {
    return await _isar.feedItems.where().findAll();
  }

  // query FeedItem by page
  // TODO
  Future<List<FeedItem>> getFeedItemsByPage(int page) async {
    var feedItems = await _isar.feedItems
        .where()
        .offset(page * Constants.pageSizeMobile)
        .limit(Constants.pageSizeMobile)
        .findAll();
    return feedItems;
  }
}
