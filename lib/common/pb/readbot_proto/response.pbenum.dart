///
//  Generated code. Do not modify.
//  source: readbot_proto/response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ProLevel extends $pb.ProtobufEnum {
  static const ProLevel PRO_LEVEL_FREE = ProLevel._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRO_LEVEL_FREE');
  static const ProLevel PRO_LEVEL_PRO = ProLevel._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRO_LEVEL_PRO');

  static const $core.List<ProLevel> values = <ProLevel> [
    PRO_LEVEL_FREE,
    PRO_LEVEL_PRO,
  ];

  static final $core.Map<$core.int, ProLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProLevel? valueOf($core.int value) => _byValue[value];

  const ProLevel._($core.int v, $core.String n) : super(v, n);
}

class ReadStage extends $pb.ProtobufEnum {
  static const ReadStage READ_STAGE_EXPLORE = ReadStage._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'READ_STAGE_EXPLORE');
  static const ReadStage READ_STAGE_FOCUS = ReadStage._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'READ_STAGE_FOCUS');
  static const ReadStage READ_STAGE_SEEN = ReadStage._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'READ_STAGE_SEEN');
  static const ReadStage READ_STAGE_ARCHIVED = ReadStage._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'READ_STAGE_ARCHIVED');

  static const $core.List<ReadStage> values = <ReadStage> [
    READ_STAGE_EXPLORE,
    READ_STAGE_FOCUS,
    READ_STAGE_SEEN,
    READ_STAGE_ARCHIVED,
  ];

  static final $core.Map<$core.int, ReadStage> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReadStage? valueOf($core.int value) => _byValue[value];

  const ReadStage._($core.int v, $core.String n) : super(v, n);
}

