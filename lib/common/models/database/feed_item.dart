import 'dart:convert';

import 'package:feed_inbox_app/common/index.dart';
import 'package:feed_inbox_app/common/models/proto/model.pb.dart' as pb_model;
import 'package:fixnum/fixnum.dart';
import 'package:isar/isar.dart';
import 'package:webfeed/webfeed.dart';
import 'package:crypto/crypto.dart';

part 'feed_item.g.dart';

@collection
class FeedItemModel {
  Id id = Isar.autoIncrement;
  bool isFocus;
  bool isSeen;

  String? title;

  String? cover;
  String? link;

  @Index()
  DateTime? publishTime;

  String? authors;
  List<String>? tags;
  String? category;
  String? description;
  String? summaryAlgo;
  DateTime? createTime;

  @Index(unique: true, replace: true)
  String? md5String;

  int feedId;

  @Index()
  DateTime updateTime = DateTime.now();

  FeedItemModel(this.feedId,
      {this.isFocus = false,
      this.isSeen = false,
      this.title,
      this.cover,
      this.link,
      this.publishTime,
      this.authors,
      this.tags,
      this.category,
      this.description,
      this.summaryAlgo,
      this.md5String,
      required this.updateTime,
      required this.createTime});

  factory FeedItemModel.fromRssItem(RssItem item, FeedModel feed) {
    var feedItem = FeedItemModel(
      feed.id,
      isFocus: false,
      isSeen: false,
      title: item.title,
      link: item.link,
      publishTime: item.pubDate,
      authors: item.author,
      description: item.description,
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
    );
    String idString = (feedItem.title == null ? "" : feedItem.title!) +
        (feedItem.link == null ? "" : feedItem.link!);
    feedItem.md5String = md5.convert(utf8.encode(idString)).toString();
    return feedItem;
  }

  factory FeedItemModel.fromAtomItem(AtomItem item, FeedModel feed) {
    var feedItem = FeedItemModel(
      feed.id,
      isFocus: false,
      isSeen: false,
      title: item.title,
      link: item.links?.first.href,
      publishTime: item.updated,
      authors: item.authors?.map((e) => e.name).join(', '),
      description: item.summary,
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
    );
    String idString = (feedItem.title == null ? "" : feedItem.title!) +
        (feedItem.link == null ? "" : feedItem.link!);
    feedItem.md5String = md5.convert(utf8.encode(idString)).toString();
    return feedItem;
  }
}

// function to convert FeedItemModel to FeedItem
pb_model.FeedItem toFeedItem(FeedItemModel model) {
  return pb_model.FeedItem(
      id: model.id,
      isFocus: model.isFocus,
      isSeen: model.isSeen,
      title: model.title,
      cover: model.cover,
      link: model.link,
      // Datetime to timestamp
      publishTime: model.publishTime == null
          ? null
          : Int64(model.publishTime!.millisecondsSinceEpoch),
      authors: model.authors,
      tags: model.tags,
      category: model.category,
      description: model.description,
      summaryAlgo: model.summaryAlgo,
      createTime: model.createTime == null
          ? null
          : Int64(model.createTime!.millisecondsSinceEpoch),
      md5String: model.md5String,
      feedId: model.feedId,
      updateTime: Int64(model.updateTime.millisecondsSinceEpoch));
}

// function to convert FeedItemModel list to FeedItem list
List<pb_model.FeedItem> toFeedItemList(List<FeedItemModel> models) {
  return models.map((model) => toFeedItem(model)).toList();
}

// function to convert FeedItem to FeedItemModel
FeedItemModel toFeedItemModel(pb_model.FeedItem feedItem) {
  return FeedItemModel(
    feedItem.feedId,
    isFocus: feedItem.isFocus,
    isSeen: feedItem.isSeen,
    title: feedItem.title,
    cover: feedItem.cover,
    link: feedItem.link,
    // timestamp to Datetime
    publishTime:
        DateTime.fromMillisecondsSinceEpoch(feedItem.publishTime.toInt()),
    authors: feedItem.authors,
    tags: feedItem.tags,
    category: feedItem.category,
    description: feedItem.description,
    summaryAlgo: feedItem.summaryAlgo,
    md5String: feedItem.md5String,
    createTime:
        DateTime.fromMillisecondsSinceEpoch(feedItem.createTime.toInt()),
    updateTime:
        DateTime.fromMillisecondsSinceEpoch(feedItem.updateTime.toInt()),
  );
}

// function to convert FeedItem list to FeedItemModel list
List<FeedItemModel> toFeedItemModelList(List<pb_model.FeedItem> feedItems) {
  return feedItems.map((feedItem) => toFeedItemModel(feedItem)).toList();
}
