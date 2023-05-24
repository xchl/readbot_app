//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class FeedInfo {
  /// Returns a new [FeedInfo] instance.
  FeedInfo({
    this.image,
    this.title,
    required this.url,
  });

  String? image;

  String? title;

  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeedInfo &&
     other.image == image &&
     other.title == title &&
     other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (image == null ? 0 : image!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'FeedInfo[image=$image, title=$title, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.image != null) {
      json[r'image'] = this.image;
    } else {
      json[r'image'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [FeedInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FeedInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FeedInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeedInfo(
        image: mapValueOfType<String>(json, r'image'),
        title: mapValueOfType<String>(json, r'title'),
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<FeedInfo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeedInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeedInfo> mapFromJson(dynamic json) {
    final map = <String, FeedInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeedInfo-objects as value to a dart map
  static Map<String, List<FeedInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeedInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedInfo.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'url',
  };
}

