//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class UserProfile {
  /// Returns a new [UserProfile] instance.
  UserProfile({
    required this.email,
    required this.proEndTime,
    required this.proLevel,
    required this.userId,
    required this.username,
  });

  String email;

  int proEndTime;

  ProLevel proLevel;

  int userId;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserProfile &&
     other.email == email &&
     other.proEndTime == proEndTime &&
     other.proLevel == proLevel &&
     other.userId == userId &&
     other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email.hashCode) +
    (proEndTime.hashCode) +
    (proLevel.hashCode) +
    (userId.hashCode) +
    (username.hashCode);

  @override
  String toString() => 'UserProfile[email=$email, proEndTime=$proEndTime, proLevel=$proLevel, userId=$userId, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'email'] = this.email;
      json[r'proEndTime'] = this.proEndTime;
      json[r'proLevel'] = this.proLevel;
      json[r'userId'] = this.userId;
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [UserProfile] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserProfile? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UserProfile[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UserProfile[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UserProfile(
        email: mapValueOfType<String>(json, r'email')!,
        proEndTime: mapValueOfType<int>(json, r'proEndTime')!,
        proLevel: ProLevel.fromJson(json[r'proLevel'])!,
        userId: mapValueOfType<int>(json, r'userId')!,
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<UserProfile>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserProfile>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserProfile.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserProfile> mapFromJson(dynamic json) {
    final map = <String, UserProfile>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProfile.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserProfile-objects as value to a dart map
  static Map<String, List<UserProfile>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserProfile>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserProfile.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'email',
    'proEndTime',
    'proLevel',
    'userId',
    'username',
  };
}

