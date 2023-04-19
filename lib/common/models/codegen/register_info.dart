//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class RegisterInfo {
  /// Returns a new [RegisterInfo] instance.
  RegisterInfo({
    required this.email,
    required this.password,
    required this.username,
  });

  String email;

  String password;

  String username;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RegisterInfo &&
     other.email == email &&
     other.password == password &&
     other.username == username;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (email.hashCode) +
    (password.hashCode) +
    (username.hashCode);

  @override
  String toString() => 'RegisterInfo[email=$email, password=$password, username=$username]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'email'] = this.email;
      json[r'password'] = this.password;
      json[r'username'] = this.username;
    return json;
  }

  /// Returns a new [RegisterInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RegisterInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RegisterInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RegisterInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RegisterInfo(
        email: mapValueOfType<String>(json, r'email')!,
        password: mapValueOfType<String>(json, r'password')!,
        username: mapValueOfType<String>(json, r'username')!,
      );
    }
    return null;
  }

  static List<RegisterInfo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RegisterInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RegisterInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RegisterInfo> mapFromJson(dynamic json) {
    final map = <String, RegisterInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegisterInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RegisterInfo-objects as value to a dart map
  static Map<String, List<RegisterInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RegisterInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RegisterInfo.listFromJson(entry.value, growable: growable,);
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
    'username',
  };
}

