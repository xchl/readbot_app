import 'dart:convert';
import 'dart:math';

import 'package:feed_inbox_app/common/api/feed.dart';
import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/models/request/post_req.dart';
import 'package:get/get.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  var _feedList = <UserFeed>[];
  var _explorePostList = <UserPost>[];
  var _focusPostList = <UserPost>[];
  var _seenPostList = <UserPost>[];
  var _archivePostList = <UserPost>[];
  int _latestPostId = -1;
  int _latestFeedId = -1;

  int get feedLength => _feedList.length;

  List<UserFeed> get feedList => _feedList;

  List<UserPost> get explorePosts => _explorePostList;
  List<UserPost> get focusPosts => _focusPostList;
  List<UserPost> get seenPosts => _seenPostList;
  List<UserPost> get archivePosts => _archivePostList;

  UserFeed feed(int i) {
    return feedList[i];
  }

  Future<void> addFeed(UserFeed feed) async {
    UserFeed res = await FeedApi.addExistSingle(feed);
    _feedList.add(res);
  }

  List<UserPost> _decodePost(String json) {
    return json != ""
        ? jsonDecode(json).map((item) {
            return UserPost.fromJson(item);
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
    await fetchFeedList();
    await fetchPostList();
    // _saveAllData();
  }

  void exploreToArchive(int index) {
    UserPost post = explorePosts.removeAt(index);
    archivePosts.add(post);
  }

  void exploreToFocus(int index) {
    UserPost post = explorePosts.removeAt(index);
    focusPosts.add(post);
  }

  void exploreToSeen(int index) {
    UserPost post = explorePosts.removeAt(index);
    seenPosts.add(post);
  }

  void focusToSeen(int index) {
    UserPost post = focusPosts.removeAt(index);
    seenPosts.add(post);
  }

  void focusToArchive(int index) {
    UserPost post = focusPosts.removeAt(index);
    archivePosts.add(post);
  }

  Future<void> fetchFeedList() async {
    _feedList = await FeedApi.getFeedList(); //todo: add lastesd Feed id
  }

  Future<void> fetchPostList() async {
    List<UserPost> postList =
        await FeedApi.getPostList(PostReq(latestPostId: _latestPostId));
    for (final post in postList) {
      switch (post.stage) {
        case 1:
          _explorePostList.add(post);
          break;
        case 2:
          _focusPostList.add(post);
          break;
        case 3:
          _seenPostList.add(post);
          break;
        case 4:
          _archivePostList.add(post);
          break;
      }
      _latestPostId = max(_latestPostId, post.postId!);
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
