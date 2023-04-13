///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ProLevel extends $pb.ProtobufEnum {
  static const ProLevel PRO_LEVEL_NORMAL = ProLevel._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRO_LEVEL_NORMAL');
  static const ProLevel PRO_LEVEL_PRO = ProLevel._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRO_LEVEL_PRO');
  static const ProLevel PRO_LEVEL_SPRO = ProLevel._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRO_LEVEL_SPRO');

  static const $core.List<ProLevel> values = <ProLevel> [
    PRO_LEVEL_NORMAL,
    PRO_LEVEL_PRO,
    PRO_LEVEL_SPRO,
  ];

  static final $core.Map<$core.int, ProLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProLevel? valueOf($core.int value) => _byValue[value];

  const ProLevel._($core.int v, $core.String n) : super(v, n);
}

class FeedType extends $pb.ProtobufEnum {
  static const FeedType RSS = FeedType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RSS');
  static const FeedType ATOM = FeedType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ATOM');
  static const FeedType Unknown = FeedType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Unknown');

  static const $core.List<FeedType> values = <FeedType> [
    RSS,
    ATOM,
    Unknown,
  ];

  static final $core.Map<$core.int, FeedType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FeedType? valueOf($core.int value) => _byValue[value];

  const FeedType._($core.int v, $core.String n) : super(v, n);
}

