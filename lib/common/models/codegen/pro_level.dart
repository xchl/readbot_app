//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';


class ProLevel {
  /// Instantiate a new enum with the provided [value].
  const ProLevel._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const normal = ProLevel._(r'normal');
  static const pro = ProLevel._(r'pro');
  static const spro = ProLevel._(r'spro');

  /// List of all possible values in this [enum][ProLevel].
  static const values = <ProLevel>[
    normal,
    pro,
    spro,
  ];

  static ProLevel? fromJson(dynamic value) => ProLevelTypeTransformer().decode(value);

  static List<ProLevel>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProLevel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProLevel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProLevel] to String,
/// and [decode] dynamic data back to [ProLevel].
class ProLevelTypeTransformer {
  factory ProLevelTypeTransformer() => _instance ??= const ProLevelTypeTransformer._();

  const ProLevelTypeTransformer._();

  String encode(ProLevel data) => data.value;

  /// Decodes a [dynamic value][data] to a ProLevel.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProLevel? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'normal': return ProLevel.normal;
        case r'pro': return ProLevel.pro;
        case r'spro': return ProLevel.spro;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [ProLevelTypeTransformer] instance.
  static ProLevelTypeTransformer? _instance;
}

