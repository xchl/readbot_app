//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class FeedGroup {
  /// Returns a new [FeedGroup] instance.
  FeedGroup({
    this.description,
    required this.name,
    required this.updateTime,
  });

  String? description;

  String name;

  int updateTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeedGroup &&
     other.description == description &&
     other.name == name &&
     other.updateTime == updateTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name.hashCode) +
    (updateTime.hashCode);

  @override
  String toString() => 'FeedGroup[description=$description, name=$name, updateTime=$updateTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'name'] = this.name;
      json[r'updateTime'] = this.updateTime;
    return json;
  }

  /// Returns a new [FeedGroup] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedGroup? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FeedGroup[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FeedGroup[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeedGroup(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name')!,
        updateTime: mapValueOfType<int>(json, r'updateTime')!,
      );
    }
    return null;
  }

  static List<FeedGroup>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeedGroup>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedGroup.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeedGroup> mapFromJson(dynamic json) {
    final map = <String, FeedGroup>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedGroup.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeedGroup-objects as value to a dart map
  static Map<String, List<FeedGroup>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeedGroup>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedGroup.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'updateTime',
  };
}

