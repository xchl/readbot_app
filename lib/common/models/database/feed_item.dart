import 'package:feed_inbox_app/common/index.dart';
import 'package:isar/isar.dart';
import 'package:webfeed/webfeed.dart';

part 'feed_item.g.dart';

@collection
class FeedItem {
  Id id = Isar.autoIncrement;
  bool isFocus;
  bool isSeen;
  String? title;
  String? cover;
  String? link;
  DateTime? publishTime;
  String? authors;
  List<String>? tags;
  String? category;
  String? description;
  String? summaryAlgo;
  String? content;
  bool? contentHaveParsed;
  DateTime? createTime;
  String? md5;

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
    this.md5,
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
    return feedItem;
  }
}
