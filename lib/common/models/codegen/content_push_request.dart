//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class ContentPushRequest {
  /// Returns a new [ContentPushRequest] instance.
  ContentPushRequest({
    required this.client,
    this.feedGroups = const [],
    this.feedItems = const [],
    this.feedUpdateRecords = const [],
    this.feeds = const [],
  });

  ClientInfo client;

  List<FeedGroup> feedGroups;

  List<FeedItem> feedItems;

  List<FeedUpdateRecord> feedUpdateRecords;

  List<Feed> feeds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContentPushRequest &&
     other.client == client &&
     other.feedGroups == feedGroups &&
     other.feedItems == feedItems &&
     other.feedUpdateRecords == feedUpdateRecords &&
     other.feeds == feeds;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (client.hashCode) +
    (feedGroups.hashCode) +
    (feedItems.hashCode) +
    (feedUpdateRecords.hashCode) +
    (feeds.hashCode);

  @override
  String toString() => 'ContentPushRequest[client=$client, feedGroups=$feedGroups, feedItems=$feedItems, feedUpdateRecords=$feedUpdateRecords, feeds=$feeds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'client'] = this.client;
      json[r'feedGroups'] = this.feedGroups;
      json[r'feedItems'] = this.feedItems;
      json[r'feedUpdateRecords'] = this.feedUpdateRecords;
      json[r'feeds'] = this.feeds;
    return json;
  }

  /// Returns a new [ContentPushRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContentPushRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContentPushRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContentPushRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContentPushRequest(
        client: ClientInfo.fromJson(json[r'client'])!,
        feedGroups: FeedGroup.listFromJson(json[r'feedGroups'])!,
        feedItems: FeedItem.listFromJson(json[r'feedItems'])!,
        feedUpdateRecords: FeedUpdateRecord.listFromJson(json[r'feedUpdateRecords'])!,
        feeds: Feed.listFromJson(json[r'feeds'])!,
      );
    }
    return null;
  }

  static List<ContentPushRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentPushRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentPushRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContentPushRequest> mapFromJson(dynamic json) {
    final map = <String, ContentPushRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPushRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContentPushRequest-objects as value to a dart map
  static Map<String, List<ContentPushRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContentPushRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPushRequest.listFromJson(entry.value, growable: growable,);
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
  };
}

