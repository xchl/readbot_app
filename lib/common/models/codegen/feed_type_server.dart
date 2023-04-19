//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'index.dart';


class FeedTypeServer {
  /// Instantiate a new enum with the provided [value].
  const FeedTypeServer._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  String toString() => value;

  String toJson() => value;

  static const rss = FeedTypeServer._(r'rss');
  static const atom = FeedTypeServer._(r'atom');
  static const unknown = FeedTypeServer._(r'unknown');

  /// List of all possible values in this [enum][FeedTypeServer].
  static const values = <FeedTypeServer>[
    rss,
    atom,
    unknown,
  ];

  static FeedTypeServer? fromJson(dynamic value) => FeedTypeServerTypeTransformer().decode(value);

  static List<FeedTypeServer>? listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeedTypeServer>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeedTypeServer.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FeedTypeServer] to String,
/// and [decode] dynamic data back to [FeedTypeServer].
class FeedTypeServerTypeTransformer {
  factory FeedTypeServerTypeTransformer() => _instance ??= const FeedTypeServerTypeTransformer._();

  const FeedTypeServerTypeTransformer._();

  String encode(FeedTypeServer data) => data.value;

  /// Decodes a [dynamic value][data] to a FeedTypeServer.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FeedTypeServer? decode(dynamic data, {bool allowNull = true}) {
    if (data != null) {
      switch (data) {
        case r'rss': return FeedTypeServer.rss;
        case r'atom': return FeedTypeServer.atom;
        case r'unknown': return FeedTypeServer.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// Singleton [FeedTypeServerTypeTransformer] instance.
  static FeedTypeServerTypeTransformer? _instance;
}

