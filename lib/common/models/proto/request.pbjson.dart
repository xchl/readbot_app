///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use registerInfoDescriptor instead')
const RegisterInfo$json = const {
  '1': 'RegisterInfo',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerInfoDescriptor = $convert.base64Decode('CgxSZWdpc3RlckluZm8SGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhQKBWVtYWlsGAIgASgJUgVlbWFpbBIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use loginInfoDescriptor instead')
const LoginInfo$json = const {
  '1': 'LoginInfo',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginInfoDescriptor = $convert.base64Decode('CglMb2dpbkluZm8SFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
    const {'1': 'login_info', '3': 2, '4': 1, '5': 11, '6': '.request.LoginInfo', '10': 'loginInfo'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSKQoGY2xpZW50GAEgASgLMhEubW9kZWwuQ2xpZW50SW5mb1IGY2xpZW50EjEKCmxvZ2luX2luZm8YAiABKAsyEi5yZXF1ZXN0LkxvZ2luSW5mb1IJbG9naW5JbmZv');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
    const {'1': 'register_info', '3': 2, '4': 1, '5': 11, '6': '.request.RegisterInfo', '10': 'registerInfo'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSKQoGY2xpZW50GAEgASgLMhEubW9kZWwuQ2xpZW50SW5mb1IGY2xpZW50EjoKDXJlZ2lzdGVyX2luZm8YAiABKAsyFS5yZXF1ZXN0LlJlZ2lzdGVySW5mb1IMcmVnaXN0ZXJJbmZv');
@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = const {
  '1': 'RefreshTokenRequest',
  '2': const [
    const {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode('ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EikKBmNsaWVudBgBIAEoCzIRLm1vZGVsLkNsaWVudEluZm9SBmNsaWVudBIjCg1yZWZyZXNoX3Rva2VuGAIgASgJUgxyZWZyZXNoVG9rZW4=');
@$core.Deprecated('Use contentPullRequestDescriptor instead')
const ContentPullRequest$json = const {
  '1': 'ContentPullRequest',
  '2': const [
    const {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
    const {'1': 'sync_timestamp', '3': 2, '4': 1, '5': 11, '6': '.model.SyncTimestamp', '10': 'syncTimestamp'},
  ],
};

/// Descriptor for `ContentPullRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPullRequestDescriptor = $convert.base64Decode('ChJDb250ZW50UHVsbFJlcXVlc3QSKQoGY2xpZW50GAEgASgLMhEubW9kZWwuQ2xpZW50SW5mb1IGY2xpZW50EjsKDnN5bmNfdGltZXN0YW1wGAIgASgLMhQubW9kZWwuU3luY1RpbWVzdGFtcFINc3luY1RpbWVzdGFtcA==');
@$core.Deprecated('Use contentPushRequestDescriptor instead')
const ContentPushRequest$json = const {
  '1': 'ContentPushRequest',
  '2': const [
    const {'1': 'feeds', '3': 1, '4': 3, '5': 11, '6': '.model.Feed', '10': 'feeds'},
    const {'1': 'feed_update_records', '3': 2, '4': 3, '5': 11, '6': '.model.FeedUpdateRecord', '10': 'feedUpdateRecords'},
    const {'1': 'feed_groups', '3': 3, '4': 3, '5': 11, '6': '.model.FeedGroup', '10': 'feedGroups'},
    const {'1': 'feed_items', '3': 4, '4': 3, '5': 11, '6': '.model.FeedItem', '10': 'feedItems'},
    const {'1': 'client', '3': 5, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
  ],
};

/// Descriptor for `ContentPushRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPushRequestDescriptor = $convert.base64Decode('ChJDb250ZW50UHVzaFJlcXVlc3QSIQoFZmVlZHMYASADKAsyCy5tb2RlbC5GZWVkUgVmZWVkcxJHChNmZWVkX3VwZGF0ZV9yZWNvcmRzGAIgAygLMhcubW9kZWwuRmVlZFVwZGF0ZVJlY29yZFIRZmVlZFVwZGF0ZVJlY29yZHMSMQoLZmVlZF9ncm91cHMYAyADKAsyEC5tb2RlbC5GZWVkR3JvdXBSCmZlZWRHcm91cHMSLgoKZmVlZF9pdGVtcxgEIAMoCzIPLm1vZGVsLkZlZWRJdGVtUglmZWVkSXRlbXMSKQoGY2xpZW50GAUgASgLMhEubW9kZWwuQ2xpZW50SW5mb1IGY2xpZW50');
