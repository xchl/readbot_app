import 'package:webfeed/webfeed.dart';
import 'package:isar/isar.dart';

part 'feed.g.dart';

@collection
class Feed {
  Id id = Isar.autoIncrement;
  String? url;
  String? name;
  String? logo;
  String? description;
  int? groupId;
  List<String>? tags;
  DateTime? createTime;

  Feed(
    this.url, {
    this.name,
    this.logo,
    this.description,
    this.groupId,
    this.tags,
    this.createTime,
  });

  factory Feed.fromRssFeed(RssFeed feed, String url) {
    return Feed(
      url,
      name: feed.title,
      logo: feed.image?.url,
      description: feed.description,
      createTime: DateTime.now(),
    );
  }

  factory Feed.fromAtomFeed(AtomFeed feed, String url) {
    return Feed(
      url,
      name: feed.title,
      logo: feed.logo,
      description: feed.subtitle,
      createTime: DateTime.now(),
    );
  }

  bool isValid() {
    return url != null && name != null;
  }
}
