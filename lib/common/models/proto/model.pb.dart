///
//  Generated code. Do not modify.
//  source: model.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'model.pbenum.dart';

export 'model.pbenum.dart';

class UserProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserProfile', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'username')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..e<ProLevel>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proLevel', $pb.PbFieldType.OE, defaultOrMaker: ProLevel.PRO_LEVEL_NORMAL, valueOf: ProLevel.valueOf, enumValues: ProLevel.values)
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proEndTime')
    ..hasRequiredFields = false
  ;

  UserProfile._() : super();
  factory UserProfile({
    $core.int? id,
    $core.String? username,
    $core.String? email,
    ProLevel? proLevel,
    $fixnum.Int64? proEndTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (username != null) {
      _result.username = username;
    }
    if (email != null) {
      _result.email = email;
    }
    if (proLevel != null) {
      _result.proLevel = proLevel;
    }
    if (proEndTime != null) {
      _result.proEndTime = proEndTime;
    }
    return _result;
  }
  factory UserProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserProfile clone() => UserProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserProfile copyWith(void Function(UserProfile) updates) => super.copyWith((message) => updates(message as UserProfile)) as UserProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserProfile create() => UserProfile._();
  UserProfile createEmptyInstance() => create();
  static $pb.PbList<UserProfile> createRepeated() => $pb.PbList<UserProfile>();
  @$core.pragma('dart2js:noInline')
  static UserProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserProfile>(create);
  static UserProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  ProLevel get proLevel => $_getN(3);
  @$pb.TagNumber(4)
  set proLevel(ProLevel v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasProLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearProLevel() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get proEndTime => $_getI64(4);
  @$pb.TagNumber(5)
  set proEndTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearProEndTime() => clearField(5);
}

class Tokens extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Tokens', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'accessToken')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'refreshToken')
    ..hasRequiredFields = false
  ;

  Tokens._() : super();
  factory Tokens({
    $core.String? accessToken,
    $core.String? refreshToken,
  }) {
    final _result = create();
    if (accessToken != null) {
      _result.accessToken = accessToken;
    }
    if (refreshToken != null) {
      _result.refreshToken = refreshToken;
    }
    return _result;
  }
  factory Tokens.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tokens.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Tokens clone() => Tokens()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Tokens copyWith(void Function(Tokens) updates) => super.copyWith((message) => updates(message as Tokens)) as Tokens; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tokens create() => Tokens._();
  Tokens createEmptyInstance() => create();
  static $pb.PbList<Tokens> createRepeated() => $pb.PbList<Tokens>();
  @$core.pragma('dart2js:noInline')
  static Tokens getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tokens>(create);
  static Tokens? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
}

class FeedGroup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FeedGroup', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime')
    ..hasRequiredFields = false
  ;

  FeedGroup._() : super();
  factory FeedGroup({
    $core.int? id,
    $core.String? name,
    $core.String? description,
    $fixnum.Int64? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (description != null) {
      _result.description = description;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory FeedGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedGroup clone() => FeedGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedGroup copyWith(void Function(FeedGroup) updates) => super.copyWith((message) => updates(message as FeedGroup)) as FeedGroup; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeedGroup create() => FeedGroup._();
  FeedGroup createEmptyInstance() => create();
  static $pb.PbList<FeedGroup> createRepeated() => $pb.PbList<FeedGroup>();
  @$core.pragma('dart2js:noInline')
  static FeedGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedGroup>(create);
  static FeedGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get updateTime => $_getI64(3);
  @$pb.TagNumber(4)
  set updateTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpdateTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdateTime() => clearField(4);
}

class FeedItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FeedItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isFocus')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isSeen')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cover')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'link')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'publishTime')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authors')
    ..pPS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags')
    ..aOS(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'category')
    ..aOS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'summaryAlgo')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content')
    ..aOB(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'contentHaveParsed')
    ..aInt64(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'md5String')
    ..a<$core.int>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedId', $pb.PbFieldType.O3)
    ..aInt64(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime')
    ..hasRequiredFields = false
  ;

  FeedItem._() : super();
  factory FeedItem({
    $core.int? id,
    $core.bool? isFocus,
    $core.bool? isSeen,
    $core.String? title,
    $core.String? cover,
    $core.String? link,
    $fixnum.Int64? publishTime,
    $core.String? authors,
    $core.Iterable<$core.String>? tags,
    $core.String? category,
    $core.String? description,
    $core.String? summaryAlgo,
    $core.String? content,
    $core.bool? contentHaveParsed,
    $fixnum.Int64? createTime,
    $core.String? md5String,
    $core.int? feedId,
    $fixnum.Int64? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (isFocus != null) {
      _result.isFocus = isFocus;
    }
    if (isSeen != null) {
      _result.isSeen = isSeen;
    }
    if (title != null) {
      _result.title = title;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (link != null) {
      _result.link = link;
    }
    if (publishTime != null) {
      _result.publishTime = publishTime;
    }
    if (authors != null) {
      _result.authors = authors;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (category != null) {
      _result.category = category;
    }
    if (description != null) {
      _result.description = description;
    }
    if (summaryAlgo != null) {
      _result.summaryAlgo = summaryAlgo;
    }
    if (content != null) {
      _result.content = content;
    }
    if (contentHaveParsed != null) {
      _result.contentHaveParsed = contentHaveParsed;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (md5String != null) {
      _result.md5String = md5String;
    }
    if (feedId != null) {
      _result.feedId = feedId;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory FeedItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedItem clone() => FeedItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedItem copyWith(void Function(FeedItem) updates) => super.copyWith((message) => updates(message as FeedItem)) as FeedItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeedItem create() => FeedItem._();
  FeedItem createEmptyInstance() => create();
  static $pb.PbList<FeedItem> createRepeated() => $pb.PbList<FeedItem>();
  @$core.pragma('dart2js:noInline')
  static FeedItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedItem>(create);
  static FeedItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isFocus => $_getBF(1);
  @$pb.TagNumber(2)
  set isFocus($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsFocus() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsFocus() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isSeen => $_getBF(2);
  @$pb.TagNumber(3)
  set isSeen($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsSeen() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsSeen() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get title => $_getSZ(3);
  @$pb.TagNumber(4)
  set title($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTitle() => $_has(3);
  @$pb.TagNumber(4)
  void clearTitle() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cover => $_getSZ(4);
  @$pb.TagNumber(5)
  set cover($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCover() => $_has(4);
  @$pb.TagNumber(5)
  void clearCover() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get link => $_getSZ(5);
  @$pb.TagNumber(6)
  set link($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLink() => $_has(5);
  @$pb.TagNumber(6)
  void clearLink() => clearField(6);

  @$pb.TagNumber(9)
  $fixnum.Int64 get publishTime => $_getI64(6);
  @$pb.TagNumber(9)
  set publishTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(9)
  $core.bool hasPublishTime() => $_has(6);
  @$pb.TagNumber(9)
  void clearPublishTime() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get authors => $_getSZ(7);
  @$pb.TagNumber(10)
  set authors($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(10)
  $core.bool hasAuthors() => $_has(7);
  @$pb.TagNumber(10)
  void clearAuthors() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(12)
  $core.String get category => $_getSZ(9);
  @$pb.TagNumber(12)
  set category($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(12)
  $core.bool hasCategory() => $_has(9);
  @$pb.TagNumber(12)
  void clearCategory() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(13)
  set description($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(13)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(13)
  void clearDescription() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get summaryAlgo => $_getSZ(11);
  @$pb.TagNumber(14)
  set summaryAlgo($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(14)
  $core.bool hasSummaryAlgo() => $_has(11);
  @$pb.TagNumber(14)
  void clearSummaryAlgo() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get content => $_getSZ(12);
  @$pb.TagNumber(15)
  set content($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(15)
  $core.bool hasContent() => $_has(12);
  @$pb.TagNumber(15)
  void clearContent() => clearField(15);

  @$pb.TagNumber(16)
  $core.bool get contentHaveParsed => $_getBF(13);
  @$pb.TagNumber(16)
  set contentHaveParsed($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(16)
  $core.bool hasContentHaveParsed() => $_has(13);
  @$pb.TagNumber(16)
  void clearContentHaveParsed() => clearField(16);

  @$pb.TagNumber(17)
  $fixnum.Int64 get createTime => $_getI64(14);
  @$pb.TagNumber(17)
  set createTime($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(17)
  $core.bool hasCreateTime() => $_has(14);
  @$pb.TagNumber(17)
  void clearCreateTime() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get md5String => $_getSZ(15);
  @$pb.TagNumber(18)
  set md5String($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(18)
  $core.bool hasMd5String() => $_has(15);
  @$pb.TagNumber(18)
  void clearMd5String() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get feedId => $_getIZ(16);
  @$pb.TagNumber(19)
  set feedId($core.int v) { $_setSignedInt32(16, v); }
  @$pb.TagNumber(19)
  $core.bool hasFeedId() => $_has(16);
  @$pb.TagNumber(19)
  void clearFeedId() => clearField(19);

  @$pb.TagNumber(20)
  $fixnum.Int64 get updateTime => $_getI64(17);
  @$pb.TagNumber(20)
  set updateTime($fixnum.Int64 v) { $_setInt64(17, v); }
  @$pb.TagNumber(20)
  $core.bool hasUpdateTime() => $_has(17);
  @$pb.TagNumber(20)
  void clearUpdateTime() => clearField(20);
}

class FeedUpdateRecord extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FeedUpdateRecord', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedId', $pb.PbFieldType.O3)
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastUpdate')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastContentHash')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastItemPublishTime')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime')
    ..hasRequiredFields = false
  ;

  FeedUpdateRecord._() : super();
  factory FeedUpdateRecord({
    $core.int? id,
    $core.int? feedId,
    $fixnum.Int64? lastUpdate,
    $core.String? lastContentHash,
    $fixnum.Int64? lastItemPublishTime,
    $fixnum.Int64? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (feedId != null) {
      _result.feedId = feedId;
    }
    if (lastUpdate != null) {
      _result.lastUpdate = lastUpdate;
    }
    if (lastContentHash != null) {
      _result.lastContentHash = lastContentHash;
    }
    if (lastItemPublishTime != null) {
      _result.lastItemPublishTime = lastItemPublishTime;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory FeedUpdateRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FeedUpdateRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FeedUpdateRecord clone() => FeedUpdateRecord()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FeedUpdateRecord copyWith(void Function(FeedUpdateRecord) updates) => super.copyWith((message) => updates(message as FeedUpdateRecord)) as FeedUpdateRecord; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeedUpdateRecord create() => FeedUpdateRecord._();
  FeedUpdateRecord createEmptyInstance() => create();
  static $pb.PbList<FeedUpdateRecord> createRepeated() => $pb.PbList<FeedUpdateRecord>();
  @$core.pragma('dart2js:noInline')
  static FeedUpdateRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedUpdateRecord>(create);
  static FeedUpdateRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get feedId => $_getIZ(1);
  @$pb.TagNumber(2)
  set feedId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFeedId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeedId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastUpdate => $_getI64(2);
  @$pb.TagNumber(3)
  set lastUpdate($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastUpdate() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastUpdate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastContentHash => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastContentHash($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastContentHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastContentHash() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get lastItemPublishTime => $_getI64(4);
  @$pb.TagNumber(5)
  set lastItemPublishTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLastItemPublishTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearLastItemPublishTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get updateTime => $_getI64(5);
  @$pb.TagNumber(6)
  set updateTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateTime() => clearField(6);
}

class Feed extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Feed', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'url')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'logo')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customLogo')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customDescription')
    ..a<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'groupId', $pb.PbFieldType.O3)
    ..pPS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tags')
    ..aInt64(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createTime')
    ..e<FeedType>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedType', $pb.PbFieldType.OE, defaultOrMaker: FeedType.RSS, valueOf: FeedType.valueOf, enumValues: FeedType.values)
    ..aInt64(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updateTime')
    ..hasRequiredFields = false
  ;

  Feed._() : super();
  factory Feed({
    $core.int? id,
    $core.String? url,
    $core.String? name,
    $core.String? customName,
    $core.String? logo,
    $core.String? customLogo,
    $core.String? description,
    $core.String? customDescription,
    $core.int? groupId,
    $core.Iterable<$core.String>? tags,
    $fixnum.Int64? createTime,
    FeedType? feedType,
    $fixnum.Int64? updateTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (url != null) {
      _result.url = url;
    }
    if (name != null) {
      _result.name = name;
    }
    if (customName != null) {
      _result.customName = customName;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (customLogo != null) {
      _result.customLogo = customLogo;
    }
    if (description != null) {
      _result.description = description;
    }
    if (customDescription != null) {
      _result.customDescription = customDescription;
    }
    if (groupId != null) {
      _result.groupId = groupId;
    }
    if (tags != null) {
      _result.tags.addAll(tags);
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (feedType != null) {
      _result.feedType = feedType;
    }
    if (updateTime != null) {
      _result.updateTime = updateTime;
    }
    return _result;
  }
  factory Feed.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Feed.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Feed clone() => Feed()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Feed copyWith(void Function(Feed) updates) => super.copyWith((message) => updates(message as Feed)) as Feed; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Feed create() => Feed._();
  Feed createEmptyInstance() => create();
  static $pb.PbList<Feed> createRepeated() => $pb.PbList<Feed>();
  @$core.pragma('dart2js:noInline')
  static Feed getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Feed>(create);
  static Feed? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get customName => $_getSZ(3);
  @$pb.TagNumber(4)
  set customName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustomName() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get logo => $_getSZ(4);
  @$pb.TagNumber(5)
  set logo($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLogo() => $_has(4);
  @$pb.TagNumber(5)
  void clearLogo() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get customLogo => $_getSZ(5);
  @$pb.TagNumber(6)
  set customLogo($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCustomLogo() => $_has(5);
  @$pb.TagNumber(6)
  void clearCustomLogo() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get customDescription => $_getSZ(7);
  @$pb.TagNumber(8)
  set customDescription($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCustomDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearCustomDescription() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get groupId => $_getIZ(8);
  @$pb.TagNumber(9)
  set groupId($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasGroupId() => $_has(8);
  @$pb.TagNumber(9)
  void clearGroupId() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get tags => $_getList(9);

  @$pb.TagNumber(11)
  $fixnum.Int64 get createTime => $_getI64(10);
  @$pb.TagNumber(11)
  set createTime($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCreateTime() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreateTime() => clearField(11);

  @$pb.TagNumber(12)
  FeedType get feedType => $_getN(11);
  @$pb.TagNumber(12)
  set feedType(FeedType v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasFeedType() => $_has(11);
  @$pb.TagNumber(12)
  void clearFeedType() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get updateTime => $_getI64(12);
  @$pb.TagNumber(13)
  set updateTime($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasUpdateTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearUpdateTime() => clearField(13);
}

class SyncTimestamp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SyncTimestamp', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'model'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feed')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedGroup')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedItem')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'feedUpdateRecord')
    ..hasRequiredFields = false
  ;

  SyncTimestamp._() : super();
  factory SyncTimestamp({
    $fixnum.Int64? feed,
    $fixnum.Int64? feedGroup,
    $fixnum.Int64? feedItem,
    $fixnum.Int64? feedUpdateRecord,
  }) {
    final _result = create();
    if (feed != null) {
      _result.feed = feed;
    }
    if (feedGroup != null) {
      _result.feedGroup = feedGroup;
    }
    if (feedItem != null) {
      _result.feedItem = feedItem;
    }
    if (feedUpdateRecord != null) {
      _result.feedUpdateRecord = feedUpdateRecord;
    }
    return _result;
  }
  factory SyncTimestamp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncTimestamp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncTimestamp clone() => SyncTimestamp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncTimestamp copyWith(void Function(SyncTimestamp) updates) => super.copyWith((message) => updates(message as SyncTimestamp)) as SyncTimestamp; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SyncTimestamp create() => SyncTimestamp._();
  SyncTimestamp createEmptyInstance() => create();
  static $pb.PbList<SyncTimestamp> createRepeated() => $pb.PbList<SyncTimestamp>();
  @$core.pragma('dart2js:noInline')
  static SyncTimestamp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncTimestamp>(create);
  static SyncTimestamp? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get feed => $_getI64(0);
  @$pb.TagNumber(1)
  set feed($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFeed() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeed() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get feedGroup => $_getI64(1);
  @$pb.TagNumber(2)
  set feedGroup($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFeedGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeedGroup() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get feedItem => $_getI64(2);
  @$pb.TagNumber(3)
  set feedItem($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFeedItem() => $_has(2);
  @$pb.TagNumber(3)
  void clearFeedItem() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get feedUpdateRecord => $_getI64(3);
  @$pb.TagNumber(4)
  set feedUpdateRecord($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFeedUpdateRecord() => $_has(3);
  @$pb.TagNumber(4)
  void clearFeedUpdateRecord() => clearField(4);
}

