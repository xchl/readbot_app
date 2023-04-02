import 'dart:convert';

import 'package:feed_inbox_app/common/index.dart';
import 'package:isar/isar.dart';
import 'package:webfeed/webfeed.dart';
import 'package:crypto/crypto.dart';

part 'feed_item.g.dart';

@collection
class FeedItem {
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
  String? content;
  bool? contentHaveParsed;
  DateTime? createTime;

  @Index(unique: true, replace: true)
  String? md5String;

  final feed = IsarLink<Feed>();

  FeedItem(
    this.createTime, {
    this.isFocus = false,
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
    this.content,
    this.contentHaveParsed = false,
    this.md5String,
  });

  factory FeedItem.fromRssItem(RssItem item, Feed feed) {
    var feedItem = FeedItem(
      DateTime.now(),
      isFocus: false,
      isSeen: false,
      title: item.title,
      link: item.link,
      publishTime: item.pubDate,
      authors: item.author,
      description: item.description,
    );
    String idString = (feedItem.title == null ? "" : feedItem.title!) +
        (feedItem.link == null ? "" : feedItem.link!);
    feedItem.md5String = md5.convert(utf8.encode(idString)).toString();
    feedItem.feed.value = feed;
    return feedItem;
  }

  factory FeedItem.fromAtomItem(AtomItem item, Feed feed) {
    var feedItem = FeedItem(
      DateTime.now(),
      isFocus: false,
      isSeen: false,
      title: item.title,
      link: item.links?.first.href,
      publishTime: item.updated,
      authors: item.authors?.map((e) => e.name).join(', '),
      description: item.summary,
    );
    feedItem.feed.value = feed;
    String idString = (feedItem.title == null ? "" : feedItem.title!) +
        (feedItem.link == null ? "" : feedItem.link!);
    feedItem.md5String = md5.convert(utf8.encode(idString)).toString();
    return feedItem;
  }
}
