// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFeedItemModelCollection on Isar {
  IsarCollection<FeedItemModel> get feedItemModels => this.collection();
}

const FeedItemModelSchema = CollectionSchema(
  name: r'FeedItemModel',
  id: -4122144834609646876,
  properties: {
    r'authors': PropertySchema(
      id: 0,
      name: r'authors',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 1,
      name: r'category',
      type: IsarType.string,
    ),
    r'contentIsDownloaded': PropertySchema(
      id: 2,
      name: r'contentIsDownloaded',
      type: IsarType.bool,
    ),
    r'cover': PropertySchema(
      id: 3,
      name: r'cover',
      type: IsarType.string,
    ),
    r'createTime': PropertySchema(
      id: 4,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 5,
      name: r'description',
      type: IsarType.string,
    ),
    r'feedUrl': PropertySchema(
      id: 6,
      name: r'feedUrl',
      type: IsarType.string,
    ),
    r'focusTime': PropertySchema(
      id: 7,
      name: r'focusTime',
      type: IsarType.dateTime,
    ),
    r'isDeleted': PropertySchema(
      id: 8,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isFocus': PropertySchema(
      id: 9,
      name: r'isFocus',
      type: IsarType.bool,
    ),
    r'isSeen': PropertySchema(
      id: 10,
      name: r'isSeen',
      type: IsarType.bool,
    ),
    r'isSynced': PropertySchema(
      id: 11,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'link': PropertySchema(
      id: 12,
      name: r'link',
      type: IsarType.string,
    ),
    r'md5String': PropertySchema(
      id: 13,
      name: r'md5String',
      type: IsarType.string,
    ),
    r'publishTime': PropertySchema(
      id: 14,
      name: r'publishTime',
      type: IsarType.dateTime,
    ),
    r'summaryAlgo': PropertySchema(
      id: 15,
      name: r'summaryAlgo',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 16,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 17,
      name: r'title',
      type: IsarType.string,
    ),
    r'updateTime': PropertySchema(
      id: 18,
      name: r'updateTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _feedItemModelEstimateSize,
  serialize: _feedItemModelSerialize,
  deserialize: _feedItemModelDeserialize,
  deserializeProp: _feedItemModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'publishTime': IndexSchema(
      id: 1698621452194960201,
      name: r'publishTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'publishTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'md5String': IndexSchema(
      id: -5619380267181821120,
      name: r'md5String',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'md5String',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'feedUrl': IndexSchema(
      id: 2504832307170622621,
      name: r'feedUrl',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'feedUrl',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'updateTime': IndexSchema(
      id: 397922507239516479,
      name: r'updateTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updateTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _feedItemModelGetId,
  getLinks: _feedItemModelGetLinks,
  attach: _feedItemModelAttach,
  version: '3.1.0+1',
);

int _feedItemModelEstimateSize(
  FeedItemModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.authors;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cover;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.feedUrl.length * 3;
  {
    final value = object.link;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.md5String.length * 3;
  {
    final value = object.summaryAlgo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.tags;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _feedItemModelSerialize(
  FeedItemModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.authors);
  writer.writeString(offsets[1], object.category);
  writer.writeBool(offsets[2], object.contentIsDownloaded);
  writer.writeString(offsets[3], object.cover);
  writer.writeDateTime(offsets[4], object.createTime);
  writer.writeString(offsets[5], object.description);
  writer.writeString(offsets[6], object.feedUrl);
  writer.writeDateTime(offsets[7], object.focusTime);
  writer.writeBool(offsets[8], object.isDeleted);
  writer.writeBool(offsets[9], object.isFocus);
  writer.writeBool(offsets[10], object.isSeen);
  writer.writeBool(offsets[11], object.isSynced);
  writer.writeString(offsets[12], object.link);
  writer.writeString(offsets[13], object.md5String);
  writer.writeDateTime(offsets[14], object.publishTime);
  writer.writeString(offsets[15], object.summaryAlgo);
  writer.writeStringList(offsets[16], object.tags);
  writer.writeString(offsets[17], object.title);
  writer.writeDateTime(offsets[18], object.updateTime);
}

FeedItemModel _feedItemModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeedItemModel(
    reader.readString(offsets[6]),
    authors: reader.readStringOrNull(offsets[0]),
    category: reader.readStringOrNull(offsets[1]),
    cover: reader.readStringOrNull(offsets[3]),
    createTime: reader.readDateTime(offsets[4]),
    description: reader.readStringOrNull(offsets[5]),
    isFocus: reader.readBoolOrNull(offsets[9]) ?? false,
    isSeen: reader.readBoolOrNull(offsets[10]) ?? false,
    isSynced: reader.readBool(offsets[11]),
    link: reader.readStringOrNull(offsets[12]),
    publishTime: reader.readDateTimeOrNull(offsets[14]),
    summaryAlgo: reader.readStringOrNull(offsets[15]),
    tags: reader.readStringList(offsets[16]),
    title: reader.readString(offsets[17]),
    updateTime: reader.readDateTime(offsets[18]),
  );
  object.contentIsDownloaded = reader.readBoolOrNull(offsets[2]);
  object.focusTime = reader.readDateTimeOrNull(offsets[7]);
  object.id = id;
  object.isDeleted = reader.readBool(offsets[8]);
  object.md5String = reader.readString(offsets[13]);
  return object;
}

P _feedItemModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 10:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringList(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _feedItemModelGetId(FeedItemModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _feedItemModelGetLinks(FeedItemModel object) {
  return [];
}

void _feedItemModelAttach(
    IsarCollection<dynamic> col, Id id, FeedItemModel object) {
  object.id = id;
}

extension FeedItemModelByIndex on IsarCollection<FeedItemModel> {
  Future<FeedItemModel?> getByMd5String(String md5String) {
    return getByIndex(r'md5String', [md5String]);
  }

  FeedItemModel? getByMd5StringSync(String md5String) {
    return getByIndexSync(r'md5String', [md5String]);
  }

  Future<bool> deleteByMd5String(String md5String) {
    return deleteByIndex(r'md5String', [md5String]);
  }

  bool deleteByMd5StringSync(String md5String) {
    return deleteByIndexSync(r'md5String', [md5String]);
  }

  Future<List<FeedItemModel?>> getAllByMd5String(List<String> md5StringValues) {
    final values = md5StringValues.map((e) => [e]).toList();
    return getAllByIndex(r'md5String', values);
  }

  List<FeedItemModel?> getAllByMd5StringSync(List<String> md5StringValues) {
    final values = md5StringValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'md5String', values);
  }

  Future<int> deleteAllByMd5String(List<String> md5StringValues) {
    final values = md5StringValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'md5String', values);
  }

  int deleteAllByMd5StringSync(List<String> md5StringValues) {
    final values = md5StringValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'md5String', values);
  }

  Future<Id> putByMd5String(FeedItemModel object) {
    return putByIndex(r'md5String', object);
  }

  Id putByMd5StringSync(FeedItemModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'md5String', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMd5String(List<FeedItemModel> objects) {
    return putAllByIndex(r'md5String', objects);
  }

  List<Id> putAllByMd5StringSync(List<FeedItemModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'md5String', objects, saveLinks: saveLinks);
  }
}

extension FeedItemModelQueryWhereSort
    on QueryBuilder<FeedItemModel, FeedItemModel, QWhere> {
  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhere> anyPublishTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'publishTime'),
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhere> anyUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updateTime'),
      );
    });
  }
}

extension FeedItemModelQueryWhere
    on QueryBuilder<FeedItemModel, FeedItemModel, QWhereClause> {
  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      publishTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'publishTime',
        value: [null],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      publishTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'publishTime',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      publishTimeEqualTo(DateTime? publishTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'publishTime',
        value: [publishTime],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      publishTimeNotEqualTo(DateTime? publishTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'publishTime',
              lower: [],
              upper: [publishTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'publishTime',
              lower: [publishTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'publishTime',
              lower: [publishTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'publishTime',
              lower: [],
              upper: [publishTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      publishTimeGreaterThan(
    DateTime? publishTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'publishTime',
        lower: [publishTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      publishTimeLessThan(
    DateTime? publishTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'publishTime',
        lower: [],
        upper: [publishTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      publishTimeBetween(
    DateTime? lowerPublishTime,
    DateTime? upperPublishTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'publishTime',
        lower: [lowerPublishTime],
        includeLower: includeLower,
        upper: [upperPublishTime],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      md5StringEqualTo(String md5String) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'md5String',
        value: [md5String],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      md5StringNotEqualTo(String md5String) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'md5String',
              lower: [],
              upper: [md5String],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'md5String',
              lower: [md5String],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'md5String',
              lower: [md5String],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'md5String',
              lower: [],
              upper: [md5String],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause> feedUrlEqualTo(
      String feedUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'feedUrl',
        value: [feedUrl],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      feedUrlNotEqualTo(String feedUrl) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedUrl',
              lower: [],
              upper: [feedUrl],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedUrl',
              lower: [feedUrl],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedUrl',
              lower: [feedUrl],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedUrl',
              lower: [],
              upper: [feedUrl],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      updateTimeEqualTo(DateTime updateTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updateTime',
        value: [updateTime],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      updateTimeNotEqualTo(DateTime updateTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [],
              upper: [updateTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [updateTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [updateTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updateTime',
              lower: [],
              upper: [updateTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      updateTimeGreaterThan(
    DateTime updateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updateTime',
        lower: [updateTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      updateTimeLessThan(
    DateTime updateTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updateTime',
        lower: [],
        upper: [updateTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterWhereClause>
      updateTimeBetween(
    DateTime lowerUpdateTime,
    DateTime upperUpdateTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updateTime',
        lower: [lowerUpdateTime],
        includeLower: includeLower,
        upper: [upperUpdateTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FeedItemModelQueryFilter
    on QueryBuilder<FeedItemModel, FeedItemModel, QFilterCondition> {
  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authors',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authors',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authors',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      authorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authors',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      contentIsDownloadedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contentIsDownloaded',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      contentIsDownloadedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contentIsDownloaded',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      contentIsDownloadedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contentIsDownloaded',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      coverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      createTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      createTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      createTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      createTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feedUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feedUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      feedUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      focusTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'focusTime',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      focusTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'focusTime',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      focusTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'focusTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      focusTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'focusTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      focusTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'focusTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      focusTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'focusTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      isDeletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isDeleted',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      isFocusEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFocus',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      isSeenEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'link',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'link',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition> linkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition> linkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'link',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition> linkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'link',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      linkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'md5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'md5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'md5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'md5String',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'md5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'md5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'md5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'md5String',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'md5String',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      md5StringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'md5String',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      publishTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publishTime',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      publishTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publishTime',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      publishTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      publishTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publishTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      publishTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publishTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      publishTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publishTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'summaryAlgo',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'summaryAlgo',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryAlgo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summaryAlgo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summaryAlgo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summaryAlgo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summaryAlgo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summaryAlgo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summaryAlgo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summaryAlgo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summaryAlgo',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      summaryAlgoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summaryAlgo',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      updateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      updateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      updateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterFilterCondition>
      updateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FeedItemModelQueryObject
    on QueryBuilder<FeedItemModel, FeedItemModel, QFilterCondition> {}

extension FeedItemModelQueryLinks
    on QueryBuilder<FeedItemModel, FeedItemModel, QFilterCondition> {}

extension FeedItemModelQuerySortBy
    on QueryBuilder<FeedItemModel, FeedItemModel, QSortBy> {
  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByAuthors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authors', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByAuthorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authors', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByContentIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentIsDownloaded', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByContentIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentIsDownloaded', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByFeedUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByFeedUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByFocusTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focusTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByFocusTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focusTime', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByIsFocus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFocus', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByIsFocusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFocus', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByIsSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByIsSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByMd5String() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'md5String', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByMd5StringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'md5String', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByPublishTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByPublishTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishTime', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortBySummaryAlgo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryAlgo', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortBySummaryAlgoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryAlgo', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> sortByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      sortByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension FeedItemModelQuerySortThenBy
    on QueryBuilder<FeedItemModel, FeedItemModel, QSortThenBy> {
  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByAuthors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authors', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByAuthorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authors', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByContentIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentIsDownloaded', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByContentIsDownloadedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentIsDownloaded', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByFeedUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByFeedUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByFocusTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focusTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByFocusTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'focusTime', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByIsFocus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFocus', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByIsFocusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFocus', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByIsSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByIsSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSeen', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByMd5String() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'md5String', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByMd5StringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'md5String', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByPublishTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByPublishTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publishTime', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenBySummaryAlgo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryAlgo', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenBySummaryAlgoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'summaryAlgo', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy> thenByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QAfterSortBy>
      thenByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension FeedItemModelQueryWhereDistinct
    on QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> {
  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByAuthors(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authors', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct>
      distinctByContentIsDownloaded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contentIsDownloaded');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByCover(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByFeedUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByFocusTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'focusTime');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByIsFocus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFocus');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByIsSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSeen');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'link', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByMd5String(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'md5String', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct>
      distinctByPublishTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publishTime');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctBySummaryAlgo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'summaryAlgo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedItemModel, FeedItemModel, QDistinct> distinctByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateTime');
    });
  }
}

extension FeedItemModelQueryProperty
    on QueryBuilder<FeedItemModel, FeedItemModel, QQueryProperty> {
  QueryBuilder<FeedItemModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FeedItemModel, String?, QQueryOperations> authorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authors');
    });
  }

  QueryBuilder<FeedItemModel, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<FeedItemModel, bool?, QQueryOperations>
      contentIsDownloadedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contentIsDownloaded');
    });
  }

  QueryBuilder<FeedItemModel, String?, QQueryOperations> coverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover');
    });
  }

  QueryBuilder<FeedItemModel, DateTime, QQueryOperations> createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<FeedItemModel, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<FeedItemModel, String, QQueryOperations> feedUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedUrl');
    });
  }

  QueryBuilder<FeedItemModel, DateTime?, QQueryOperations> focusTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'focusTime');
    });
  }

  QueryBuilder<FeedItemModel, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<FeedItemModel, bool, QQueryOperations> isFocusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFocus');
    });
  }

  QueryBuilder<FeedItemModel, bool, QQueryOperations> isSeenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSeen');
    });
  }

  QueryBuilder<FeedItemModel, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<FeedItemModel, String?, QQueryOperations> linkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'link');
    });
  }

  QueryBuilder<FeedItemModel, String, QQueryOperations> md5StringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'md5String');
    });
  }

  QueryBuilder<FeedItemModel, DateTime?, QQueryOperations>
      publishTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publishTime');
    });
  }

  QueryBuilder<FeedItemModel, String?, QQueryOperations> summaryAlgoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'summaryAlgo');
    });
  }

  QueryBuilder<FeedItemModel, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<FeedItemModel, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<FeedItemModel, DateTime, QQueryOperations> updateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateTime');
    });
  }
}
