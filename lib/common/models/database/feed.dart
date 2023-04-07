import 'package:feed_inbox_app/common/index.dart';
import 'package:webfeed/webfeed.dart';
import 'package:isar/isar.dart';

part 'feed.g.dart';

@collection
class Feed {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String url;

  String? name;
  String? customName;
  String? logo;
  String? customLogo;
  String? description;
  String? customDescription;

  List<String>? tags;
  DateTime createTime;

  @Enumerated(EnumType.ordinal32)
  FeedType? type;

  final group = IsarLink<FeedGroup>();

  Feed(
    this.url, {
    this.type,
    this.name,
    this.customName,
    this.logo,
    this.description,
    this.tags,
    this.customDescription,
    this.customLogo,
  }) : createTime = DateTime.now();

  // set group
  setGroup(FeedGroup group) {
    this.group.value = group;
  }

  completeByRssFeed(RssFeed rssFeed) {
    name = rssFeed.title;
    logo = rssFeed.image?.url;
    description = rssFeed.description;
    type = FeedType.Rss;
  }

  completeByAtomFeed(AtomFeed atomFeed) {
    name = atomFeed.title;
    logo = atomFeed.logo;
    description = atomFeed.subtitle;
    type = FeedType.Atom;
  }

  factory Feed.fromRssFeed(RssFeed feed, String url, FeedType type) {
    return Feed(
      url,
      type: type,
      name: feed.title,
      logo: feed.image?.url,
      description: feed.description,
    );
  }

  factory Feed.fromAtomFeed(AtomFeed feed, String url, FeedType type) {
    return Feed(
      url,
      type: type,
      name: feed.title,
      logo: feed.logo,
      description: feed.subtitle,
    );
  }
}
