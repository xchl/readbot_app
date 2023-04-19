//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class ContentPushResponse {
  /// Returns a new [ContentPushResponse] instance.
  ContentPushResponse({
    required this.client,
    required this.message,
  });

  ClientInfo client;

  String message;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContentPushResponse &&
     other.client == client &&
     other.message == message;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (client.hashCode) +
    (message.hashCode);

  @override
  String toString() => 'ContentPushResponse[client=$client, message=$message]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'client'] = this.client;
      json[r'message'] = this.message;
    return json;
  }

  /// Returns a new [ContentPushResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContentPushResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContentPushResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContentPushResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContentPushResponse(
        client: ClientInfo.fromJson(json[r'client'])!,
        message: mapValueOfType<String>(json, r'message')!,
      );
    }
    return null;
  }

  static List<ContentPushResponse>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentPushResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentPushResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContentPushResponse> mapFromJson(dynamic json) {
    final map = <String, ContentPushResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPushResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContentPushResponse-objects as value to a dart map
  static Map<String, List<ContentPushResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContentPushResponse>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentPushResponse.listFromJson(entry.value, growable: growable,);
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
    'message',
  };
}

