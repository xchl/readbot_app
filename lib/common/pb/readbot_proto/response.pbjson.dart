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
@$core.Deprecated('Use readStageDescriptor instead')
const ReadStage$json = const {
  '1': 'ReadStage',
  '2': const [
    const {'1': 'READ_STAGE_EXPLORE', '2': 0},
    const {'1': 'READ_STAGE_FOCUS', '2': 1},
    const {'1': 'READ_STAGE_SEEN', '2': 2},
    const {'1': 'READ_STAGE_ARCHIVED', '2': 3},
  ],
};

/// Descriptor for `ReadStage`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List readStageDescriptor = $convert.base64Decode('CglSZWFkU3RhZ2USFgoSUkVBRF9TVEFHRV9FWFBMT1JFEAASFAoQUkVBRF9TVEFHRV9GT0NVUxABEhMKD1JFQURfU1RBR0VfU0VFThACEhcKE1JFQURfU1RBR0VfQVJDSElWRUQQAw==');
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
@$core.Deprecated('Use feedProfileDescriptor instead')
const FeedProfile$json = const {
  '1': 'FeedProfile',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'icon', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'icon', '17': true},
    const {'1': 'logo', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'logo', '17': true},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'description', '17': true},
    const {'1': 'category_algo', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'categoryAlgo', '17': true},
    const {'1': 'tags_algo', '3': 8, '4': 1, '5': 9, '9': 5, '10': 'tagsAlgo', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_icon'},
    const {'1': '_logo'},
    const {'1': '_description'},
    const {'1': '_category_algo'},
    const {'1': '_tags_algo'},
  ],
};

/// Descriptor for `FeedProfile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedProfileDescriptor = $convert.base64Decode('CgtGZWVkUHJvZmlsZRIOCgJpZBgBIAEoBVICaWQSEAoDdXJsGAIgASgJUgN1cmwSFwoEbmFtZRgDIAEoCUgAUgRuYW1liAEBEhcKBGljb24YBCABKAlIAVIEaWNvbogBARIXCgRsb2dvGAUgASgJSAJSBGxvZ2+IAQESJQoLZGVzY3JpcHRpb24YBiABKAlIA1ILZGVzY3JpcHRpb26IAQESKAoNY2F0ZWdvcnlfYWxnbxgHIAEoCUgEUgxjYXRlZ29yeUFsZ2+IAQESIAoJdGFnc19hbGdvGAggASgJSAVSCHRhZ3NBbGdviAEBQgcKBV9uYW1lQgcKBV9pY29uQgcKBV9sb2dvQg4KDF9kZXNjcmlwdGlvbkIQCg5fY2F0ZWdvcnlfYWxnb0IMCgpfdGFnc19hbGdv');
@$core.Deprecated('Use userFeedDescriptor instead')
const UserFeed$json = const {
  '1': 'UserFeed',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'feed_id', '3': 3, '4': 1, '5': 5, '10': 'feedId'},
    const {'1': 'name', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'logo', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'logo', '17': true},
    const {'1': 'description', '3': 6, '4': 1, '5': 9, '9': 2, '10': 'description', '17': true},
    const {'1': 'folder', '3': 7, '4': 1, '5': 9, '9': 3, '10': 'folder', '17': true},
    const {'1': 'tags', '3': 8, '4': 1, '5': 9, '9': 4, '10': 'tags', '17': true},
    const {'1': 'created_time', '3': 9, '4': 1, '5': 3, '10': 'createdTime'},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_logo'},
    const {'1': '_description'},
    const {'1': '_folder'},
    const {'1': '_tags'},
  ],
};

/// Descriptor for `UserFeed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userFeedDescriptor = $convert.base64Decode('CghVc2VyRmVlZBIOCgJpZBgBIAEoBVICaWQSFwoHdXNlcl9pZBgCIAEoBVIGdXNlcklkEhcKB2ZlZWRfaWQYAyABKAVSBmZlZWRJZBIXCgRuYW1lGAQgASgJSABSBG5hbWWIAQESFwoEbG9nbxgFIAEoCUgBUgRsb2dviAEBEiUKC2Rlc2NyaXB0aW9uGAYgASgJSAJSC2Rlc2NyaXB0aW9uiAEBEhsKBmZvbGRlchgHIAEoCUgDUgZmb2xkZXKIAQESFwoEdGFncxgIIAEoCUgEUgR0YWdziAEBEiEKDGNyZWF0ZWRfdGltZRgJIAEoA1ILY3JlYXRlZFRpbWVCBwoFX25hbWVCBwoFX2xvZ29CDgoMX2Rlc2NyaXB0aW9uQgkKB19mb2xkZXJCBwoFX3RhZ3M=');
@$core.Deprecated('Use userContentDescriptor instead')
const UserContent$json = const {
  '1': 'UserContent',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'user_id', '3': 2, '4': 1, '5': 5, '10': 'userId'},
    const {'1': 'content_id', '3': 3, '4': 1, '5': 5, '10': 'contentId'},
    const {'1': 'stage', '3': 4, '4': 1, '5': 14, '6': '.response.ReadStage', '10': 'stage'},
    const {'1': 'tags', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'tags', '17': true},
    const {'1': 'category', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'category', '17': true},
    const {'1': 'notes', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
  ],
  '8': const [
    const {'1': '_tags'},
    const {'1': '_category'},
    const {'1': '_notes'},
  ],
};

/// Descriptor for `UserContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userContentDescriptor = $convert.base64Decode('CgtVc2VyQ29udGVudBIOCgJpZBgBIAEoBVICaWQSFwoHdXNlcl9pZBgCIAEoBVIGdXNlcklkEh0KCmNvbnRlbnRfaWQYAyABKAVSCWNvbnRlbnRJZBIpCgVzdGFnZRgEIAEoDjITLnJlc3BvbnNlLlJlYWRTdGFnZVIFc3RhZ2USFwoEdGFncxgFIAEoCUgAUgR0YWdziAEBEh8KCGNhdGVnb3J5GAYgASgJSAFSCGNhdGVnb3J5iAEBEhkKBW5vdGVzGAcgASgJSAJSBW5vdGVziAEBQgcKBV90YWdzQgsKCV9jYXRlZ29yeUIICgZfbm90ZXM=');
@$core.Deprecated('Use contentDescriptor instead')
const Content$json = const {
  '1': 'Content',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'feed_id', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'feedId', '17': true},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'cover', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'cover', '17': true},
    const {'1': 'publish_time', '3': 5, '4': 1, '5': 3, '9': 2, '10': 'publishTime', '17': true},
    const {'1': 'authors', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'authors', '17': true},
    const {'1': 'link', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'link', '17': true},
    const {'1': 'content', '3': 8, '4': 1, '5': 9, '9': 5, '10': 'content', '17': true},
    const {'1': 'summary', '3': 9, '4': 1, '5': 9, '9': 6, '10': 'summary', '17': true},
    const {'1': 'summary_algo', '3': 10, '4': 1, '5': 9, '9': 7, '10': 'summaryAlgo', '17': true},
    const {'1': 'category_algo', '3': 11, '4': 1, '5': 9, '9': 8, '10': 'categoryAlgo', '17': true},
    const {'1': 'tags_algo', '3': 12, '4': 1, '5': 9, '9': 9, '10': 'tagsAlgo', '17': true},
    const {'1': 'create_time', '3': 13, '4': 1, '5': 3, '10': 'createTime'},
    const {'1': 'md5', '3': 14, '4': 1, '5': 9, '10': 'md5'},
  ],
  '8': const [
    const {'1': '_feed_id'},
    const {'1': '_cover'},
    const {'1': '_publish_time'},
    const {'1': '_authors'},
    const {'1': '_link'},
    const {'1': '_content'},
    const {'1': '_summary'},
    const {'1': '_summary_algo'},
    const {'1': '_category_algo'},
    const {'1': '_tags_algo'},
  ],
};

/// Descriptor for `Content`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contentDescriptor = $convert.base64Decode('CgdDb250ZW50Eg4KAmlkGAEgASgFUgJpZBIcCgdmZWVkX2lkGAIgASgFSABSBmZlZWRJZIgBARIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSGQoFY292ZXIYBCABKAlIAVIFY292ZXKIAQESJgoMcHVibGlzaF90aW1lGAUgASgDSAJSC3B1Ymxpc2hUaW1liAEBEh0KB2F1dGhvcnMYBiABKAlIA1IHYXV0aG9yc4gBARIXCgRsaW5rGAcgASgJSARSBGxpbmuIAQESHQoHY29udGVudBgIIAEoCUgFUgdjb250ZW50iAEBEh0KB3N1bW1hcnkYCSABKAlIBlIHc3VtbWFyeYgBARImCgxzdW1tYXJ5X2FsZ28YCiABKAlIB1ILc3VtbWFyeUFsZ2+IAQESKAoNY2F0ZWdvcnlfYWxnbxgLIAEoCUgIUgxjYXRlZ29yeUFsZ2+IAQESIAoJdGFnc19hbGdvGAwgASgJSAlSCHRhZ3NBbGdviAEBEh8KC2NyZWF0ZV90aW1lGA0gASgDUgpjcmVhdGVUaW1lEhAKA21kNRgOIAEoCVIDbWQ1QgoKCF9mZWVkX2lkQggKBl9jb3ZlckIPCg1fcHVibGlzaF90aW1lQgoKCF9hdXRob3JzQgcKBV9saW5rQgoKCF9jb250ZW50QgoKCF9zdW1tYXJ5Qg8KDV9zdW1tYXJ5X2FsZ29CEAoOX2NhdGVnb3J5X2FsZ29CDAoKX3RhZ3NfYWxnbw==');
@$core.Deprecated('Use feedContentDescriptor instead')
const FeedContent$json = const {
  '1': 'FeedContent',
  '2': const [
    const {'1': 'feed_profile', '3': 1, '4': 1, '5': 11, '6': '.response.FeedProfile', '10': 'feedProfile'},
    const {'1': 'contents', '3': 2, '4': 3, '5': 11, '6': '.response.Content', '10': 'contents'},
  ],
};

/// Descriptor for `FeedContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedContentDescriptor = $convert.base64Decode('CgtGZWVkQ29udGVudBI4CgxmZWVkX3Byb2ZpbGUYASABKAsyFS5yZXNwb25zZS5GZWVkUHJvZmlsZVILZmVlZFByb2ZpbGUSLQoIY29udGVudHMYAiADKAsyES5yZXNwb25zZS5Db250ZW50Ughjb250ZW50cw==');
@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = const {
  '1': 'AuthResponse',
  '2': const [
    const {'1': 'tokens', '3': 1, '4': 1, '5': 11, '6': '.response.Tokens', '10': 'tokens'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode('CgxBdXRoUmVzcG9uc2USKAoGdG9rZW5zGAEgASgLMhAucmVzcG9uc2UuVG9rZW5zUgZ0b2tlbnM=');
@$core.Deprecated('Use createFeedResponseDescriptor instead')
const CreateFeedResponse$json = const {
  '1': 'CreateFeedResponse',
  '2': const [
    const {'1': 'user_feed', '3': 1, '4': 1, '5': 11, '6': '.response.UserFeed', '10': 'userFeed'},
    const {'1': 'feed_profile', '3': 2, '4': 1, '5': 11, '6': '.response.FeedProfile', '10': 'feedProfile'},
    const {'1': 'user_content', '3': 3, '4': 3, '5': 11, '6': '.response.UserContent', '10': 'userContent'},
    const {'1': 'content', '3': 4, '4': 3, '5': 11, '6': '.response.Content', '10': 'content'},
  ],
};

/// Descriptor for `CreateFeedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFeedResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVGZWVkUmVzcG9uc2USLwoJdXNlcl9mZWVkGAEgASgLMhIucmVzcG9uc2UuVXNlckZlZWRSCHVzZXJGZWVkEjgKDGZlZWRfcHJvZmlsZRgCIAEoCzIVLnJlc3BvbnNlLkZlZWRQcm9maWxlUgtmZWVkUHJvZmlsZRI4Cgx1c2VyX2NvbnRlbnQYAyADKAsyFS5yZXNwb25zZS5Vc2VyQ29udGVudFILdXNlckNvbnRlbnQSKwoHY29udGVudBgEIAMoCzIRLnJlc3BvbnNlLkNvbnRlbnRSB2NvbnRlbnQ=');
@$core.Deprecated('Use fecthFeedResponseDescriptor instead')
const FecthFeedResponse$json = const {
  '1': 'FecthFeedResponse',
  '2': const [
    const {'1': 'user_feeds', '3': 1, '4': 3, '5': 11, '6': '.response.UserFeed', '10': 'userFeeds'},
    const {'1': 'feed_profiles', '3': 2, '4': 3, '5': 11, '6': '.response.FeedProfile', '10': 'feedProfiles'},
  ],
};

/// Descriptor for `FecthFeedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fecthFeedResponseDescriptor = $convert.base64Decode('ChFGZWN0aEZlZWRSZXNwb25zZRIxCgp1c2VyX2ZlZWRzGAEgAygLMhIucmVzcG9uc2UuVXNlckZlZWRSCXVzZXJGZWVkcxI6Cg1mZWVkX3Byb2ZpbGVzGAIgAygLMhUucmVzcG9uc2UuRmVlZFByb2ZpbGVSDGZlZWRQcm9maWxlcw==');
@$core.Deprecated('Use fetchContentResponseDescriptor instead')
const FetchContentResponse$json = const {
  '1': 'FetchContentResponse',
  '2': const [
    const {'1': 'user_contents', '3': 1, '4': 3, '5': 11, '6': '.response.UserContent', '10': 'userContents'},
    const {'1': 'contents', '3': 2, '4': 3, '5': 11, '6': '.response.Content', '10': 'contents'},
  ],
};

/// Descriptor for `FetchContentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchContentResponseDescriptor = $convert.base64Decode('ChRGZXRjaENvbnRlbnRSZXNwb25zZRI6Cg11c2VyX2NvbnRlbnRzGAEgAygLMhUucmVzcG9uc2UuVXNlckNvbnRlbnRSDHVzZXJDb250ZW50cxItCghjb250ZW50cxgCIAMoCzIRLnJlc3BvbnNlLkNvbnRlbnRSCGNvbnRlbnRz');
