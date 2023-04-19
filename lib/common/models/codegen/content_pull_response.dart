//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class ContentPullResponse {
  /// Returns a new [ContentPullResponse] instance.
  ContentPullResponse({
    required this.client,
    this.feedGroups = const [],
    this.feedItems = const [],
    this.feedUpdateRecords = const [],
    this.feeds = const [],
    required this.syncTimestamp,
  });

  ClientInfo client;

  List<FeedGroup> feedGroups;

  List<FeedItem> feedItems;

  List<FeedUpdateRecord> feedUpdateRecords;

  List<Feed> feeds;

  SyncTimestamp syncTimestamp;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContentPullResponse &&
     other.client == client &&
     other.feedGroups == feedGroups &&
     other.feedItems == feedItems &&
     other.feedUpdateRecords == feedUpdateRecords &&
     other.feeds == feeds &&
     other.syncTimestamp == syncTimestamp;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (client.hashCode) +
    (feedGroups.hashCode) +
    (feedItems.hashCode) +
    (feedUpdateRecords.hashCode) +
    (feeds.hashCode) +
    (syncTimestamp.hashCode);

  @override
  String toString() => 'ContentPullResponse[client=$client, feedGroups=$feedGroups, feedItems=$feedItems, feedUpdateRecords=$feedUpdateRecords, feeds=$feeds, syncTimestamp=$syncTimestamp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'client'] = this.client;
      json[r'feedGroups'] = this.feedGroups;
      json[r'feedItems'] = this.feedItems;
      json[r'feedUpdateRecords'] = this.feedUpdateRecords;
      json[r'feeds'] = this.feeds;
      json[r'syncTimestamp'] = this.syncTimestamp;
    return json;
  }

  /// Returns a new [ContentPullResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContentPullResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContentPullResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContentPullResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContentPullResponse(
        client: ClientInfo.fromJson(json[r'client'])!,
        feedGroups: FeedGroup.listFromJson(json[r'feedGroups'])!,
        feedItems: FeedItem.listFromJson(json[r'feedItems'])!,
        feedUpdateRecords: FeedUpdateRecord.listFromJson(json[r'feedUpdateRecords'])!,
        feeds: Feed.listFromJson(json[r'feeds'])!,
        syncTimestamp: SyncTimestamp.fromJson(json[r'syncTimestamp'])!,
      );
    }
    return null;
  }

  static List<ContentPullResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentPullResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentPullResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContentPullResponse> mapFromJson(dynamic json) {
    final map = <String, ContentPullResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPullResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContentPullResponse-objects as value to a dart map
  static Map<String, List<ContentPullResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContentPullResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPullResponse.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'client',
    'feedGroups',
    'feedItems',
    'feedUpdateRecords',
    'feeds',
    'syncTimestamp',
  };
}

