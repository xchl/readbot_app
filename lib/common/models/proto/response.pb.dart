///
//  Generated code. Do not modify.
//  source: response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'model.pb.dart' as $0;

class AuthResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AuthResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'response'), createEmptyInstance: create)
    ..aOM<$0.Tokens>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tokens', subBuilder: $0.Tokens.create)
    ..hasRequiredFields = false
  ;

  AuthResponse._() : super();
  factory AuthResponse({
    $0.Tokens? tokens,
  }) {
    final _result = create();
    if (tokens != null) {
      _result.tokens = tokens;
    }
    return _result;
  }
  factory AuthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthResponse clone() => AuthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthResponse copyWith(void Function(AuthResponse) updates) => super.copyWith((message) => updates(message as AuthResponse)) as AuthResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthResponse create() => AuthResponse._();
  AuthResponse createEmptyInstance() => create();
  static $pb.PbList<AuthResponse> createRepeated() => $pb.PbList<AuthResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthResponse>(create);
  static AuthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Tokens get tokens => $_getN(0);
  @$pb.TagNumber(1)
  set tokens($0.Tokens v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTokens() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokens() => clearField(1);
  @$pb.TagNumber(1)
  $0.Tokens ensureTokens() => $_ensure(0);
}

class ContentPullResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContentPullResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'response'), createEmptyInstance: create)
    ..aOM<$0.SyncTimestamp>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'syncTimestamp', subBuilder: $0.SyncTimestamp.create)
    ..pc<$0.Feed>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feeds', $pb.PbFieldType.PM, subBuilder: $0.Feed.create)
    ..pc<$0.FeedUpdateRecord>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedUpdateRecords', $pb.PbFieldType.PM, subBuilder: $0.FeedUpdateRecord.create)
    ..pc<$0.FeedGroup>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedGroups', $pb.PbFieldType.PM, subBuilder: $0.FeedGroup.create)
    ..pc<$0.FeedItem>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedItems', $pb.PbFieldType.PM, subBuilder: $0.FeedItem.create)
    ..hasRequiredFields = false
  ;

  ContentPullResponse._() : super();
  factory ContentPullResponse({
    $0.SyncTimestamp? syncTimestamp,
    $core.Iterable<$0.Feed>? feeds,
    $core.Iterable<$0.FeedUpdateRecord>? feedUpdateRecords,
    $core.Iterable<$0.FeedGroup>? feedGroups,
    $core.Iterable<$0.FeedItem>? feedItems,
  }) {
    final _result = create();
    if (syncTimestamp != null) {
      _result.syncTimestamp = syncTimestamp;
    }
    if (feeds != null) {
      _result.feeds.addAll(feeds);
    }
    if (feedUpdateRecords != null) {
      _result.feedUpdateRecords.addAll(feedUpdateRecords);
    }
    if (feedGroups != null) {
      _result.feedGroups.addAll(feedGroups);
    }
    if (feedItems != null) {
      _result.feedItems.addAll(feedItems);
    }
    return _result;
  }
  factory ContentPullResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContentPullResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContentPullResponse clone() => ContentPullResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContentPullResponse copyWith(void Function(ContentPullResponse) updates) => super.copyWith((message) => updates(message as ContentPullResponse)) as ContentPullResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContentPullResponse create() => ContentPullResponse._();
  ContentPullResponse createEmptyInstance() => create();
  static $pb.PbList<ContentPullResponse> createRepeated() => $pb.PbList<ContentPullResponse>();
  @$core.pragma('dart2js:noInline')
  static ContentPullResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContentPullResponse>(create);
  static ContentPullResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $0.SyncTimestamp get syncTimestamp => $_getN(0);
  @$pb.TagNumber(1)
  set syncTimestamp($0.SyncTimestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSyncTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearSyncTimestamp() => clearField(1);
  @$pb.TagNumber(1)
  $0.SyncTimestamp ensureSyncTimestamp() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$0.Feed> get feeds => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$0.FeedUpdateRecord> get feedUpdateRecords => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$0.FeedGroup> get feedGroups => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$0.FeedItem> get feedItems => $_getList(4);
}

class ContentPushResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContentPushResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'response'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  ContentPushResponse._() : super();
  factory ContentPushResponse({
    $core.String? message,
  }) {
    final _result = create();
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory ContentPushResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContentPushResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContentPushResponse clone() => ContentPushResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContentPushResponse copyWith(void Function(ContentPushResponse) updates) => super.copyWith((message) => updates(message as ContentPushResponse)) as ContentPushResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContentPushResponse create() => ContentPushResponse._();
  ContentPushResponse createEmptyInstance() => create();
  static $pb.PbList<ContentPushResponse> createRepeated() => $pb.PbList<ContentPushResponse>();
  @$core.pragma('dart2js:noInline')
  static ContentPushResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContentPushResponse>(create);
  static ContentPushResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

