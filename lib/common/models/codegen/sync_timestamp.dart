//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class SyncTimestamp {
  /// Returns a new [SyncTimestamp] instance.
  SyncTimestamp({
    this.feed,
    this.feedGroup,
    this.feedItem,
    this.feedUpdateRecord,
  });

  int? feed;

  int? feedGroup;

  int? feedItem;

  int? feedUpdateRecord;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SyncTimestamp &&
     other.feed == feed &&
     other.feedGroup == feedGroup &&
     other.feedItem == feedItem &&
     other.feedUpdateRecord == feedUpdateRecord;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (feed == null ? 0 : feed!.hashCode) +
    (feedGroup == null ? 0 : feedGroup!.hashCode) +
    (feedItem == null ? 0 : feedItem!.hashCode) +
    (feedUpdateRecord == null ? 0 : feedUpdateRecord!.hashCode);

  @override
  String toString() => 'SyncTimestamp[feed=$feed, feedGroup=$feedGroup, feedItem=$feedItem, feedUpdateRecord=$feedUpdateRecord]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.feed != null) {
      json[r'feed'] = this.feed;
    } else {
      json[r'feed'] = null;
    }
    if (this.feedGroup != null) {
      json[r'feedGroup'] = this.feedGroup;
    } else {
      json[r'feedGroup'] = null;
    }
    if (this.feedItem != null) {
      json[r'feedItem'] = this.feedItem;
    } else {
      json[r'feedItem'] = null;
    }
    if (this.feedUpdateRecord != null) {
      json[r'feedUpdateRecord'] = this.feedUpdateRecord;
    } else {
      json[r'feedUpdateRecord'] = null;
    }
    return json;
  }

  /// Returns a new [SyncTimestamp] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SyncTimestamp? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SyncTimestamp[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SyncTimestamp[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SyncTimestamp(
        feed: mapValueOfType<int>(json, r'feed'),
        feedGroup: mapValueOfType<int>(json, r'feedGroup'),
        feedItem: mapValueOfType<int>(json, r'feedItem'),
        feedUpdateRecord: mapValueOfType<int>(json, r'feedUpdateRecord'),
      );
    }
    return null;
  }

  static List<SyncTimestamp>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SyncTimestamp>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SyncTimestamp.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SyncTimestamp> mapFromJson(dynamic json) {
    final map = <String, SyncTimestamp>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SyncTimestamp.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SyncTimestamp-objects as value to a dart map
  static Map<String, List<SyncTimestamp>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SyncTimestamp>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SyncTimestamp.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

