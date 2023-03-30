import 'dart:convert';
import 'dart:math';

import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/pb/readbot_proto/index.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed/util/function.dart';
import 'package:webfeed/webfeed.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  var _feedList = <UserFeed>[];
  final _feedMap = <int, FeedProfile>{};
  var _explorePostList = <UserContent>[];
  var _focusPostList = <UserContent>[];
  var _seenPostList = <UserContent>[];
  var _archivePostList = <UserContent>[];
  final _contentMap = <int, Content>{}; // contentId -> content

  int _latestPostId = -1;
  int _latestFeedId = -1;

  int get feedLength => _feedList.length;

  List<UserFeed> get feedList => _feedList;
  Map<int, FeedProfile> get feedMap => _feedMap;

  List<UserContent> get explorePosts => _explorePostList;
  List<UserContent> get focusPosts => _focusPostList;
  List<UserContent> get seenPosts => _seenPostList;
  List<UserContent> get archivePosts => _archivePostList;
  Map<int, Content> get contentMap => _contentMap;

  UserFeed feed(int i) {
    return feedList[i];
  }

  Future<void> addFeed(FeedInfo feed) async {
    CreateFeedResponse res = await FeedApi.addExistSingle(feed);
    _feedList.add(res.userFeed);
  }

  List<FeedItem> _parseRssItem(List<RssItem>? items) {
    if (items == null) {
      return [];
    }
    return items.map((item) => FeedItem.fromRssItem(item)).toList();
  }

  // parse Atom item
  List<FeedItem> _parseAtomItem(List<AtomItem>? items) {
    if (items == null) {
      return [];
    }
    return items.map((item) => FeedItem.fromAtomItem(item)).toList();
  }

  Tuple2<Feed, List<FeedItem>> _parseFeed(String xml, String url) {
    var feedType = getFeedType(xml);
    if (feedType == FeedType.Rss) {
      var feedRaw = RssFeed.parse(xml);
      var feed = Feed.fromRssFeed(feedRaw, url);
      var feedItems = _parseRssItem(feedRaw.items);
      return Tuple2(feed, feedItems);
    } else if (feedType == FeedType.Atom) {
      var feedRaw = AtomFeed.parse(xml);
      var feed = Feed.fromAtomFeed(feedRaw, url);
      var feedItems = _parseAtomItem(feedRaw.items);
      return Tuple2(feed, feedItems);
    }
    // TODO Error handle
    return Tuple2(Feed(url), []);
  }

  Future<void> addFeedFromUrl(String url) async {
    String xml = await FeedApi.fetchFeedFromUrl(url);
    var result = _parseFeed(xml, url);
    LogService.to.i(result.item1);
    LogService.to.i(result.item2);
  }

  List<UserContent> _decodePost(String json) {
    return json != ""
        ? jsonDecode(json).map((item) {
            return UserContent.fromJson(item);
          }).toList()
        : [];
  }

  @override
  void onInit() async {
    super.onInit();
    // 读 Post
    var stringExplorePost = Storage().getString(Constants.storageExplorePost);
    var stringFocusPost = Storage().getString(Constants.storageFocusPost);
    var stringSeenPost = Storage().getString(Constants.storageSeenPost);
    var stringArchivePost = Storage().getString(Constants.storageArchivePost);

    _explorePostList = _decodePost(stringExplorePost);
    _focusPostList = _decodePost(stringFocusPost);
    _seenPostList = _decodePost(stringSeenPost);
    _archivePostList = _decodePost(stringArchivePost);

    var lastestPostIdString =
        Storage().getString(Constants.storageLatestPostId);
    _latestPostId = lastestPostIdString != "" ? lastestPostIdString as int : -1;

    var lastestFeedIdString =
        Storage().getString(Constants.storageLatestFeedId);
    _latestFeedId = lastestFeedIdString != "" ? lastestFeedIdString as int : -1;
  }

  @override
  Future<void> onReady() async {
    // if (UserService.to.hasActiveAccessToken()) {
    //   await fetchFeedList();
    //   await fetchPostList();
    // }
  }

  void exploreToArchive(int index) {
    UserContent post = explorePosts.removeAt(index);
    archivePosts.add(post);
  }

  void exploreToFocus(int index) {
    UserContent post = explorePosts.removeAt(index);
    focusPosts.add(post);
  }

  void exploreToSeen(int index) {
    UserContent post = explorePosts.removeAt(index);
    seenPosts.add(post);
  }

  void focusToSeen(int index) {
    UserContent post = focusPosts.removeAt(index);
    seenPosts.add(post);
  }

  void focusToArchive(int index) {
    UserContent post = focusPosts.removeAt(index);
    archivePosts.add(post);
  }

  Future<void> fetchFeedList() async {
    var resp = await FeedApi.getFeedList(); //todo: add lastesd Feed id
    _feedList = resp.userFeeds;
    for (final feed in resp.feedProfiles) {
      _feedMap[feed.id] = feed;
    }
  }

  Future<void> fetchPostList() async {
    var resp = await FeedApi.getPostList(
        _latestFeedId, Constants.pageSizeMobile, true);
    for (final content in resp.contents) {
      _contentMap[content.id] = content;
    }
    for (final post in resp.userContents) {
      switch (post.stage) {
        case ReadStage.READ_STAGE_EXPLORE:
          _explorePostList.add(post);
          break;
        case ReadStage.READ_STAGE_FOCUS:
          _focusPostList.add(post);
          break;
        case ReadStage.READ_STAGE_SEEN:
          _seenPostList.add(post);
          break;
        case ReadStage.READ_STAGE_ARCHIVED:
          _archivePostList.add(post);
          break;
      }
      _latestPostId = max(_latestPostId, post.contentId);
    }
  }

  void _saveExplorePost() {
    Storage().setJson(Constants.storageExplorePost, _explorePostList);
  }

  void _saveFocusPost() {
    Storage().setJson(Constants.storageFocusPost, _focusPostList);
  }

  void _saveSeenPost() {
    Storage().setJson(Constants.storageSeenPost, _seenPostList);
  }

  void _saveArchivePost() {
    Storage().setJson(Constants.storageArchivePost, _archivePostList);
  }

  void _saveLatestPostId() {
    Storage()
        .setString(Constants.storageLatestPostId, _latestPostId.toString());
  }

  void _saveLatestFeedId() {
    Storage()
        .setString(Constants.storageLatestFeedId, _latestFeedId.toString());
  }

  Future<void> _saveAllData() async {
    _saveExplorePost();
    _saveFocusPost();
    _saveSeenPost();
    _saveArchivePost();
    _saveLatestFeedId();
    _saveLatestPostId();
  }

  @override
  void onClose() async {
    super.onClose();
    await _saveAllData();
  }
}
