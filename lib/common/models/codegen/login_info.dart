//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class LoginInfo {
  /// Returns a new [LoginInfo] instance.
  LoginInfo({
    required this.email,
    required this.password,
  });

  String email;

  String password;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginInfo &&
     other.email == email &&
     other.password == password;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email.hashCode) +
    (password.hashCode);

  @override
  String toString() => 'LoginInfo[email=$email, password=$password]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'email'] = this.email;
      json[r'password'] = this.password;
    return json;
  }

  /// Returns a new [LoginInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LoginInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "LoginInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "LoginInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return LoginInfo(
        email: mapValueOfType<String>(json, r'email')!,
        password: mapValueOfType<String>(json, r'password')!,
      );
    }
    return null;
  }

  static List<LoginInfo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LoginInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LoginInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LoginInfo> mapFromJson(dynamic json) {
    final map = <String, LoginInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LoginInfo-objects as value to a dart map
  static Map<String, List<LoginInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LoginInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LoginInfo.listFromJson(entry.value, growable: growable,);
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
    'password',
  };
}

