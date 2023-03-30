///
//  Generated code. Do not modify.
//  source: readbot_proto/response.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'response.pbenum.dart';

export 'response.pbenum.dart';

class Tokens extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Tokens',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'accessToken')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'refreshToken')
    ..hasRequiredFields = false;

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
  factory Tokens.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Tokens.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Tokens clone() => Tokens()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Tokens copyWith(void Function(Tokens) updates) =>
      super.copyWith((message) => updates(message as Tokens))
          as Tokens; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tokens create() => Tokens._();
  Tokens createEmptyInstance() => create();
  static $pb.PbList<Tokens> createRepeated() => $pb.PbList<Tokens>();
  @$core.pragma('dart2js:noInline')
  static Tokens getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tokens>(create);
  static Tokens? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get refreshToken => $_getSZ(1);
  @$pb.TagNumber(2)
  set refreshToken($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRefreshToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefreshToken() => clearField(2);
}

class UserProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'username')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'email')
    ..e<ProLevel>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'proLevel',
        $pb.PbFieldType.OE,
        defaultOrMaker: ProLevel.PRO_LEVEL_FREE,
        valueOf: ProLevel.valueOf,
        enumValues: ProLevel.values)
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'proEndTime')
    ..hasRequiredFields = false;

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
  factory UserProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserProfile clone() => UserProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserProfile copyWith(void Function(UserProfile) updates) =>
      super.copyWith((message) => updates(message as UserProfile))
          as UserProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserProfile create() => UserProfile._();
  UserProfile createEmptyInstance() => create();
  static $pb.PbList<UserProfile> createRepeated() => $pb.PbList<UserProfile>();
  @$core.pragma('dart2js:noInline')
  static UserProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserProfile>(create);
  static UserProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get username => $_getSZ(1);
  @$pb.TagNumber(2)
  set username($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUsername() => $_has(1);
  @$pb.TagNumber(2)
  void clearUsername() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  ProLevel get proLevel => $_getN(3);
  @$pb.TagNumber(4)
  set proLevel(ProLevel v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasProLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearProLevel() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get proEndTime => $_getI64(4);
  @$pb.TagNumber(5)
  set proEndTime($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasProEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearProEndTime() => clearField(5);
}

class FeedProfile extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FeedProfile',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'url')
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'icon')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categoryAlgo')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagsAlgo')
    ..hasRequiredFields = false;

  FeedProfile._() : super();
  factory FeedProfile({
    $core.int? id,
    $core.String? url,
    $core.String? name,
    $core.String? icon,
    $core.String? logo,
    $core.String? description,
    $core.String? categoryAlgo,
    $core.String? tagsAlgo,
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
    if (icon != null) {
      _result.icon = icon;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (description != null) {
      _result.description = description;
    }
    if (categoryAlgo != null) {
      _result.categoryAlgo = categoryAlgo;
    }
    if (tagsAlgo != null) {
      _result.tagsAlgo = tagsAlgo;
    }
    return _result;
  }
  factory FeedProfile.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FeedProfile.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FeedProfile clone() => FeedProfile()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FeedProfile copyWith(void Function(FeedProfile) updates) =>
      super.copyWith((message) => updates(message as FeedProfile))
          as FeedProfile; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeedProfile create() => FeedProfile._();
  FeedProfile createEmptyInstance() => create();
  static $pb.PbList<FeedProfile> createRepeated() => $pb.PbList<FeedProfile>();
  @$core.pragma('dart2js:noInline')
  static FeedProfile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FeedProfile>(create);
  static FeedProfile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get logo => $_getSZ(4);
  @$pb.TagNumber(5)
  set logo($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLogo() => $_has(4);
  @$pb.TagNumber(5)
  void clearLogo() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get categoryAlgo => $_getSZ(6);
  @$pb.TagNumber(7)
  set categoryAlgo($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasCategoryAlgo() => $_has(6);
  @$pb.TagNumber(7)
  void clearCategoryAlgo() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get tagsAlgo => $_getSZ(7);
  @$pb.TagNumber(8)
  set tagsAlgo($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTagsAlgo() => $_has(7);
  @$pb.TagNumber(8)
  void clearTagsAlgo() => clearField(8);
}

class UserFeed extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserFeed',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'feedId',
        $pb.PbFieldType.O3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'logo')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'description')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'folder')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags')
    ..aInt64(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createdTime')
    ..hasRequiredFields = false;

  UserFeed._() : super();
  factory UserFeed({
    $core.int? id,
    $core.int? userId,
    $core.int? feedId,
    $core.String? name,
    $core.String? logo,
    $core.String? description,
    $core.String? folder,
    $core.String? tags,
    $fixnum.Int64? createdTime,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (feedId != null) {
      _result.feedId = feedId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (logo != null) {
      _result.logo = logo;
    }
    if (description != null) {
      _result.description = description;
    }
    if (folder != null) {
      _result.folder = folder;
    }
    if (tags != null) {
      _result.tags = tags;
    }
    if (createdTime != null) {
      _result.createdTime = createdTime;
    }
    return _result;
  }
  factory UserFeed.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserFeed.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserFeed clone() => UserFeed()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserFeed copyWith(void Function(UserFeed) updates) =>
      super.copyWith((message) => updates(message as UserFeed))
          as UserFeed; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserFeed create() => UserFeed._();
  UserFeed createEmptyInstance() => create();
  static $pb.PbList<UserFeed> createRepeated() => $pb.PbList<UserFeed>();
  @$core.pragma('dart2js:noInline')
  static UserFeed getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserFeed>(create);
  static UserFeed? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get feedId => $_getIZ(2);
  @$pb.TagNumber(3)
  set feedId($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasFeedId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFeedId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get name => $_getSZ(3);
  @$pb.TagNumber(4)
  set name($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasName() => $_has(3);
  @$pb.TagNumber(4)
  void clearName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get logo => $_getSZ(4);
  @$pb.TagNumber(5)
  set logo($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasLogo() => $_has(4);
  @$pb.TagNumber(5)
  void clearLogo() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get folder => $_getSZ(6);
  @$pb.TagNumber(7)
  set folder($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasFolder() => $_has(6);
  @$pb.TagNumber(7)
  void clearFolder() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get tags => $_getSZ(7);
  @$pb.TagNumber(8)
  set tags($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasTags() => $_has(7);
  @$pb.TagNumber(8)
  void clearTags() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get createdTime => $_getI64(8);
  @$pb.TagNumber(9)
  set createdTime($fixnum.Int64 v) {
    $_setInt64(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasCreatedTime() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedTime() => clearField(9);
}

class UserContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'UserContent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userId',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contentId',
        $pb.PbFieldType.O3)
    ..e<ReadStage>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'stage',
        $pb.PbFieldType.OE,
        defaultOrMaker: ReadStage.READ_STAGE_EXPLORE,
        valueOf: ReadStage.valueOf,
        enumValues: ReadStage.values)
    ..aOS(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tags')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'category')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'notes')
    ..hasRequiredFields = false;

  UserContent._() : super();
  factory UserContent({
    $core.int? id,
    $core.int? userId,
    $core.int? contentId,
    ReadStage? stage,
    $core.String? tags,
    $core.String? category,
    $core.String? notes,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (userId != null) {
      _result.userId = userId;
    }
    if (contentId != null) {
      _result.contentId = contentId;
    }
    if (stage != null) {
      _result.stage = stage;
    }
    if (tags != null) {
      _result.tags = tags;
    }
    if (category != null) {
      _result.category = category;
    }
    if (notes != null) {
      _result.notes = notes;
    }
    return _result;
  }
  factory UserContent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UserContent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UserContent clone() => UserContent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UserContent copyWith(void Function(UserContent) updates) =>
      super.copyWith((message) => updates(message as UserContent))
          as UserContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserContent create() => UserContent._();
  UserContent createEmptyInstance() => create();
  static $pb.PbList<UserContent> createRepeated() => $pb.PbList<UserContent>();
  @$core.pragma('dart2js:noInline')
  static UserContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserContent>(create);
  static UserContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userId => $_getIZ(1);
  @$pb.TagNumber(2)
  set userId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get contentId => $_getIZ(2);
  @$pb.TagNumber(3)
  set contentId($core.int v) {
    $_setSignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearContentId() => clearField(3);

  @$pb.TagNumber(4)
  ReadStage get stage => $_getN(3);
  @$pb.TagNumber(4)
  set stage(ReadStage v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStage() => $_has(3);
  @$pb.TagNumber(4)
  void clearStage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get tags => $_getSZ(4);
  @$pb.TagNumber(5)
  set tags($core.String v) {
    $_setString(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasTags() => $_has(4);
  @$pb.TagNumber(5)
  void clearTags() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get category => $_getSZ(5);
  @$pb.TagNumber(6)
  set category($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasCategory() => $_has(5);
  @$pb.TagNumber(6)
  void clearCategory() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => clearField(7);
}

class FeedItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Content',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'id',
        $pb.PbFieldType.O3)
    ..a<$core.int>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'feedId',
        $pb.PbFieldType.O3)
    ..aOS(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'title')
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'cover')
    ..aInt64(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'publishTime')
    ..aOS(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'authors')
    ..aOS(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'link')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content')
    ..aOS(
        9,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'summary')
    ..aOS(
        10,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'summaryAlgo')
    ..aOS(
        11,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'categoryAlgo')
    ..aOS(
        12,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tagsAlgo')
    ..aInt64(
        13,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'createTime')
    ..aOS(
        14,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'md5')
    ..hasRequiredFields = false;

  FeedItem._() : super();
  factory FeedItem({
    $core.int? id,
    $core.int? feedId,
    $core.String? title,
    $core.String? cover,
    $fixnum.Int64? publishTime,
    $core.String? authors,
    $core.String? link,
    $core.String? content,
    $core.String? summary,
    $core.String? summaryAlgo,
    $core.String? categoryAlgo,
    $core.String? tagsAlgo,
    $fixnum.Int64? createTime,
    $core.String? md5,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (feedId != null) {
      _result.feedId = feedId;
    }
    if (title != null) {
      _result.title = title;
    }
    if (cover != null) {
      _result.cover = cover;
    }
    if (publishTime != null) {
      _result.publishTime = publishTime;
    }
    if (authors != null) {
      _result.authors = authors;
    }
    if (link != null) {
      _result.link = link;
    }
    if (content != null) {
      _result.content = content;
    }
    if (summary != null) {
      _result.summary = summary;
    }
    if (summaryAlgo != null) {
      _result.summaryAlgo = summaryAlgo;
    }
    if (categoryAlgo != null) {
      _result.categoryAlgo = categoryAlgo;
    }
    if (tagsAlgo != null) {
      _result.tagsAlgo = tagsAlgo;
    }
    if (createTime != null) {
      _result.createTime = createTime;
    }
    if (md5 != null) {
      _result.md5 = md5;
    }
    return _result;
  }
  factory FeedItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FeedItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FeedItem clone() => FeedItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FeedItem copyWith(void Function(FeedItem) updates) =>
      super.copyWith((message) => updates(message as FeedItem))
          as FeedItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeedItem create() => FeedItem._();
  FeedItem createEmptyInstance() => create();
  static $pb.PbList<FeedItem> createRepeated() => $pb.PbList<FeedItem>();
  @$core.pragma('dart2js:noInline')
  static FeedItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FeedItem>(create);
  static FeedItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get feedId => $_getIZ(1);
  @$pb.TagNumber(2)
  set feedId($core.int v) {
    $_setSignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFeedId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeedId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cover => $_getSZ(3);
  @$pb.TagNumber(4)
  set cover($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCover() => $_has(3);
  @$pb.TagNumber(4)
  void clearCover() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get publishTime => $_getI64(4);
  @$pb.TagNumber(5)
  set publishTime($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasPublishTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublishTime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get authors => $_getSZ(5);
  @$pb.TagNumber(6)
  set authors($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasAuthors() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuthors() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get link => $_getSZ(6);
  @$pb.TagNumber(7)
  set link($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasLink() => $_has(6);
  @$pb.TagNumber(7)
  void clearLink() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get content => $_getSZ(7);
  @$pb.TagNumber(8)
  set content($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasContent() => $_has(7);
  @$pb.TagNumber(8)
  void clearContent() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get summary => $_getSZ(8);
  @$pb.TagNumber(9)
  set summary($core.String v) {
    $_setString(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSummary() => $_has(8);
  @$pb.TagNumber(9)
  void clearSummary() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get summaryAlgo => $_getSZ(9);
  @$pb.TagNumber(10)
  set summaryAlgo($core.String v) {
    $_setString(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSummaryAlgo() => $_has(9);
  @$pb.TagNumber(10)
  void clearSummaryAlgo() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get categoryAlgo => $_getSZ(10);
  @$pb.TagNumber(11)
  set categoryAlgo($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasCategoryAlgo() => $_has(10);
  @$pb.TagNumber(11)
  void clearCategoryAlgo() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get tagsAlgo => $_getSZ(11);
  @$pb.TagNumber(12)
  set tagsAlgo($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasTagsAlgo() => $_has(11);
  @$pb.TagNumber(12)
  void clearTagsAlgo() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get createTime => $_getI64(12);
  @$pb.TagNumber(13)
  set createTime($fixnum.Int64 v) {
    $_setInt64(12, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasCreateTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreateTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get md5 => $_getSZ(13);
  @$pb.TagNumber(14)
  set md5($core.String v) {
    $_setString(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasMd5() => $_has(13);
  @$pb.TagNumber(14)
  void clearMd5() => clearField(14);
}

class FeedContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FeedContent',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..aOM<FeedProfile>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'feedProfile',
        subBuilder: FeedProfile.create)
    ..pc<FeedItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contents',
        $pb.PbFieldType.PM,
        subBuilder: FeedItem.create)
    ..hasRequiredFields = false;

  FeedContent._() : super();
  factory FeedContent({
    FeedProfile? feedProfile,
    $core.Iterable<FeedItem>? contents,
  }) {
    final _result = create();
    if (feedProfile != null) {
      _result.feedProfile = feedProfile;
    }
    if (contents != null) {
      _result.contents.addAll(contents);
    }
    return _result;
  }
  factory FeedContent.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FeedContent.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FeedContent clone() => FeedContent()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FeedContent copyWith(void Function(FeedContent) updates) =>
      super.copyWith((message) => updates(message as FeedContent))
          as FeedContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FeedContent create() => FeedContent._();
  FeedContent createEmptyInstance() => create();
  static $pb.PbList<FeedContent> createRepeated() => $pb.PbList<FeedContent>();
  @$core.pragma('dart2js:noInline')
  static FeedContent getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FeedContent>(create);
  static FeedContent? _defaultInstance;

  @$pb.TagNumber(1)
  FeedProfile get feedProfile => $_getN(0);
  @$pb.TagNumber(1)
  set feedProfile(FeedProfile v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFeedProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeedProfile() => clearField(1);
  @$pb.TagNumber(1)
  FeedProfile ensureFeedProfile() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<FeedItem> get contents => $_getList(1);
}

class AuthResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'AuthResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..aOM<Tokens>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'tokens',
        subBuilder: Tokens.create)
    ..hasRequiredFields = false;

  AuthResponse._() : super();
  factory AuthResponse({
    Tokens? tokens,
  }) {
    final _result = create();
    if (tokens != null) {
      _result.tokens = tokens;
    }
    return _result;
  }
  factory AuthResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory AuthResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  AuthResponse clone() => AuthResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  AuthResponse copyWith(void Function(AuthResponse) updates) =>
      super.copyWith((message) => updates(message as AuthResponse))
          as AuthResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AuthResponse create() => AuthResponse._();
  AuthResponse createEmptyInstance() => create();
  static $pb.PbList<AuthResponse> createRepeated() =>
      $pb.PbList<AuthResponse>();
  @$core.pragma('dart2js:noInline')
  static AuthResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthResponse>(create);
  static AuthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Tokens get tokens => $_getN(0);
  @$pb.TagNumber(1)
  set tokens(Tokens v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTokens() => $_has(0);
  @$pb.TagNumber(1)
  void clearTokens() => clearField(1);
  @$pb.TagNumber(1)
  Tokens ensureTokens() => $_ensure(0);
}

class CreateFeedResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'CreateFeedResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..aOM<UserFeed>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userFeed',
        subBuilder: UserFeed.create)
    ..aOM<FeedProfile>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'feedProfile',
        subBuilder: FeedProfile.create)
    ..pc<UserContent>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userContent',
        $pb.PbFieldType.PM,
        subBuilder: UserContent.create)
    ..pc<FeedItem>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'content',
        $pb.PbFieldType.PM,
        subBuilder: FeedItem.create)
    ..hasRequiredFields = false;

  CreateFeedResponse._() : super();
  factory CreateFeedResponse({
    UserFeed? userFeed,
    FeedProfile? feedProfile,
    $core.Iterable<UserContent>? userContent,
    $core.Iterable<FeedItem>? content,
  }) {
    final _result = create();
    if (userFeed != null) {
      _result.userFeed = userFeed;
    }
    if (feedProfile != null) {
      _result.feedProfile = feedProfile;
    }
    if (userContent != null) {
      _result.userContent.addAll(userContent);
    }
    if (content != null) {
      _result.content.addAll(content);
    }
    return _result;
  }
  factory CreateFeedResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateFeedResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateFeedResponse clone() => CreateFeedResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateFeedResponse copyWith(void Function(CreateFeedResponse) updates) =>
      super.copyWith((message) => updates(message as CreateFeedResponse))
          as CreateFeedResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateFeedResponse create() => CreateFeedResponse._();
  CreateFeedResponse createEmptyInstance() => create();
  static $pb.PbList<CreateFeedResponse> createRepeated() =>
      $pb.PbList<CreateFeedResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateFeedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateFeedResponse>(create);
  static CreateFeedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  UserFeed get userFeed => $_getN(0);
  @$pb.TagNumber(1)
  set userFeed(UserFeed v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUserFeed() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserFeed() => clearField(1);
  @$pb.TagNumber(1)
  UserFeed ensureUserFeed() => $_ensure(0);

  @$pb.TagNumber(2)
  FeedProfile get feedProfile => $_getN(1);
  @$pb.TagNumber(2)
  set feedProfile(FeedProfile v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFeedProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeedProfile() => clearField(2);
  @$pb.TagNumber(2)
  FeedProfile ensureFeedProfile() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<UserContent> get userContent => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<FeedItem> get content => $_getList(3);
}

class FecthFeedResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FecthFeedResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..pc<UserFeed>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userFeeds',
        $pb.PbFieldType.PM,
        subBuilder: UserFeed.create)
    ..pc<FeedProfile>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'feedProfiles',
        $pb.PbFieldType.PM,
        subBuilder: FeedProfile.create)
    ..hasRequiredFields = false;

  FecthFeedResponse._() : super();
  factory FecthFeedResponse({
    $core.Iterable<UserFeed>? userFeeds,
    $core.Iterable<FeedProfile>? feedProfiles,
  }) {
    final _result = create();
    if (userFeeds != null) {
      _result.userFeeds.addAll(userFeeds);
    }
    if (feedProfiles != null) {
      _result.feedProfiles.addAll(feedProfiles);
    }
    return _result;
  }
  factory FecthFeedResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FecthFeedResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FecthFeedResponse clone() => FecthFeedResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FecthFeedResponse copyWith(void Function(FecthFeedResponse) updates) =>
      super.copyWith((message) => updates(message as FecthFeedResponse))
          as FecthFeedResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FecthFeedResponse create() => FecthFeedResponse._();
  FecthFeedResponse createEmptyInstance() => create();
  static $pb.PbList<FecthFeedResponse> createRepeated() =>
      $pb.PbList<FecthFeedResponse>();
  @$core.pragma('dart2js:noInline')
  static FecthFeedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FecthFeedResponse>(create);
  static FecthFeedResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserFeed> get userFeeds => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<FeedProfile> get feedProfiles => $_getList(1);
}

class FetchContentResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'FetchContentResponse',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'response'),
      createEmptyInstance: create)
    ..pc<UserContent>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'userContents',
        $pb.PbFieldType.PM,
        subBuilder: UserContent.create)
    ..pc<FeedItem>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'contents',
        $pb.PbFieldType.PM,
        subBuilder: FeedItem.create)
    ..hasRequiredFields = false;

  FetchContentResponse._() : super();
  factory FetchContentResponse({
    $core.Iterable<UserContent>? userContents,
    $core.Iterable<FeedItem>? contents,
  }) {
    final _result = create();
    if (userContents != null) {
      _result.userContents.addAll(userContents);
    }
    if (contents != null) {
      _result.contents.addAll(contents);
    }
    return _result;
  }
  factory FetchContentResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory FetchContentResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  FetchContentResponse clone() =>
      FetchContentResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  FetchContentResponse copyWith(void Function(FetchContentResponse) updates) =>
      super.copyWith((message) => updates(message as FetchContentResponse))
          as FetchContentResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchContentResponse create() => FetchContentResponse._();
  FetchContentResponse createEmptyInstance() => create();
  static $pb.PbList<FetchContentResponse> createRepeated() =>
      $pb.PbList<FetchContentResponse>();
  @$core.pragma('dart2js:noInline')
  static FetchContentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FetchContentResponse>(create);
  static FetchContentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserContent> get userContents => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<FeedItem> get contents => $_getList(1);
}
