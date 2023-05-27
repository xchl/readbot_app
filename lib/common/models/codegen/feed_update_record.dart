//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class FeedUpdateRecord {
  /// Returns a new [FeedUpdateRecord] instance.
  FeedUpdateRecord({
    required this.feedUrl,
    required this.lastContentHash,
    this.lastItemPublishTime,
    required this.lastUpdate,
    this.syncTime,
    required this.updateTime,
  });

  String feedUrl;

  String lastContentHash;

  int? lastItemPublishTime;

  int lastUpdate;

  int? syncTime;

  int updateTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeedUpdateRecord &&
     other.feedUrl == feedUrl &&
     other.lastContentHash == lastContentHash &&
     other.lastItemPublishTime == lastItemPublishTime &&
     other.lastUpdate == lastUpdate &&
     other.syncTime == syncTime &&
     other.updateTime == updateTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (feedUrl.hashCode) +
    (lastContentHash.hashCode) +
    (lastItemPublishTime == null ? 0 : lastItemPublishTime!.hashCode) +
    (lastUpdate.hashCode) +
    (syncTime == null ? 0 : syncTime!.hashCode) +
    (updateTime.hashCode);

  @override
  String toString() => 'FeedUpdateRecord[feedUrl=$feedUrl, lastContentHash=$lastContentHash, lastItemPublishTime=$lastItemPublishTime, lastUpdate=$lastUpdate, syncTime=$syncTime, updateTime=$updateTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'feedUrl'] = this.feedUrl;
      json[r'lastContentHash'] = this.lastContentHash;
    if (this.lastItemPublishTime != null) {
      json[r'lastItemPublishTime'] = this.lastItemPublishTime;
    } else {
      json[r'lastItemPublishTime'] = null;
    }
      json[r'lastUpdate'] = this.lastUpdate;
    if (this.syncTime != null) {
      json[r'syncTime'] = this.syncTime;
    } else {
      json[r'syncTime'] = null;
    }
      json[r'updateTime'] = this.updateTime;
    return json;
  }

  /// Returns a new [FeedUpdateRecord] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedUpdateRecord? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FeedUpdateRecord[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FeedUpdateRecord[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeedUpdateRecord(
        feedUrl: mapValueOfType<String>(json, r'feedUrl')!,
        lastContentHash: mapValueOfType<String>(json, r'lastContentHash')!,
        lastItemPublishTime: mapValueOfType<int>(json, r'lastItemPublishTime'),
        lastUpdate: mapValueOfType<int>(json, r'lastUpdate')!,
        syncTime: mapValueOfType<int>(json, r'syncTime'),
        updateTime: mapValueOfType<int>(json, r'updateTime')!,
      );
    }
    return null;
  }

  static List<FeedUpdateRecord>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeedUpdateRecord>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedUpdateRecord.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeedUpdateRecord> mapFromJson(dynamic json) {
    final map = <String, FeedUpdateRecord>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedUpdateRecord.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeedUpdateRecord-objects as value to a dart map
  static Map<String, List<FeedUpdateRecord>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeedUpdateRecord>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedUpdateRecord.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'feedUrl',
    'lastContentHash',
    'lastUpdate',
    'updateTime',
  };
}

