import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:readbot/common/index.dart';
import 'package:readbot/pages/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart' hide Storage;
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed/util/function.dart';
import 'package:webfeed/webfeed.dart' as webfeed;
import 'package:readability/readability.dart';
import 'package:xml/xml.dart';

/// 用户服务
class FeedService extends GetxService {
  static FeedService get to => Get.find();

  List<FeedItemModel> _parseRssItem(
      FeedModel feed, List<webfeed.RssItem>? items) {
    return items != null
        ? items.map((item) => FeedItemModel.fromRssItem(item, feed)).toList()
        : [];
  }

  void keepDownload() async {
    // take all items that contentDownloaded is null
    var items = await DatabaseManager().getFeedItemsNeedDownload();
    downloadHtml(items);
  }

  void checkUpdate(List<FeedModel> feeds, List<FeedItemModel> feedItemList,
      List<FeedGroupModel> feedGroupList) async {
    if (feedItemList.isNotEmpty) {
      downloadHtml(feedItemList);
      int focusCount =
          feedItemList.where((item) => item.isFocus == true).toList().length;
      NoticeService.to.updateFocus(focusCount);
      NoticeService.to.updateExplore(feedItemList.length - focusCount);
    }
  }

  Future<void> globalPullFeed() async {
    try {
      SyncService.to.pullFromService();
      await SyncService.to.waitSyncQueueEmpty();
      await FeedService.to.fetchAllFeed();
      SyncService.to.pushToService();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // parse Atom item
  List<FeedItemModel> _parseAtomItem(
      FeedModel feed, List<webfeed.AtomItem>? items) {
    return items != null
        ? items.map((item) => FeedItemModel.fromAtomItem(item, feed)).toList()
        : [];
  }

  Tuple2<FeedModel, List<FeedItemModel>>? _parseFeed(String xml, String url) {
    try {
      var feedType = getFeedType(xml);
      if (feedType == webfeed.FeedType.Rss) {
        var feedRaw = webfeed.RssFeed.parse(xml);
        var feed = FeedModel.fromRssFeed(feedRaw, url, webfeed.FeedType.Rss);
        var feedItems = _parseRssItem(feed, feedRaw.items);
        return Tuple2(feed, feedItems);
      } else if (feedType == webfeed.FeedType.Atom) {
        var feedRaw = webfeed.AtomFeed.parse(xml);
        var feed = FeedModel.fromAtomFeed(feedRaw, url, webfeed.FeedType.Atom);
        var feedItems = _parseAtomItem(feed, feedRaw.items);
        return Tuple2(feed, feedItems);
      }
    } catch (e) {
      LogService.to.e('parse feed error, $url, $e');
    }
    return null;
  }

  static List<FeedItemModel> parseCover(List<FeedItemModel> items) {
    return items.map((item) {
      if (item.description == null) {
        return item;
      }
      var desc = item.description!;
      item.cover = findCoverImageInHtml(desc);
      return item;
    }).toList();
  }

  // extract content from html
  static String extractReadableContent(String html) {
    var doc = HtmlDocument(input: html);
    if (doc.parse()) {
      return doc.pureHtml;
    }
    return '';
  }

  Future<void> downloadHtml(List<FeedItemModel> feedItems) async {
    final Map<int, FeedItemModel> coverUpdateItems = {};
    if (feedItems.isEmpty) return;
    int idx = 0;
    while (idx < feedItems.length && feedItems[idx].link == null) {
      idx += 1;
    }
    var loadCompleter = Completer<void>();
    var headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(feedItems[idx].link!)),
      onLoadStop: (controller, url) async {
        debugPrint("Download html: $url");
        // replace code text with textContent to preserve style
        String htmlContent = await controller.evaluateJavascript(source: '''
          var codeElements = document.querySelectorAll('pre > code');
          for (var i = 0; i < codeElements.length; i++) {
            var codeElement = codeElements[i];
            var textContent = codeElement.textContent;
            codeElement.textContent = textContent;
          }
          document.documentElement.outerHTML;
        ''') ?? "";

        String pureContent = await compute(extractReadableContent, htmlContent);

        if (pureContent.length > Constants.minPageContentLength) {
          var content = ContentModel(
            type: ContentType.html,
            content: pureContent,
            uri: url.toString(),
            feedItemMd5String: feedItems[idx].md5String,
            feedUrl: feedItems[idx].feedUrl,
          );
          feedItems[idx].contentIsDownloaded = true;
          DatabaseManager().insertContent(content);
        } else {
          feedItems[idx].contentIsDownloaded = false;
        }

        if (feedItems[idx].cover == null) {
          feedItems[idx].cover = findCoverImageInHtml(pureContent);
          coverUpdateItems[feedItems[idx].id] = feedItems[idx];
        }

        // if (kDebugMode) {
        //   File file = File("/Users/luosen/Desktop/html/$idx.html");
        //   file.writeAsString(htmlContent);
        // }

        DatabaseManager().updateFeedItem(feedItems[idx]);

        idx += 1;
        while (idx < feedItems.length && feedItems[idx].link == null) {
          idx += 1;
        }
        if (idx < feedItems.length) {
          controller.loadUrl(
              urlRequest: URLRequest(url: Uri.parse(feedItems[idx].link!)));
        } else {
          // after all items downloaded, update cover
          if (coverUpdateItems.isNotEmpty) {
            Get.find<PostAllController>().handleCoverUpdate(coverUpdateItems);
            Get.find<PostFocusController>().handleCoverUpdate(coverUpdateItems);
            await DatabaseManager().updateFeedItems(
                coverUpdateItems.entries.map((e) => e.value).toList());
            SyncService.to.pushToService();
            coverUpdateItems.clear();
          }
          loadCompleter.complete();
        }
      },
    );
    headlessWebView.run();
    await loadCompleter.future;
    headlessWebView.dispose();
  }

  Future<String?> fetchFeedFromUrl(String url) async {
    try {
      var res = await HttpService.to.get(url);
      return res.data;
    } catch (e) {
      LogService.to.e(e);
      return null;
    }
  }

  Future<bool> addFeedFromUrl(String url) async {
    String? xml = await fetchFeedFromUrl(url);
    if (xml == null) return false;
    Tuple2<FeedModel, List<FeedItemModel>>? res = _parseFeed(xml, url);
    if (res == null) return false;

    var hash = md5.convert(utf8.encode(xml)).toString();

    var newLastItemPublishTime = res.item2.isNotEmpty
        ? res.item2.first.publishTime ?? DateTime.now()
        : DateTime.now();

    var newUpdateRecord = FeedUpdateRecordModel(
        feedUrl: url,
        lastUpdate: DateTime.now(),
        updateTime: DateTime.now(),
        lastContentHash: hash,
        lastItemPublishTime: newLastItemPublishTime,
        isSynced: false);
    var feedItems = parseCover(res.item2);
    await DatabaseManager()
        .insertFeedAndItems(res.item1, feedItems, newUpdateRecord);

    NoticeService.to.updateExplore(feedItems.length);
    downloadHtml(feedItems);
    return true;
  }

  FeedModel? handleSingleOutline(XmlElement outline) {
    List<XmlElement> childOutlines = outline.findElements('outline').toList();
    if (childOutlines.isNotEmpty) {
      return null;
    }
    var feedName = outline.getAttribute('title');
    var feedDescription = outline.getAttribute('text');
    var feedHtmlUrl = outline.getAttribute('xmlUrl');

    if (feedHtmlUrl == null) {
      return null;
    }
    return FeedModel(feedHtmlUrl,
        customName: feedName,
        customDescription: feedDescription,
        updateTime: DateTime.now(),
        createTime: DateTime.now(),
        isSynced: false);
  }

  Future<void> importFeedFromOpml(String opmlContent) async {
    XmlDocument document = XmlDocument.parse(opmlContent);
    XmlElement opmlElement = document.findElements('opml').first;
    XmlElement bodyElement = opmlElement.findElements('body').first;

    var feeds = <FeedModel>[];

    for (var outline in bodyElement.findElements('outline')) {
      List<XmlElement> childOutlines = outline.findElements('outline').toList();
      if (childOutlines.isNotEmpty) {
        // create feed group
        var groupTitle = outline.getAttribute('title');
        var groupText = outline.getAttribute('text');
        if (groupTitle != null) {
          var group = FeedGroupModel(
              name: groupTitle, description: groupText, isSynced: false);
          await DatabaseManager().insertGroup(group);
        }

        // for each child outline, add feed
        for (var childOutline in childOutlines) {
          var feed = handleSingleOutline(childOutline);
          if (feed != null) {
            if (groupTitle != null) {
              feed.groupName = groupTitle;
            }
            feeds.add(feed);
          }
        }
      } else {
        var feed = handleSingleOutline(outline);
        if (feed != null) {
          feeds.add(feed);
        }
      }
    }
    await DatabaseManager().insertFeeds(feeds);
    await fetchFeeds(feeds);
  }

  Future<int> fetchFeeds(List<FeedModel> feeds) async {
    int totalUpdate = 0;
    List<FeedUpdateRecordModel?> feedLastUpdateRecords =
        await DatabaseManager().getFeedLastUpdateRecord(feeds);

    var feedsNeedUpdate = <int>[];
    // if there is no update record, feed need to update
    // if last update time is within config hour, feed need to update
    // otherwise, feed don't need to update
    for (var i = 0; i < feeds.length; i++) {
      var lastUpdateRecord = feedLastUpdateRecords[i];
      if (lastUpdateRecord == null ||
          DateTime.now().difference(lastUpdateRecord.lastUpdate).inHours >=
              Constants.feedUpdateHour) {
        feedsNeedUpdate.add(i);
      }
    }

    // fetch feed content and compute md5 hash
    // if hash is different from last update record, feed need to update
    // otherwise, feed don't need to update
    for (var i in feedsNeedUpdate) {
      var feed = feeds[i];
      var lastUpdateRecord = feedLastUpdateRecords[i];
      var content = await fetchFeedFromUrl(feed.url);
      if (content == null) {
        continue;
      }
      var hash = md5.convert(utf8.encode(content)).toString();
      if (lastUpdateRecord != null &&
          lastUpdateRecord.lastContentHash == hash) {
        continue;
      }

      var feedItems = feed.type != null
          ? parseFeedItems(content, feed)
          : parseFeedItemsAndUpdateFeed(content, feed);

      var feedItemsNeedInsert = <FeedItemModel>[];
      // if the pulish time of feed item is before last update time, feed item don't need to insert
      // if the pulish time of feed item is null, feed item need to insert
      // if there is no publish time in last update record, feed item need to insert
      // otherwise, feed item don't need to insert
      DateTime? newLastItemPublishTime;
      for (var item in feedItems) {
        if (item.publishTime == null ||
            lastUpdateRecord == null ||
            lastUpdateRecord.lastItemPublishTime == null ||
            item.publishTime!.isAfter(lastUpdateRecord.lastItemPublishTime!)) {
          feedItemsNeedInsert.add(item);
          if (item.publishTime != null &&
              (newLastItemPublishTime == null ||
                  item.publishTime!.isAfter(newLastItemPublishTime))) {
            newLastItemPublishTime = item.publishTime;
          }
        }
      }

      // if there is no feed item need to insert, feed don't need to update
      if (feedItemsNeedInsert.isEmpty) {
        continue;
      }

      var newUpdateRecord = FeedUpdateRecordModel(
          feedUrl: feed.url,
          lastUpdate: DateTime.now(),
          updateTime: DateTime.now(),
          lastContentHash: hash,
          lastItemPublishTime: newLastItemPublishTime,
          isSynced: false);
      feedItemsNeedInsert = parseCover(feedItemsNeedInsert);
      await DatabaseManager()
          .insertFeedItems(feedItemsNeedInsert, newUpdateRecord);

      NoticeService.to.updateExplore(feedItemsNeedInsert.length);

      totalUpdate += feedItemsNeedInsert.length;

      downloadHtml(feedItemsNeedInsert);
    }
    return totalUpdate;
  }

  // parse feed items from feed content
  List<FeedItemModel> parseFeedItems(String content, FeedModel feed) {
    switch (feed.type) {
      case FeedType.atom:
        var feedRaw = webfeed.AtomFeed.parse(content);
        return _parseAtomItem(feed, feedRaw.items);
      case FeedType.rss:
        var feedRaw = webfeed.RssFeed.parse(content);
        return _parseRssItem(feed, feedRaw.items);
      default:
        return [];
    }
  }

  List<FeedItemModel> parseFeedItemsAndUpdateFeed(
      String content, FeedModel feed) {
    var feedType = getFeedType(content);
    if (feedType == webfeed.FeedType.Rss) {
      var feedRaw = webfeed.RssFeed.parse(content);
      feed.completeByRssFeed(feedRaw);
      var feedItems = _parseRssItem(feed, feedRaw.items);
      DatabaseManager().updateFeed(feed);
      return feedItems;
    } else if (feedType == webfeed.FeedType.Atom) {
      var feedRaw = webfeed.AtomFeed.parse(content);
      feed.completeByAtomFeed(feedRaw);
      var feedItems = _parseAtomItem(feed, feedRaw.items);
      DatabaseManager().updateFeed(feed);
      return feedItems;
    } else {
      return [];
    }
  }

  Future<void> fetchAllFeed() async {
    var allFeed = await DatabaseManager().getAllFeeds();
    await fetchFeeds(allFeed);
  }
}
