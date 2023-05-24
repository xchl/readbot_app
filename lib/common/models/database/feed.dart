import 'package:readbot/common/index.dart';
import 'package:isar/isar.dart';
import 'package:webfeed/webfeed.dart' as webfeed;

part 'feed.g.dart';

enum FeedType {
  rss,
  atom,
  unknown,
}

@collection
class FeedModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String url;

  String? name;
  String? customName;
  String? logo;
  String? customLogo;
  String? description;
  String? customDescription;

  String? groupName;

  List<String>? tags;
  DateTime createTime;

  bool isSynced;

  bool isDeleted = false;

  @Enumerated(EnumType.ordinal32)
  FeedType? type;

  @Index()
  DateTime updateTime;

  String get title => customName ?? name ?? "No Name";

  FeedModel(
    this.url, {
    this.type,
    this.name,
    this.customName,
    this.logo,
    this.description,
    this.tags = const [],
    this.customDescription,
    this.customLogo,
    required this.updateTime,
    required this.createTime,
    required this.isSynced,
  });

  completeByRssFeed(webfeed.RssFeed rssFeed) {
    name = rssFeed.title;
    logo = rssFeed.image?.url;
    description = rssFeed.description;
    type = convertTypeWebFeedToFeedModel(webfeed.FeedType.Rss);
  }

  completeByAtomFeed(webfeed.AtomFeed atomFeed) {
    name = atomFeed.title;
    logo = atomFeed.logo;
    description = atomFeed.subtitle;
    type = convertTypeWebFeedToFeedModel(webfeed.FeedType.Atom);
  }

  factory FeedModel.fromRssFeed(
      webfeed.RssFeed feed, String url, webfeed.FeedType type) {
    return FeedModel(
      url,
      type: convertTypeWebFeedToFeedModel(type),
      name: feed.title,
      logo: feed.image?.url,
      description: feed.description,
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
      isSynced: false,
    );
  }

  factory FeedModel.fromAtomFeed(
      webfeed.AtomFeed feed, String url, webfeed.FeedType type) {
    return FeedModel(url,
        type: convertTypeWebFeedToFeedModel(type),
        name: feed.title,
        logo: feed.logo,
        description: feed.subtitle,
        createTime: DateTime.now(),
        updateTime: DateTime.now(),
        isSynced: false);
  }
}

// function to convert Feed to FeedModel
FeedModel toFeedModel(Feed feed) {
  return FeedModel(feed.url,
      type: convertFeedTypeServerToModel(feed.feedType),
      name: feed.name,
      logo: feed.logo,
      description: feed.description,
      tags: feed.tags,
      customName: feed.customName,
      customLogo: feed.customLogo,
      customDescription: feed.customDescription,
      createTime: DateTime.fromMillisecondsSinceEpoch(feed.createTime.toInt()),
      updateTime: DateTime.fromMillisecondsSinceEpoch(feed.updateTime.toInt()),
      isSynced: true);
}

// convert FeedTypeServer to FeedType in FeedModel
FeedType? convertFeedTypeServerToModel(FeedTypeServer? type) {
  if (type == null) {
    return null;
  }
  switch (type) {
    case FeedTypeServer.rss:
      return FeedType.rss;
    case FeedTypeServer.atom:
      return FeedType.atom;
    default:
      return FeedType.unknown;
  }
}

// funtion to convert feed list to FeedModel list
List<FeedModel> toFeedModelList(List<Feed> feeds) {
  return feeds.map((e) => toFeedModel(e)).toList();
}

// function to convert FeedModel to Feed
Feed toFeed(FeedModel feed) {
  return Feed(
    url: feed.url,
    feedType: convertFeedTypeModelToServer(feed.type!),
    name: feed.name,
    logo: feed.logo,
    description: feed.description,
    tags: feed.tags,
    customName: feed.customName,
    customLogo: feed.customLogo,
    customDescription: feed.customDescription,
    isDeleted: feed.isDeleted,
    createTime: feed.createTime.millisecondsSinceEpoch,
    updateTime: feed.updateTime.millisecondsSinceEpoch,
  );
}

// convert FeedType in FeedModel to FeedTypeServer
FeedTypeServer convertFeedTypeModelToServer(FeedType type) {
  switch (type) {
    case FeedType.rss:
      return FeedTypeServer.rss;
    case FeedType.atom:
      return FeedTypeServer.atom;
    default:
      return FeedTypeServer.unknown;
  }
}

// function to convert FeedModel list to Feed list
List<Feed> toFeedList(List<FeedModel> feeds) {
  return feeds.map((e) => toFeed(e)).toList();
}

// convert webfeed feed type to feedtype in FeedModel
FeedType convertTypeWebFeedToFeedModel(webfeed.FeedType type) {
  switch (type) {
    case webfeed.FeedType.Rss:
      return FeedType.rss;
    case webfeed.FeedType.Atom:
      return FeedType.atom;
    default:
      return FeedType.unknown;
  }
}
