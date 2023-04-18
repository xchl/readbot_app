///
//  Generated code. Do not modify.
//  source: response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = const {
  '1': 'AuthResponse',
  '2': const [
    const {'1': 'jwt_tokens', '3': 1, '4': 1, '5': 11, '6': '.model.JwtTokens', '10': 'jwtTokens'},
    const {'1': 'client', '3': 2, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode('CgxBdXRoUmVzcG9uc2USLwoKand0X3Rva2VucxgBIAEoCzIQLm1vZGVsLkp3dFRva2Vuc1IJand0VG9rZW5zEikKBmNsaWVudBgCIAEoCzIRLm1vZGVsLkNsaWVudEluZm9SBmNsaWVudA==');
@$core.Deprecated('Use contentPullResponseDescriptor instead')
const ContentPullResponse$json = const {
  '1': 'ContentPullResponse',
  '2': const [
    const {'1': 'sync_timestamp', '3': 1, '4': 1, '5': 11, '6': '.model.SyncTimestamp', '10': 'syncTimestamp'},
    const {'1': 'feeds', '3': 2, '4': 3, '5': 11, '6': '.model.Feed', '10': 'feeds'},
    const {'1': 'feed_update_records', '3': 3, '4': 3, '5': 11, '6': '.model.FeedUpdateRecord', '10': 'feedUpdateRecords'},
    const {'1': 'feed_groups', '3': 4, '4': 3, '5': 11, '6': '.model.FeedGroup', '10': 'feedGroups'},
    const {'1': 'feed_items', '3': 5, '4': 3, '5': 11, '6': '.model.FeedItem', '10': 'feedItems'},
    const {'1': 'client', '3': 6, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
  ],
};

/// Descriptor for `ContentPullResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPullResponseDescriptor = $convert.base64Decode('ChNDb250ZW50UHVsbFJlc3BvbnNlEjsKDnN5bmNfdGltZXN0YW1wGAEgASgLMhQubW9kZWwuU3luY1RpbWVzdGFtcFINc3luY1RpbWVzdGFtcBIhCgVmZWVkcxgCIAMoCzILLm1vZGVsLkZlZWRSBWZlZWRzEkcKE2ZlZWRfdXBkYXRlX3JlY29yZHMYAyADKAsyFy5tb2RlbC5GZWVkVXBkYXRlUmVjb3JkUhFmZWVkVXBkYXRlUmVjb3JkcxIxCgtmZWVkX2dyb3VwcxgEIAMoCzIQLm1vZGVsLkZlZWRHcm91cFIKZmVlZEdyb3VwcxIuCgpmZWVkX2l0ZW1zGAUgAygLMg8ubW9kZWwuRmVlZEl0ZW1SCWZlZWRJdGVtcxIpCgZjbGllbnQYBiABKAsyES5tb2RlbC5DbGllbnRJbmZvUgZjbGllbnQ=');
@$core.Deprecated('Use contentPushResponseDescriptor instead')
const ContentPushResponse$json = const {
  '1': 'ContentPushResponse',
  '2': const [
    const {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.model.ClientInfo', '10': 'client'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ContentPushResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPushResponseDescriptor = $convert.base64Decode('ChNDb250ZW50UHVzaFJlc3BvbnNlEikKBmNsaWVudBgBIAEoCzIRLm1vZGVsLkNsaWVudEluZm9SBmNsaWVudBIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
