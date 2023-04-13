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
    const {'1': 'tokens', '3': 1, '4': 1, '5': 11, '6': '.model.Tokens', '10': 'tokens'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode('CgxBdXRoUmVzcG9uc2USJQoGdG9rZW5zGAEgASgLMg0ubW9kZWwuVG9rZW5zUgZ0b2tlbnM=');
@$core.Deprecated('Use contentPullResponseDescriptor instead')
const ContentPullResponse$json = const {
  '1': 'ContentPullResponse',
  '2': const [
    const {'1': 'feeds', '3': 1, '4': 3, '5': 11, '6': '.model.Feed', '10': 'feeds'},
    const {'1': 'feed_update_records', '3': 2, '4': 3, '5': 11, '6': '.model.FeedUpdateRecord', '10': 'feedUpdateRecords'},
    const {'1': 'feed_groups', '3': 3, '4': 3, '5': 11, '6': '.model.FeedGroup', '10': 'feedGroups'},
    const {'1': 'feed_items', '3': 4, '4': 3, '5': 11, '6': '.model.FeedItem', '10': 'feedItems'},
  ],
};

/// Descriptor for `ContentPullResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPullResponseDescriptor = $convert.base64Decode('ChNDb250ZW50UHVsbFJlc3BvbnNlEiEKBWZlZWRzGAEgAygLMgsubW9kZWwuRmVlZFIFZmVlZHMSRwoTZmVlZF91cGRhdGVfcmVjb3JkcxgCIAMoCzIXLm1vZGVsLkZlZWRVcGRhdGVSZWNvcmRSEWZlZWRVcGRhdGVSZWNvcmRzEjEKC2ZlZWRfZ3JvdXBzGAMgAygLMhAubW9kZWwuRmVlZEdyb3VwUgpmZWVkR3JvdXBzEi4KCmZlZWRfaXRlbXMYBCADKAsyDy5tb2RlbC5GZWVkSXRlbVIJZmVlZEl0ZW1z');
@$core.Deprecated('Use contentPushResponseDescriptor instead')
const ContentPushResponse$json = const {
  '1': 'ContentPushResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ContentPushResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentPushResponseDescriptor = $convert.base64Decode('ChNDb250ZW50UHVzaFJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');
