//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class FeedItem {
  /// Returns a new [FeedItem] instance.
  FeedItem({
    this.authors,
    this.category,
    this.cover,
    required this.createTime,
    this.description,
    required this.feedUrl,
    required this.isFocus,
    required this.isSeen,
    this.link,
    required this.md5String,
    this.publishTime,
    this.summaryAlgo,
    this.tags = const [],
    this.title,
    required this.updateTime,
  });

  String? authors;

  String? category;

  String? cover;

  int createTime;

  String? description;

  String feedUrl;

  bool isFocus;

  bool isSeen;

  String? link;

  String md5String;

  int? publishTime;

  String? summaryAlgo;

  List<String>? tags;

  String? title;

  int updateTime;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeedItem &&
     other.authors == authors &&
     other.category == category &&
     other.cover == cover &&
     other.createTime == createTime &&
     other.description == description &&
     other.feedUrl == feedUrl &&
     other.isFocus == isFocus &&
     other.isSeen == isSeen &&
     other.link == link &&
     other.md5String == md5String &&
     other.publishTime == publishTime &&
     other.summaryAlgo == summaryAlgo &&
     other.tags == tags &&
     other.title == title &&
     other.updateTime == updateTime;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (authors == null ? 0 : authors!.hashCode) +
    (category == null ? 0 : category!.hashCode) +
    (cover == null ? 0 : cover!.hashCode) +
    (createTime.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (feedUrl.hashCode) +
    (isFocus.hashCode) +
    (isSeen.hashCode) +
    (link == null ? 0 : link!.hashCode) +
    (md5String.hashCode) +
    (publishTime == null ? 0 : publishTime!.hashCode) +
    (summaryAlgo == null ? 0 : summaryAlgo!.hashCode) +
    (tags == null ? 0 : tags!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (updateTime.hashCode);

  @override
  String toString() => 'FeedItem[authors=$authors, category=$category, cover=$cover, createTime=$createTime, description=$description, feedUrl=$feedUrl, isFocus=$isFocus, isSeen=$isSeen, link=$link, md5String=$md5String, publishTime=$publishTime, summaryAlgo=$summaryAlgo, tags=$tags, title=$title, updateTime=$updateTime]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.authors != null) {
      json[r'authors'] = this.authors;
    } else {
      json[r'authors'] = null;
    }
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
    }
    if (this.cover != null) {
      json[r'cover'] = this.cover;
    } else {
      json[r'cover'] = null;
    }
      json[r'createTime'] = this.createTime;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'feedUrl'] = this.feedUrl;
      json[r'isFocus'] = this.isFocus;
      json[r'isSeen'] = this.isSeen;
    if (this.link != null) {
      json[r'link'] = this.link;
    } else {
      json[r'link'] = null;
    }
      json[r'md5String'] = this.md5String;
    if (this.publishTime != null) {
      json[r'publishTime'] = this.publishTime;
    } else {
      json[r'publishTime'] = null;
    }
    if (this.summaryAlgo != null) {
      json[r'summaryAlgo'] = this.summaryAlgo;
    } else {
      json[r'summaryAlgo'] = null;
    }
    if (this.tags != null) {
      json[r'tags'] = this.tags;
    } else {
      json[r'tags'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
      json[r'updateTime'] = this.updateTime;
    return json;
  }

  /// Returns a new [FeedItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeedItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FeedItem[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FeedItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FeedItem(
        authors: mapValueOfType<String>(json, r'authors'),
        category: mapValueOfType<String>(json, r'category'),
        cover: mapValueOfType<String>(json, r'cover'),
        createTime: mapValueOfType<int>(json, r'createTime')!,
        description: mapValueOfType<String>(json, r'description'),
        feedUrl: mapValueOfType<String>(json, r'feedUrl')!,
        isFocus: mapValueOfType<bool>(json, r'isFocus')!,
        isSeen: mapValueOfType<bool>(json, r'isSeen')!,
        link: mapValueOfType<String>(json, r'link'),
        md5String: mapValueOfType<String>(json, r'md5String')!,
        publishTime: mapValueOfType<int>(json, r'publishTime'),
        summaryAlgo: mapValueOfType<String>(json, r'summaryAlgo'),
        tags: json[r'tags'] is List
            ? (json[r'tags'] as List).cast<String>()
            : const [],
        title: mapValueOfType<String>(json, r'title'),
        updateTime: mapValueOfType<int>(json, r'updateTime')!,
      );
    }
    return null;
  }

  static List<FeedItem>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeedItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeedItem> mapFromJson(dynamic json) {
    final map = <String, FeedItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeedItem-objects as value to a dart map
  static Map<String, List<FeedItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeedItem>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeedItem.listFromJson(entry.value, growable: growable,);
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
    'feedUrl',
    'isFocus',
    'isSeen',
    'md5String',
    'updateTime',
  };
}

