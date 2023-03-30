import 'package:isar/isar.dart';
import 'package:webfeed/webfeed.dart';

@collection
class FeedItem {
  Id id = Isar.autoIncrement;
  bool? isFocus;
  bool? isSeen;
  String? title;
  String? cover;
  String? link;
  DateTime? publishTime;
  String? authors;
  List<String>? tags;
  String? category;
  String? description;
  String? summaryAlgo;
  DateTime? createTime;
  String? md5;

  FeedItem({
    this.isFocus,
    this.isSeen,
    this.title,
    this.cover,
    this.link,
    this.publishTime,
    this.authors,
    this.tags,
    this.category,
    this.description,
    this.summaryAlgo,
    this.createTime,
    this.md5,
  });

  factory FeedItem.fromRssItem(RssItem item) {
    return FeedItem(
      isFocus: false,
      isSeen: false,
      title: item.title,
      link: item.link,
      publishTime: item.pubDate,
      authors: item.author,
      description: item.description,
      createTime: DateTime.now(),
    );
  }

  factory FeedItem.fromAtomItem(AtomItem item) {
    return FeedItem(
      isFocus: false,
      isSeen: false,
      title: item.title,
      link: item.links?.first.href,
      publishTime: item.updated,
      authors: item.authors?.map((e) => e.name).join(', '),
      description: item.summary,
      createTime: DateTime.now(),
    );
  }
}
