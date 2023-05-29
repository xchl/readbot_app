import 'dart:convert';

import 'package:readbot/common/index.dart';
import 'package:isar/isar.dart';
import 'package:webfeed/webfeed.dart';
import 'package:crypto/crypto.dart';

part 'feed_item.g.dart';

@collection
class FeedItemModel {
  Id id = Isar.autoIncrement;
  bool isFocus;
  bool isSeen;

  String title;

  String? cover;
  String? link;

  @Index()
  DateTime? publishTime;

  String? authors;
  List<String>? tags;
  String? category;
  String? description;
  String? summaryAlgo;
  DateTime createTime;

  DateTime? focusTime;

  // null -> not downloaded
  // true -> downloaded
  // false -> download but parse failed
  bool? contentIsDownloaded;

  bool isSynced;

  // md5(title + link)
  @Index(unique: true, replace: true)
  String md5String;

  // use feedUrl instead of feedId to avoid different feedId in different device
  @Index()
  String feedUrl;

  bool isDeleted;

  @Index()
  DateTime updateTime = DateTime.now();

  FeedItemModel(this.feedUrl,
      {this.isFocus = false,
      this.isSeen = false,
      required this.title,
      this.cover,
      this.link,
      this.publishTime,
      this.authors,
      this.tags,
      this.focusTime,
      this.category,
      this.description,
      this.summaryAlgo,
      this.isDeleted = false,
      required this.updateTime,
      required this.createTime,
      required this.isSynced})
      : md5String = md5.convert(utf8.encode(title + (link ?? ""))).toString();

  factory FeedItemModel.fromRssItem(RssItem item, FeedModel feed) {
    var feedItem = FeedItemModel(feed.url,
        isFocus: false,
        isSeen: false,
        title: item.title ?? '',
        link: item.link,
        publishTime: item.pubDate,
        authors: item.author,
        description: item.description,
        createTime: DateTime.now(),
        updateTime: DateTime.now(),
        isSynced: false);
    return feedItem;
  }

  factory FeedItemModel.fromAtomItem(AtomItem item, FeedModel feed) {
    var feedItem = FeedItemModel(feed.url,
        isFocus: false,
        isSeen: false,
        title: item.title ?? '',
        link: item.links?.first.href,
        publishTime: item.updated,
        authors: item.authors?.map((e) => e.name).join(', '),
        description: item.summary,
        createTime: DateTime.now(),
        updateTime: DateTime.now(),
        isSynced: false);
    return feedItem;
  }
}

// function to convert FeedItemModel to FeedItem
FeedItem toFeedItem(FeedItemModel model) {
  return FeedItem(
      isFocus: model.isFocus,
      isSeen: model.isSeen,
      title: model.title,
      cover: model.cover,
      link: model.link,
      // Datetime to timestamp
      publishTime: model.publishTime?.millisecondsSinceEpoch,
      authors: model.authors,
      tags: model.tags,
      category: model.category,
      description: model.description,
      summaryAlgo: model.summaryAlgo,
      createTime: model.createTime.millisecondsSinceEpoch,
      md5String: model.md5String,
      feedUrl: model.feedUrl,
      isDeleted: model.isDeleted,
      updateTime: model.updateTime.millisecondsSinceEpoch,
      focusTime: model.focusTime?.millisecondsSinceEpoch);
}

// function to convert FeedItemModel list to FeedItem list
List<FeedItem> toFeedItemList(List<FeedItemModel> models) {
  return models.map((model) => toFeedItem(model)).toList();
}

// function to convert FeedItem to FeedItemModel
FeedItemModel toFeedItemModel(FeedItem feedItem) {
  return FeedItemModel(
    feedItem.feedUrl,
    isFocus: feedItem.isFocus,
    isSeen: feedItem.isSeen,
    title: feedItem.title ?? '',
    cover: feedItem.cover,
    link: feedItem.link,
    // timestamp to Datetime
    publishTime: feedItem.publishTime == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(feedItem.publishTime!),
    authors: feedItem.authors,
    tags: feedItem.tags,
    category: feedItem.category,
    description: feedItem.description,
    summaryAlgo: feedItem.summaryAlgo,
    focusTime: feedItem.focusTime == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(feedItem.focusTime!),
    createTime: DateTime.fromMillisecondsSinceEpoch(feedItem.createTime),
    updateTime: DateTime.fromMillisecondsSinceEpoch(feedItem.updateTime),
    isSynced: true,
    isDeleted: feedItem.isDeleted,
  );
}

// function to convert FeedItem list to FeedItemModel list
List<FeedItemModel> toFeedItemModelList(List<FeedItem> feedItems) {
  return feedItems.map((feedItem) => toFeedItemModel(feedItem)).toList();
}
