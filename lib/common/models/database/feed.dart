import 'package:feed_inbox_app/common/models/proto/model.pb.dart' as pb_model;
import 'package:fixnum/fixnum.dart';
import 'package:isar/isar.dart';
import 'package:webfeed/webfeed.dart' as webfeed;

part 'feed.g.dart';

enum FeedType { rss, atom, unknown }

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

  int? groupId;

  List<String>? tags;
  DateTime createTime;

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
    this.tags,
    this.customDescription,
    this.customLogo,
    required this.updateTime,
    required this.createTime,
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
    );
  }

  factory FeedModel.fromAtomFeed(
      webfeed.AtomFeed feed, String url, webfeed.FeedType type) {
    return FeedModel(
      url,
      type: convertTypeWebFeedToFeedModel(type),
      name: feed.title,
      logo: feed.logo,
      description: feed.subtitle,
      createTime: DateTime.now(),
      updateTime: DateTime.now(),
    );
  }
}

// function to convert Feed to FeedModel
FeedModel toFeedModel(pb_model.Feed feed) {
  return FeedModel(
    feed.url,
    type: convertTypeToFeedModel(feed.feedType),
    name: feed.name,
    logo: feed.logo,
    description: feed.description,
    tags: feed.tags,
    customName: feed.customName,
    customLogo: feed.customLogo,
    customDescription: feed.customDescription,
    createTime: DateTime.fromMillisecondsSinceEpoch(feed.createTime.toInt()),
    updateTime: DateTime.fromMillisecondsSinceEpoch(feed.updateTime.toInt()),
  );
}

// funtion to convert feed list to FeedModel list
List<FeedModel> toFeedModelList(List<pb_model.Feed> feeds) {
  return feeds.map((e) => toFeedModel(e)).toList();
}

// function to convert FeedModel to Feed
pb_model.Feed toFeed(FeedModel feed) {
  return pb_model.Feed(
    url: feed.url,
    feedType: convertTypeToPbFeed(feed.type),
    name: feed.name,
    logo: feed.logo,
    description: feed.description,
    tags: feed.tags,
    customName: feed.customName,
    customLogo: feed.customLogo,
    customDescription: feed.customDescription,
    createTime: Int64(feed.createTime.millisecondsSinceEpoch),
    updateTime: Int64(feed.updateTime.millisecondsSinceEpoch),
  );
}

// function to convert FeedModel list to Feed list
List<pb_model.Feed> toFeedList(List<FeedModel> feeds) {
  return feeds.map((e) => toFeed(e)).toList();
}

// convert feed type in FeedModel to FeedType in Feed
pb_model.FeedType convertTypeToPbFeed(FeedType? type) {
  switch (type) {
    case FeedType.rss:
      return pb_model.FeedType.FEED_TYPE_RSS;
    case FeedType.atom:
      return pb_model.FeedType.FEED_TYPE_ATOM;
    default:
      return pb_model.FeedType.FEED_TYPE_UNKNOWN;
  }
}

// convert feed type in to FeedType in FeedModel
FeedType convertTypeToFeedModel(pb_model.FeedType type) {
  switch (type) {
    case pb_model.FeedType.FEED_TYPE_RSS:
      return FeedType.rss;
    case pb_model.FeedType.FEED_TYPE_ATOM:
      return FeedType.atom;
    default:
      return FeedType.unknown;
  }
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
