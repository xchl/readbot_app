//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class Feed {
  /// Returns a new [Feed] instance.
  Feed({
    required this.createTime,
    this.customDescription,
    this.customLogo,
    this.customName,
    this.description,
    this.feedType,
    required this.isDeleted,
    this.logo,
    this.name,
    this.syncTime,
    this.tags = const [],
    required this.updateTime,
    required this.url,
  });

  int createTime;

  String? customDescription;

  String? customLogo;

  String? customName;

  String? description;

  FeedTypeServer? feedType;

  bool isDeleted;

  String? logo;

  String? name;

  int? syncTime;

  List<String>? tags;

  int updateTime;

  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Feed &&
     other.createTime == createTime &&
     other.customDescription == customDescription &&
     other.customLogo == customLogo &&
     other.customName == customName &&
     other.description == description &&
     other.feedType == feedType &&
     other.isDeleted == isDeleted &&
     other.logo == logo &&
     other.name == name &&
     other.syncTime == syncTime &&
     other.tags == tags &&
     other.updateTime == updateTime &&
     other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createTime.hashCode) +
    (customDescription == null ? 0 : customDescription!.hashCode) +
    (customLogo == null ? 0 : customLogo!.hashCode) +
    (customName == null ? 0 : customName!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (feedType == null ? 0 : feedType!.hashCode) +
    (isDeleted.hashCode) +
    (logo == null ? 0 : logo!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (syncTime == null ? 0 : syncTime!.hashCode) +
    (tags == null ? 0 : tags!.hashCode) +
    (updateTime.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'Feed[createTime=$createTime, customDescription=$customDescription, customLogo=$customLogo, customName=$customName, description=$description, feedType=$feedType, isDeleted=$isDeleted, logo=$logo, name=$name, syncTime=$syncTime, tags=$tags, updateTime=$updateTime, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'createTime'] = this.createTime;
    if (this.customDescription != null) {
      json[r'customDescription'] = this.customDescription;
    } else {
      json[r'customDescription'] = null;
    }
    if (this.customLogo != null) {
      json[r'customLogo'] = this.customLogo;
    } else {
      json[r'customLogo'] = null;
    }
    if (this.customName != null) {
      json[r'customName'] = this.customName;
    } else {
      json[r'customName'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.feedType != null) {
      json[r'feedType'] = this.feedType;
    } else {
      json[r'feedType'] = null;
    }
      json[r'isDeleted'] = this.isDeleted;
    if (this.logo != null) {
      json[r'logo'] = this.logo;
    } else {
      json[r'logo'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.syncTime != null) {
      json[r'syncTime'] = this.syncTime;
    } else {
      json[r'syncTime'] = null;
    }
    if (this.tags != null) {
      json[r'tags'] = this.tags;
    } else {
      json[r'tags'] = null;
    }
      json[r'updateTime'] = this.updateTime;
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [Feed] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Feed? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "Feed[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "Feed[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return Feed(
        createTime: mapValueOfType<int>(json, r'createTime')!,
        customDescription: mapValueOfType<String>(json, r'customDescription'),
        customLogo: mapValueOfType<String>(json, r'customLogo'),
        customName: mapValueOfType<String>(json, r'customName'),
        description: mapValueOfType<String>(json, r'description'),
        feedType: FeedTypeServer.fromJson(json[r'feedType']),
        isDeleted: mapValueOfType<bool>(json, r'isDeleted')!,
        logo: mapValueOfType<String>(json, r'logo'),
        name: mapValueOfType<String>(json, r'name'),
        syncTime: mapValueOfType<int>(json, r'syncTime'),
        tags: json[r'tags'] is List
            ? (json[r'tags'] as List).cast<String>()
            : const [],
        updateTime: mapValueOfType<int>(json, r'updateTime')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<Feed>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Feed>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Feed.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Feed> mapFromJson(dynamic json) {
    final map = <String, Feed>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Feed.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Feed-objects as value to a dart map
  static Map<String, List<Feed>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Feed>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Feed.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'createTime',
    'isDeleted',
    'updateTime',
    'url',
  };
}

