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
@$core.Deprecated('Use refreshTokenDescriptor instead')
const RefreshToken$json = const {
  '1': 'RefreshToken',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `RefreshToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenDescriptor = $convert.base64Decode('CgxSZWZyZXNoVG9rZW4SFAoFdG9rZW4YASABKAlSBXRva2Vu');
@$core.Deprecated('Use clientInfoDescriptor instead')
const ClientInfo$json = const {
  '1': 'ClientInfo',
  '2': const [
    const {'1': 'client_name', '3': 1, '4': 1, '5': 9, '10': 'clientName'},
  ],
};

/// Descriptor for `ClientInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientInfoDescriptor = $convert.base64Decode('CgpDbGllbnRJbmZvEh8KC2NsaWVudF9uYW1lGAEgASgJUgpjbGllbnROYW1l');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'client_info', '3': 1, '4': 1, '5': 11, '6': '.request.ClientInfo', '10': 'clientInfo'},
    const {'1': 'login_info', '3': 2, '4': 1, '5': 11, '6': '.request.LoginInfo', '10': 'loginInfo'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSNAoLY2xpZW50X2luZm8YASABKAsyEy5yZXF1ZXN0LkNsaWVudEluZm9SCmNsaWVudEluZm8SMQoKbG9naW5faW5mbxgCIAEoCzISLnJlcXVlc3QuTG9naW5JbmZvUglsb2dpbkluZm8=');
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'client_info', '3': 1, '4': 1, '5': 11, '6': '.request.ClientInfo', '10': 'clientInfo'},
    const {'1': 'register_info', '3': 2, '4': 1, '5': 11, '6': '.request.RegisterInfo', '10': 'registerInfo'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSNAoLY2xpZW50X2luZm8YASABKAsyEy5yZXF1ZXN0LkNsaWVudEluZm9SCmNsaWVudEluZm8SOgoNcmVnaXN0ZXJfaW5mbxgCIAEoCzIVLnJlcXVlc3QuUmVnaXN0ZXJJbmZvUgxyZWdpc3RlckluZm8=');
@$core.Deprecated('Use refreshTokenRequestDescriptor instead')
const RefreshTokenRequest$json = const {
  '1': 'RefreshTokenRequest',
  '2': const [
    const {'1': 'client_info', '3': 1, '4': 1, '5': 11, '6': '.request.ClientInfo', '10': 'clientInfo'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 11, '6': '.request.RefreshToken', '10': 'refreshToken'},
  ],
};

/// Descriptor for `RefreshTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refreshTokenRequestDescriptor = $convert.base64Decode('ChNSZWZyZXNoVG9rZW5SZXF1ZXN0EjQKC2NsaWVudF9pbmZvGAEgASgLMhMucmVxdWVzdC5DbGllbnRJbmZvUgpjbGllbnRJbmZvEjoKDXJlZnJlc2hfdG9rZW4YAiABKAsyFS5yZXF1ZXN0LlJlZnJlc2hUb2tlblIMcmVmcmVzaFRva2Vu');
@$core.Deprecated('Use contentPullRequestDescriptor instead')
const ContentPullRequest$json = const {
  '1': 'ContentPullRequest',
  '2': const [
    const {'1': 'sync_timestamp', '3': 1, '4': 1, '5': 11, '6': '.model.SyncTimestamp', '10': 'syncTimestamp'},
  ],
};

/// Descriptor for `ContentPullRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPullRequestDescriptor = $convert.base64Decode('ChJDb250ZW50UHVsbFJlcXVlc3QSOwoOc3luY190aW1lc3RhbXAYASABKAsyFC5tb2RlbC5TeW5jVGltZXN0YW1wUg1zeW5jVGltZXN0YW1w');
@$core.Deprecated('Use contentPushRequestDescriptor instead')
const ContentPushRequest$json = const {
  '1': 'ContentPushRequest',
  '2': const [
    const {'1': 'feeds', '3': 1, '4': 3, '5': 11, '6': '.model.Feed', '10': 'feeds'},
    const {'1': 'feed_update_records', '3': 2, '4': 3, '5': 11, '6': '.model.FeedUpdateRecord', '10': 'feedUpdateRecords'},
    const {'1': 'feed_groups', '3': 3, '4': 3, '5': 11, '6': '.model.FeedGroup', '10': 'feedGroups'},
    const {'1': 'feed_items', '3': 4, '4': 3, '5': 11, '6': '.model.FeedItem', '10': 'feedItems'},
  ],
};

/// Descriptor for `ContentPushRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPushRequestDescriptor = $convert.base64Decode('ChJDb250ZW50UHVzaFJlcXVlc3QSIQoFZmVlZHMYASADKAsyCy5tb2RlbC5GZWVkUgVmZWVkcxJHChNmZWVkX3VwZGF0ZV9yZWNvcmRzGAIgAygLMhcubW9kZWwuRmVlZFVwZGF0ZVJlY29yZFIRZmVlZFVwZGF0ZVJlY29yZHMSMQoLZmVlZF9ncm91cHMYAyADKAsyEC5tb2RlbC5GZWVkR3JvdXBSCmZlZWRHcm91cHMSLgoKZmVlZF9pdGVtcxgEIAMoCzIPLm1vZGVsLkZlZWRJdGVtUglmZWVkSXRlbXM=');
