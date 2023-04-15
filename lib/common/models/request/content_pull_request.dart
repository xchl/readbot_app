class SyncTimestamp {
  int? feed;
  int? feedItem;
  int? feedGroup;
  int? feedUpdateRecord;

  SyncTimestamp(
      {this.feed, this.feedItem, this.feedGroup, this.feedUpdateRecord});

  SyncTimestamp.fromJson(Map<String, dynamic> json) {
    feed = json['feed'];
    feedItem = json['feedItem'];
    feedGroup = json['feedGroup'];
    feedUpdateRecord = json['feedUpdateRecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feed'] = feed;
    data['feedItem'] = feedItem;
    data['feedGroup'] = feedGroup;
    data['feedUpdateRecord'] = feedUpdateRecord;
    return data;
  }
}

class ContentPullRequest {
  SyncTimestamp syncTimestamp;

  ContentPullRequest({required this.syncTimestamp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['syncTimestamp'] = syncTimestamp.toJson();
    return data;
  }
}
