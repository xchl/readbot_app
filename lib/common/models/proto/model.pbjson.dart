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
    const {'1': 'FEED_TYPE_RSS', '2': 0},
    const {'1': 'FEED_TYPE_ATOM', '2': 1},
    const {'1': 'FEED_TYPE_UNKNOWN', '2': 2},
  ],
};

/// Descriptor for `FeedType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List feedTypeDescriptor = $convert.base64Decode('CghGZWVkVHlwZRIRCg1GRUVEX1RZUEVfUlNTEAASEgoORkVFRF9UWVBFX0FUT00QARIVChFGRUVEX1RZUEVfVU5LTk9XThAC');
@$core.Deprecated('Use userProfileDescriptor instead')
const UserProfile$json = const {
  '1': 'UserProfile',
  '2': const [
    const {'1': 'user_id', '3': 1, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'pro_level', '3': 4, '4': 1, '5': 14, '6': '.model.ProLevel', '10': 'proLevel'},
    const {'1': 'pro_end_time', '3': 5, '4': 1, '5': 3, '10': 'proEndTime'},
  ],
};

/// Descriptor for `UserProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userProfileDescriptor = $convert.base64Decode('CgtVc2VyUHJvZmlsZRIXCgd1c2VyX2lkGAEgASgFUgZ1c2VySWQSGgoIdXNlcm5hbWUYAiABKAlSCHVzZXJuYW1lEhQKBWVtYWlsGAMgASgJUgVlbWFpbBIsCglwcm9fbGV2ZWwYBCABKA4yDy5tb2RlbC5Qcm9MZXZlbFIIcHJvTGV2ZWwSIAoMcHJvX2VuZF90aW1lGAUgASgDUgpwcm9FbmRUaW1l');
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
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'update_time', '3': 3, '4': 1, '5': 3, '10': 'updateTime'},
  ],
};

/// Descriptor for `FeedGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedGroupDescriptor = $convert.base64Decode('CglGZWVkR3JvdXASEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SHwoLdXBkYXRlX3RpbWUYAyABKANSCnVwZGF0ZVRpbWU=');
@$core.Deprecated('Use feedItemDescriptor instead')
const FeedItem$json = const {
  '1': 'FeedItem',
  '2': const [
    const {'1': 'feed_url', '3': 1, '4': 1, '5': 9, '10': 'feedUrl'},
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
final $typed_data.Uint8List feedItemDescriptor = $convert.base64Decode('CghGZWVkSXRlbRIZCghmZWVkX3VybBgBIAEoCVIHZmVlZFVybBIZCghpc19mb2N1cxgCIAEoCFIHaXNGb2N1cxIXCgdpc19zZWVuGAMgASgIUgZpc1NlZW4SFAoFdGl0bGUYBCABKAlSBXRpdGxlEhQKBWNvdmVyGAUgASgJUgVjb3ZlchISCgRsaW5rGAYgASgJUgRsaW5rEiEKDHB1Ymxpc2hfdGltZRgJIAEoA1ILcHVibGlzaFRpbWUSGAoHYXV0aG9ycxgKIAEoCVIHYXV0aG9ycxISCgR0YWdzGAsgAygJUgR0YWdzEhoKCGNhdGVnb3J5GAwgASgJUghjYXRlZ29yeRIgCgtkZXNjcmlwdGlvbhgNIAEoCVILZGVzY3JpcHRpb24SIQoMc3VtbWFyeV9hbGdvGA4gASgJUgtzdW1tYXJ5QWxnbxIYCgdjb250ZW50GA8gASgJUgdjb250ZW50Ei4KE2NvbnRlbnRfaGF2ZV9wYXJzZWQYECABKAhSEWNvbnRlbnRIYXZlUGFyc2VkEh8KC2NyZWF0ZV90aW1lGBEgASgDUgpjcmVhdGVUaW1lEh0KCm1kNV9zdHJpbmcYEiABKAlSCW1kNVN0cmluZxIXCgdmZWVkX2lkGBMgASgFUgZmZWVkSWQSHwoLdXBkYXRlX3RpbWUYFCABKANSCnVwZGF0ZVRpbWU=');
@$core.Deprecated('Use feedUpdateRecordDescriptor instead')
const FeedUpdateRecord$json = const {
  '1': 'FeedUpdateRecord',
  '2': const [
    const {'1': 'feed_url', '3': 1, '4': 1, '5': 9, '10': 'feedUrl'},
    const {'1': 'last_update', '3': 2, '4': 1, '5': 3, '10': 'lastUpdate'},
    const {'1': 'last_content_hash', '3': 3, '4': 1, '5': 9, '10': 'lastContentHash'},
    const {'1': 'last_item_publish_time', '3': 4, '4': 1, '5': 3, '10': 'lastItemPublishTime'},
    const {'1': 'update_time', '3': 5, '4': 1, '5': 3, '10': 'updateTime'},
  ],
};

/// Descriptor for `FeedUpdateRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedUpdateRecordDescriptor = $convert.base64Decode('ChBGZWVkVXBkYXRlUmVjb3JkEhkKCGZlZWRfdXJsGAEgASgJUgdmZWVkVXJsEh8KC2xhc3RfdXBkYXRlGAIgASgDUgpsYXN0VXBkYXRlEioKEWxhc3RfY29udGVudF9oYXNoGAMgASgJUg9sYXN0Q29udGVudEhhc2gSMwoWbGFzdF9pdGVtX3B1Ymxpc2hfdGltZRgEIAEoA1ITbGFzdEl0ZW1QdWJsaXNoVGltZRIfCgt1cGRhdGVfdGltZRgFIAEoA1IKdXBkYXRlVGltZQ==');
@$core.Deprecated('Use feedDescriptor instead')
const Feed$json = const {
  '1': 'Feed',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'custom_name', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'customName', '17': true},
    const {'1': 'logo', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'logo', '17': true},
    const {'1': 'custom_logo', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'customLogo', '17': true},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'description', '17': true},
    const {'1': 'custom_description', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'customDescription', '17': true},
    const {'1': 'group_id', '3': 8, '4': 1, '5': 5, '9': 6, '10': 'groupId', '17': true},
    const {'1': 'tags', '3': 9, '4': 3, '5': 9, '10': 'tags'},
    const {'1': 'create_time', '3': 10, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'feed_type', '3': 11, '4': 1, '5': 14, '6': '.model.FeedType', '10': 'feedType'},
    const {'1': 'update_time', '3': 12, '4': 1, '5': 3, '10': 'updateTime'},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_custom_name'},
    const {'1': '_logo'},
    const {'1': '_custom_logo'},
    const {'1': '_description'},
    const {'1': '_custom_description'},
    const {'1': '_group_id'},
  ],
};

/// Descriptor for `Feed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedDescriptor = $convert.base64Decode('CgRGZWVkEhAKA3VybBgBIAEoCVIDdXJsEhcKBG5hbWUYAiABKAlIAFIEbmFtZYgBARIkCgtjdXN0b21fbmFtZRgDIAEoCUgBUgpjdXN0b21OYW1liAEBEhcKBGxvZ28YBCABKAlIAlIEbG9nb4gBARIkCgtjdXN0b21fbG9nbxgFIAEoCUgDUgpjdXN0b21Mb2dviAEBEiUKC2Rlc2NyaXB0aW9uGAYgASgJSARSC2Rlc2NyaXB0aW9uiAEBEjIKEmN1c3RvbV9kZXNjcmlwdGlvbhgHIAEoCUgFUhFjdXN0b21EZXNjcmlwdGlvbogBARIeCghncm91cF9pZBgIIAEoBUgGUgdncm91cElkiAEBEhIKBHRhZ3MYCSADKAlSBHRhZ3MSHwoLY3JlYXRlX3RpbWUYCiABKANSCmNyZWF0ZVRpbWUSLAoJZmVlZF90eXBlGAsgASgOMg8ubW9kZWwuRmVlZFR5cGVSCGZlZWRUeXBlEh8KC3VwZGF0ZV90aW1lGAwgASgDUgp1cGRhdGVUaW1lQgcKBV9uYW1lQg4KDF9jdXN0b21fbmFtZUIHCgVfbG9nb0IOCgxfY3VzdG9tX2xvZ29CDgoMX2Rlc2NyaXB0aW9uQhUKE19jdXN0b21fZGVzY3JpcHRpb25CCwoJX2dyb3VwX2lk');
@$core.Deprecated('Use syncTimestampDescriptor instead')
const SyncTimestamp$json = const {
  '1': 'SyncTimestamp',
  '2': const [
    const {'1': 'feed', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'feed', '17': true},
    const {'1': 'feed_group', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'feedGroup', '17': true},
    const {'1': 'feed_item', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'feedItem', '17': true},
    const {'1': 'feed_update_record', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'feedUpdateRecord', '17': true},
  ],
  '8': const [
    const {'1': '_feed'},
    const {'1': '_feed_group'},
    const {'1': '_feed_item'},
    const {'1': '_feed_update_record'},
  ],
};

/// Descriptor for `SyncTimestamp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncTimestampDescriptor = $convert.base64Decode('Cg1TeW5jVGltZXN0YW1wEhcKBGZlZWQYASABKANIAFIEZmVlZIgBARIiCgpmZWVkX2dyb3VwGAIgASgDSAFSCWZlZWRHcm91cIgBARIgCglmZWVkX2l0ZW0YAyABKANIAlIIZmVlZEl0ZW2IAQESMQoSZmVlZF91cGRhdGVfcmVjb3JkGAQgASgDSANSEGZlZWRVcGRhdGVSZWNvcmSIAQFCBwoFX2ZlZWRCDQoLX2ZlZWRfZ3JvdXBCDAoKX2ZlZWRfaXRlbUIVChNfZmVlZF91cGRhdGVfcmVjb3Jk');
