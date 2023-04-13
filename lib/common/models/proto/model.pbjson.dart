///
//  Generated code. Do not modify.
//  source: model.proto
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
    const {'1': 'PRO_LEVEL_NORMAL', '2': 0},
    const {'1': 'PRO_LEVEL_PRO', '2': 1},
    const {'1': 'PRO_LEVEL_SPRO', '2': 2},
  ],
};

/// Descriptor for `ProLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List proLevelDescriptor = $convert.base64Decode('CghQcm9MZXZlbBIUChBQUk9fTEVWRUxfTk9STUFMEAASEQoNUFJPX0xFVkVMX1BSTxABEhIKDlBST19MRVZFTF9TUFJPEAI=');
@$core.Deprecated('Use feedTypeDescriptor instead')
const FeedType$json = const {
  '1': 'FeedType',
  '2': const [
    const {'1': 'RSS', '2': 0},
    const {'1': 'ATOM', '2': 1},
    const {'1': 'Unknown', '2': 2},
  ],
};

/// Descriptor for `FeedType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List feedTypeDescriptor = $convert.base64Decode('CghGZWVkVHlwZRIHCgNSU1MQABIICgRBVE9NEAESCwoHVW5rbm93bhAC');
@$core.Deprecated('Use userProfileDescriptor instead')
const UserProfile$json = const {
  '1': 'UserProfile',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'pro_level', '3': 4, '4': 1, '5': 14, '6': '.model.ProLevel', '10': 'proLevel'},
    const {'1': 'pro_end_time', '3': 5, '4': 1, '5': 3, '10': 'proEndTime'},
  ],
};

/// Descriptor for `UserProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileDescriptor = $convert.base64Decode('CgtVc2VyUHJvZmlsZRIOCgJpZBgBIAEoBVICaWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIsCglwcm9fbGV2ZWwYBCABKA4yDy5tb2RlbC5Qcm9MZXZlbFIIcHJvTGV2ZWwSIAoMcHJvX2VuZF90aW1lGAUgASgDUgpwcm9FbmRUaW1l');
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
@$core.Deprecated('Use feedGroupDescriptor instead')
const FeedGroup$json = const {
  '1': 'FeedGroup',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'update_time', '3': 4, '4': 1, '5': 3, '10': 'updateTime'},
  ],
};

/// Descriptor for `FeedGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedGroupDescriptor = $convert.base64Decode('CglGZWVkR3JvdXASDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEh8KC3VwZGF0ZV90aW1lGAQgASgDUgp1cGRhdGVUaW1l');
@$core.Deprecated('Use feedItemDescriptor instead')
const FeedItem$json = const {
  '1': 'FeedItem',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'is_focus', '3': 2, '4': 1, '5': 8, '10': 'isFocus'},
    const {'1': 'is_seen', '3': 3, '4': 1, '5': 8, '10': 'isSeen'},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'cover', '3': 5, '4': 1, '5': 9, '10': 'cover'},
    const {'1': 'link', '3': 6, '4': 1, '5': 9, '10': 'link'},
    const {'1': 'publish_time', '3': 9, '4': 1, '5': 3, '10': 'publishTime'},
    const {'1': 'authors', '3': 10, '4': 1, '5': 9, '10': 'authors'},
    const {'1': 'tags', '3': 11, '4': 3, '5': 9, '10': 'tags'},
    const {'1': 'category', '3': 12, '4': 1, '5': 9, '10': 'category'},
    const {'1': 'description', '3': 13, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'summary_algo', '3': 14, '4': 1, '5': 9, '10': 'summaryAlgo'},
    const {'1': 'content', '3': 15, '4': 1, '5': 9, '10': 'content'},
    const {'1': 'content_have_parsed', '3': 16, '4': 1, '5': 8, '10': 'contentHaveParsed'},
    const {'1': 'create_time', '3': 17, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'md5_string', '3': 18, '4': 1, '5': 9, '10': 'md5String'},
    const {'1': 'feed_id', '3': 19, '4': 1, '5': 5, '10': 'feedId'},
    const {'1': 'update_time', '3': 20, '4': 1, '5': 3, '10': 'updateTime'},
  ],
};

/// Descriptor for `FeedItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedItemDescriptor = $convert.base64Decode('CghGZWVkSXRlbRIOCgJpZBgBIAEoBVICaWQSGQoIaXNfZm9jdXMYAiABKAhSB2lzRm9jdXMSFwoHaXNfc2VlbhgDIAEoCFIGaXNTZWVuEhQKBXRpdGxlGAQgASgJUgV0aXRsZRIUCgVjb3ZlchgFIAEoCVIFY292ZXISEgoEbGluaxgGIAEoCVIEbGluaxIhCgxwdWJsaXNoX3RpbWUYCSABKANSC3B1Ymxpc2hUaW1lEhgKB2F1dGhvcnMYCiABKAlSB2F1dGhvcnMSEgoEdGFncxgLIAMoCVIEdGFncxIaCghjYXRlZ29yeRgMIAEoCVIIY2F0ZWdvcnkSIAoLZGVzY3JpcHRpb24YDSABKAlSC2Rlc2NyaXB0aW9uEiEKDHN1bW1hcnlfYWxnbxgOIAEoCVILc3VtbWFyeUFsZ28SGAoHY29udGVudBgPIAEoCVIHY29udGVudBIuChNjb250ZW50X2hhdmVfcGFyc2VkGBAgASgIUhFjb250ZW50SGF2ZVBhcnNlZBIfCgtjcmVhdGVfdGltZRgRIAEoA1IKY3JlYXRlVGltZRIdCgptZDVfc3RyaW5nGBIgASgJUgltZDVTdHJpbmcSFwoHZmVlZF9pZBgTIAEoBVIGZmVlZElkEh8KC3VwZGF0ZV90aW1lGBQgASgDUgp1cGRhdGVUaW1l');
@$core.Deprecated('Use feedUpdateRecordDescriptor instead')
const FeedUpdateRecord$json = const {
  '1': 'FeedUpdateRecord',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'feed_id', '3': 2, '4': 1, '5': 5, '10': 'feedId'},
    const {'1': 'last_update', '3': 3, '4': 1, '5': 3, '10': 'lastUpdate'},
    const {'1': 'last_content_hash', '3': 4, '4': 1, '5': 9, '10': 'lastContentHash'},
    const {'1': 'last_item_publish_time', '3': 5, '4': 1, '5': 3, '10': 'lastItemPublishTime'},
    const {'1': 'update_time', '3': 6, '4': 1, '5': 3, '10': 'updateTime'},
  ],
};

/// Descriptor for `FeedUpdateRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedUpdateRecordDescriptor = $convert.base64Decode('ChBGZWVkVXBkYXRlUmVjb3JkEg4KAmlkGAEgASgFUgJpZBIXCgdmZWVkX2lkGAIgASgFUgZmZWVkSWQSHwoLbGFzdF91cGRhdGUYAyABKANSCmxhc3RVcGRhdGUSKgoRbGFzdF9jb250ZW50X2hhc2gYBCABKAlSD2xhc3RDb250ZW50SGFzaBIzChZsYXN0X2l0ZW1fcHVibGlzaF90aW1lGAUgASgDUhNsYXN0SXRlbVB1Ymxpc2hUaW1lEh8KC3VwZGF0ZV90aW1lGAYgASgDUgp1cGRhdGVUaW1l');
@$core.Deprecated('Use feedDescriptor instead')
const Feed$json = const {
  '1': 'Feed',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'custom_name', '3': 4, '4': 1, '5': 9, '10': 'customName'},
    const {'1': 'logo', '3': 5, '4': 1, '5': 9, '10': 'logo'},
    const {'1': 'custom_logo', '3': 6, '4': 1, '5': 9, '10': 'customLogo'},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'custom_description', '3': 8, '4': 1, '5': 9, '10': 'customDescription'},
    const {'1': 'group_id', '3': 9, '4': 1, '5': 5, '10': 'groupId'},
    const {'1': 'tags', '3': 10, '4': 3, '5': 9, '10': 'tags'},
    const {'1': 'create_time', '3': 11, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'feed_type', '3': 12, '4': 1, '5': 14, '6': '.model.FeedType', '10': 'feedType'},
    const {'1': 'update_time', '3': 13, '4': 1, '5': 3, '10': 'updateTime'},
  ],
};

/// Descriptor for `Feed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedDescriptor = $convert.base64Decode('CgRGZWVkEg4KAmlkGAEgASgFUgJpZBIQCgN1cmwYAiABKAlSA3VybBISCgRuYW1lGAMgASgJUgRuYW1lEh8KC2N1c3RvbV9uYW1lGAQgASgJUgpjdXN0b21OYW1lEhIKBGxvZ28YBSABKAlSBGxvZ28SHwoLY3VzdG9tX2xvZ28YBiABKAlSCmN1c3RvbUxvZ28SIAoLZGVzY3JpcHRpb24YByABKAlSC2Rlc2NyaXB0aW9uEi0KEmN1c3RvbV9kZXNjcmlwdGlvbhgIIAEoCVIRY3VzdG9tRGVzY3JpcHRpb24SGQoIZ3JvdXBfaWQYCSABKAVSB2dyb3VwSWQSEgoEdGFncxgKIAMoCVIEdGFncxIfCgtjcmVhdGVfdGltZRgLIAEoA1IKY3JlYXRlVGltZRIsCglmZWVkX3R5cGUYDCABKA4yDy5tb2RlbC5GZWVkVHlwZVIIZmVlZFR5cGUSHwoLdXBkYXRlX3RpbWUYDSABKANSCnVwZGF0ZVRpbWU=');
@$core.Deprecated('Use syncTimestampDescriptor instead')
const SyncTimestamp$json = const {
  '1': 'SyncTimestamp',
  '2': const [
    const {'1': 'feed', '3': 1, '4': 1, '5': 3, '10': 'feed'},
    const {'1': 'feed_group', '3': 2, '4': 1, '5': 3, '10': 'feedGroup'},
    const {'1': 'feed_item', '3': 3, '4': 1, '5': 3, '10': 'feedItem'},
    const {'1': 'feed_update_record', '3': 4, '4': 1, '5': 3, '10': 'feedUpdateRecord'},
  ],
};

/// Descriptor for `SyncTimestamp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncTimestampDescriptor = $convert.base64Decode('Cg1TeW5jVGltZXN0YW1wEhIKBGZlZWQYASABKANSBGZlZWQSHQoKZmVlZF9ncm91cBgCIAEoA1IJZmVlZEdyb3VwEhsKCWZlZWRfaXRlbRgDIAEoA1IIZmVlZEl0ZW0SLAoSZmVlZF91cGRhdGVfcmVjb3JkGAQgASgDUhBmZWVkVXBkYXRlUmVjb3Jk');
