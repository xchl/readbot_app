///
//  Generated code. Do not modify.
//  source: readbot_proto/response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use proLevelDescriptor instead')
const ProLevel$json = const {
  '1': 'ProLevel',
  '2': const [
    const {'1': 'PRO_LEVEL_FREE', '2': 0},
    const {'1': 'PRO_LEVEL_PRO', '2': 1},
  ],
};

/// Descriptor for `ProLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List proLevelDescriptor = $convert.base64Decode('CghQcm9MZXZlbBISCg5QUk9fTEVWRUxfRlJFRRAAEhEKDVBST19MRVZFTF9QUk8QAQ==');
@$core.Deprecated('Use tokensDescriptor instead')
const Tokens$json = const {
  '1': 'Tokens',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `Tokens`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokensDescriptor = $convert.base64Decode('CgZUb2tlbnMSIQoMYWNjZXNzX3Rva2VuGAEgASgJUgthY2Nlc3NUb2tlbhIjCg1yZWZyZXNoX3Rva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4=');
@$core.Deprecated('Use userProfileDescriptor instead')
const UserProfile$json = const {
  '1': 'UserProfile',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'pro_level', '3': 4, '4': 1, '5': 14, '6': '.response.ProLevel', '10': 'proLevel'},
    const {'1': 'pro_end_time', '3': 5, '4': 1, '5': 3, '10': 'proEndTime'},
  ],
};

/// Descriptor for `UserProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileDescriptor = $convert.base64Decode('CgtVc2VyUHJvZmlsZRIOCgJpZBgBIAEoBVICaWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIvCglwcm9fbGV2ZWwYBCABKA4yEi5yZXNwb25zZS5Qcm9MZXZlbFIIcHJvTGV2ZWwSIAoMcHJvX2VuZF90aW1lGAUgASgDUgpwcm9FbmRUaW1l');
@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = const {
  '1': 'AuthResponse',
  '2': const [
    const {'1': 'tokens', '3': 1, '4': 1, '5': 11, '6': '.response.Tokens', '10': 'tokens'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode('CgxBdXRoUmVzcG9uc2USKAoGdG9rZW5zGAEgASgLMhAucmVzcG9uc2UuVG9rZW5zUgZ0b2tlbnM=');
