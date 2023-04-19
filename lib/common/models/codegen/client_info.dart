//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';

class ClientInfo {
  /// Returns a new [ClientInfo] instance.
  ClientInfo({
    this.clientId,
    required this.clientName,
  });

  int? clientId;

  String clientName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ClientInfo &&
     other.clientId == clientId &&
     other.clientName == clientName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clientId == null ? 0 : clientId!.hashCode) +
    (clientName.hashCode);

  @override
  String toString() => 'ClientInfo[clientId=$clientId, clientName=$clientName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.clientId != null) {
      json[r'clientId'] = this.clientId;
    } else {
      json[r'clientId'] = null;
    }
      json[r'clientName'] = this.clientName;
    return json;
  }

  /// Returns a new [ClientInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ClientInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ClientInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ClientInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ClientInfo(
        clientId: mapValueOfType<int>(json, r'clientId'),
        clientName: mapValueOfType<String>(json, r'clientName')!,
      );
    }
    return null;
  }

  static List<ClientInfo>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ClientInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClientInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ClientInfo> mapFromJson(dynamic json) {
    final map = <String, ClientInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ClientInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ClientInfo-objects as value to a dart map
  static Map<String, List<ClientInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ClientInfo>>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ClientInfo.listFromJson(entry.value, growable: growable,);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'clientName',
  };
}

