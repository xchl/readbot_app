///
//  Generated code. Do not modify.
//  source: request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'model.pb.dart' as $0;

class RegisterInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'request'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  RegisterInfo._() : super();
  factory RegisterInfo({
    $core.String? username,
    $core.String? email,
    $core.String? password,
  }) {
    final _result = create();
    if (username != null) {
      _result.username = username;
    }
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory RegisterInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterInfo clone() => RegisterInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterInfo copyWith(void Function(RegisterInfo) updates) => super.copyWith((message) => updates(message as RegisterInfo)) as RegisterInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterInfo create() => RegisterInfo._();
  RegisterInfo createEmptyInstance() => create();
  static $pb.PbList<RegisterInfo> createRepeated() => $pb.PbList<RegisterInfo>();
  @$core.pragma('dart2js:noInline')
  static RegisterInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterInfo>(create);
  static RegisterInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get username => $_getSZ(0);
  @$pb.TagNumber(1)
  set username($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class LoginInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginInfo', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'request'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginInfo._() : super();
  factory LoginInfo({
    $core.String? email,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginInfo clone() => LoginInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginInfo copyWith(void Function(LoginInfo) updates) => super.copyWith((message) => updates(message as LoginInfo)) as LoginInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginInfo create() => LoginInfo._();
  LoginInfo createEmptyInstance() => create();
  static $pb.PbList<LoginInfo> createRepeated() => $pb.PbList<LoginInfo>();
  @$core.pragma('dart2js:noInline')
  static LoginInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginInfo>(create);
  static LoginInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'request'), createEmptyInstance: create)
    ..aOM<$0.ClientInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'client', subBuilder: $0.ClientInfo.create)
    ..aOM<LoginInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loginInfo', subBuilder: LoginInfo.create)
    ..hasRequiredFields = false
  ;

  LoginRequest._() : super();
  factory LoginRequest({
    $0.ClientInfo? client,
    LoginInfo? loginInfo,
  }) {
    final _result = create();
    if (client != null) {
      _result.client = client;
    }
    if (loginInfo != null) {
      _result.loginInfo = loginInfo;
    }
    return _result;
  }
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ClientInfo get client => $_getN(0);
  @$pb.TagNumber(1)
  set client($0.ClientInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  $0.ClientInfo ensureClient() => $_ensure(0);

  @$pb.TagNumber(2)
  LoginInfo get loginInfo => $_getN(1);
  @$pb.TagNumber(2)
  set loginInfo(LoginInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLoginInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoginInfo() => clearField(2);
  @$pb.TagNumber(2)
  LoginInfo ensureLoginInfo() => $_ensure(1);
}

class RegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'request'), createEmptyInstance: create)
    ..aOM<$0.ClientInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'client', subBuilder: $0.ClientInfo.create)
    ..aOM<RegisterInfo>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'registerInfo', subBuilder: RegisterInfo.create)
    ..hasRequiredFields = false
  ;

  RegisterRequest._() : super();
  factory RegisterRequest({
    $0.ClientInfo? client,
    RegisterInfo? registerInfo,
  }) {
    final _result = create();
    if (client != null) {
      _result.client = client;
    }
    if (registerInfo != null) {
      _result.registerInfo = registerInfo;
    }
    return _result;
  }
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest)) as RegisterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ClientInfo get client => $_getN(0);
  @$pb.TagNumber(1)
  set client($0.ClientInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  $0.ClientInfo ensureClient() => $_ensure(0);

  @$pb.TagNumber(2)
  RegisterInfo get registerInfo => $_getN(1);
  @$pb.TagNumber(2)
  set registerInfo(RegisterInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRegisterInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegisterInfo() => clearField(2);
  @$pb.TagNumber(2)
  RegisterInfo ensureRegisterInfo() => $_ensure(1);
}

class RefreshTokenRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RefreshTokenRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'request'), createEmptyInstance: create)
    ..aOM<$0.ClientInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'client', subBuilder: $0.ClientInfo.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  RefreshTokenRequest._() : super();
  factory RefreshTokenRequest({
    $0.ClientInfo? client,
    $core.String? refreshToken,
  }) {
    final _result = create();
    if (client != null) {
      _result.client = client;
    }
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    return _result;
  }
  factory RefreshTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RefreshTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest clone() => RefreshTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RefreshTokenRequest copyWith(void Function(RefreshTokenRequest) updates) => super.copyWith((message) => updates(message as RefreshTokenRequest)) as RefreshTokenRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest create() => RefreshTokenRequest._();
  RefreshTokenRequest createEmptyInstance() => create();
  static $pb.PbList<RefreshTokenRequest> createRepeated() => $pb.PbList<RefreshTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static RefreshTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RefreshTokenRequest>(create);
  static RefreshTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ClientInfo get client => $_getN(0);
  @$pb.TagNumber(1)
  set client($0.ClientInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  $0.ClientInfo ensureClient() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
}

class ContentPullRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContentPullRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'request'), createEmptyInstance: create)
    ..aOM<$0.ClientInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'client', subBuilder: $0.ClientInfo.create)
    ..aOM<$0.SyncTimestamp>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'syncTimestamp', subBuilder: $0.SyncTimestamp.create)
    ..hasRequiredFields = false
  ;

  ContentPullRequest._() : super();
  factory ContentPullRequest({
    $0.ClientInfo? client,
    $0.SyncTimestamp? syncTimestamp,
  }) {
    final _result = create();
    if (client != null) {
      _result.client = client;
    }
    if (syncTimestamp != null) {
      _result.syncTimestamp = syncTimestamp;
    }
    return _result;
  }
  factory ContentPullRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContentPullRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContentPullRequest clone() => ContentPullRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContentPullRequest copyWith(void Function(ContentPullRequest) updates) => super.copyWith((message) => updates(message as ContentPullRequest)) as ContentPullRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContentPullRequest create() => ContentPullRequest._();
  ContentPullRequest createEmptyInstance() => create();
  static $pb.PbList<ContentPullRequest> createRepeated() => $pb.PbList<ContentPullRequest>();
  @$core.pragma('dart2js:noInline')
  static ContentPullRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContentPullRequest>(create);
  static ContentPullRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $0.ClientInfo get client => $_getN(0);
  @$pb.TagNumber(1)
  set client($0.ClientInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClient() => $_has(0);
  @$pb.TagNumber(1)
  void clearClient() => clearField(1);
  @$pb.TagNumber(1)
  $0.ClientInfo ensureClient() => $_ensure(0);

  @$pb.TagNumber(2)
  $0.SyncTimestamp get syncTimestamp => $_getN(1);
  @$pb.TagNumber(2)
  set syncTimestamp($0.SyncTimestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSyncTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearSyncTimestamp() => clearField(2);
  @$pb.TagNumber(2)
  $0.SyncTimestamp ensureSyncTimestamp() => $_ensure(1);
}

class ContentPushRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ContentPushRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'request'), createEmptyInstance: create)
    ..pc<$0.Feed>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feeds', $pb.PbFieldType.PM, subBuilder: $0.Feed.create)
    ..pc<$0.FeedUpdateRecord>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedUpdateRecords', $pb.PbFieldType.PM, subBuilder: $0.FeedUpdateRecord.create)
    ..pc<$0.FeedGroup>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedGroups', $pb.PbFieldType.PM, subBuilder: $0.FeedGroup.create)
    ..pc<$0.FeedItem>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedItems', $pb.PbFieldType.PM, subBuilder: $0.FeedItem.create)
    ..aOM<$0.ClientInfo>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'client', subBuilder: $0.ClientInfo.create)
    ..hasRequiredFields = false
  ;

  ContentPushRequest._() : super();
  factory ContentPushRequest({
    $core.Iterable<$0.Feed>? feeds,
    $core.Iterable<$0.FeedUpdateRecord>? feedUpdateRecords,
    $core.Iterable<$0.FeedGroup>? feedGroups,
    $core.Iterable<$0.FeedItem>? feedItems,
    $0.ClientInfo? client,
  }) {
    final _result = create();
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
    if (client != null) {
      _result.client = client;
    }
    return _result;
  }
  factory ContentPushRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContentPushRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContentPushRequest clone() => ContentPushRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContentPushRequest copyWith(void Function(ContentPushRequest) updates) => super.copyWith((message) => updates(message as ContentPushRequest)) as ContentPushRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ContentPushRequest create() => ContentPushRequest._();
  ContentPushRequest createEmptyInstance() => create();
  static $pb.PbList<ContentPushRequest> createRepeated() => $pb.PbList<ContentPushRequest>();
  @$core.pragma('dart2js:noInline')
  static ContentPushRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContentPushRequest>(create);
  static ContentPushRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$0.Feed> get feeds => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$0.FeedUpdateRecord> get feedUpdateRecords => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$0.FeedGroup> get feedGroups => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$0.FeedItem> get feedItems => $_getList(3);

  @$pb.TagNumber(5)
  $0.ClientInfo get client => $_getN(4);
  @$pb.TagNumber(5)
  set client($0.ClientInfo v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasClient() => $_has(4);
  @$pb.TagNumber(5)
  void clearClient() => clearField(5);
  @$pb.TagNumber(5)
  $0.ClientInfo ensureClient() => $_ensure(4);
}

