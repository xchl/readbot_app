//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class ContentPullRequest {
  /// Returns a new [ContentPullRequest] instance.
  ContentPullRequest({
    required this.client,
    required this.syncTimestamp,
  });

  ClientInfo client;

  SyncTimestamp syncTimestamp;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContentPullRequest &&
     other.client == client &&
     other.syncTimestamp == syncTimestamp;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (client.hashCode) +
    (syncTimestamp.hashCode);

  @override
  String toString() => 'ContentPullRequest[client=$client, syncTimestamp=$syncTimestamp]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'client'] = this.client;
      json[r'syncTimestamp'] = this.syncTimestamp;
    return json;
  }

  /// Returns a new [ContentPullRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContentPullRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContentPullRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContentPullRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContentPullRequest(
        client: ClientInfo.fromJson(json[r'client'])!,
        syncTimestamp: SyncTimestamp.fromJson(json[r'syncTimestamp'])!,
      );
    }
    return null;
  }

  static List<ContentPullRequest>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentPullRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentPullRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContentPullRequest> mapFromJson(dynamic json) {
    final map = <String, ContentPullRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPullRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContentPullRequest-objects as value to a dart map
  static Map<String, List<ContentPullRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContentPullRequest>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPullRequest.listFromJson(entry.value, growable: growable,);
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
    'syncTimestamp',
  };
}

