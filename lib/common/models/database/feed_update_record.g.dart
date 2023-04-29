// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_update_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFeedUpdateRecordModelCollection on Isar {
  IsarCollection<FeedUpdateRecordModel> get feedUpdateRecordModels =>
      this.collection();
}

const FeedUpdateRecordModelSchema = CollectionSchema(
  name: r'FeedUpdateRecordModel',
  id: 3485920852919927359,
  properties: {
    r'feedUrl': PropertySchema(
      id: 0,
      name: r'feedUrl',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 1,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'lastContentHash': PropertySchema(
      id: 2,
      name: r'lastContentHash',
      type: IsarType.string,
    ),
    r'lastItemPublishTime': PropertySchema(
      id: 3,
      name: r'lastItemPublishTime',
      type: IsarType.dateTime,
    ),
    r'lastUpdate': PropertySchema(
      id: 4,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    ),
    r'updateTime': PropertySchema(
      id: 5,
      name: r'updateTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _feedUpdateRecordModelEstimateSize,
  serialize: _feedUpdateRecordModelSerialize,
  deserialize: _feedUpdateRecordModelDeserialize,
  deserializeProp: _feedUpdateRecordModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'feedUrl': IndexSchema(
      id: 2504832307170622621,
      name: r'feedUrl',
      unique: true,
      replace: true,
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
  getId: _feedUpdateRecordModelGetId,
  getLinks: _feedUpdateRecordModelGetLinks,
  attach: _feedUpdateRecordModelAttach,
  version: '3.1.0+1',
);

int _feedUpdateRecordModelEstimateSize(
  FeedUpdateRecordModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.feedUrl.length * 3;
  bytesCount += 3 + object.lastContentHash.length * 3;
  return bytesCount;
}

void _feedUpdateRecordModelSerialize(
  FeedUpdateRecordModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.feedUrl);
  writer.writeBool(offsets[1], object.isSynced);
  writer.writeString(offsets[2], object.lastContentHash);
  writer.writeDateTime(offsets[3], object.lastItemPublishTime);
  writer.writeDateTime(offsets[4], object.lastUpdate);
  writer.writeDateTime(offsets[5], object.updateTime);
}

FeedUpdateRecordModel _feedUpdateRecordModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeedUpdateRecordModel(
    feedUrl: reader.readString(offsets[0]),
    isSynced: reader.readBoolOrNull(offsets[1]) ?? false,
    lastContentHash: reader.readString(offsets[2]),
    lastItemPublishTime: reader.readDateTimeOrNull(offsets[3]),
    lastUpdate: reader.readDateTime(offsets[4]),
    updateTime: reader.readDateTime(offsets[5]),
  );
  object.id = id;
  return object;
}

P _feedUpdateRecordModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _feedUpdateRecordModelGetId(FeedUpdateRecordModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _feedUpdateRecordModelGetLinks(
    FeedUpdateRecordModel object) {
  return [];
}

void _feedUpdateRecordModelAttach(
    IsarCollection<dynamic> col, Id id, FeedUpdateRecordModel object) {
  object.id = id;
}

extension FeedUpdateRecordModelByIndex
    on IsarCollection<FeedUpdateRecordModel> {
  Future<FeedUpdateRecordModel?> getByFeedUrl(String feedUrl) {
    return getByIndex(r'feedUrl', [feedUrl]);
  }

  FeedUpdateRecordModel? getByFeedUrlSync(String feedUrl) {
    return getByIndexSync(r'feedUrl', [feedUrl]);
  }

  Future<bool> deleteByFeedUrl(String feedUrl) {
    return deleteByIndex(r'feedUrl', [feedUrl]);
  }

  bool deleteByFeedUrlSync(String feedUrl) {
    return deleteByIndexSync(r'feedUrl', [feedUrl]);
  }

  Future<List<FeedUpdateRecordModel?>> getAllByFeedUrl(
      List<String> feedUrlValues) {
    final values = feedUrlValues.map((e) => [e]).toList();
    return getAllByIndex(r'feedUrl', values);
  }

  List<FeedUpdateRecordModel?> getAllByFeedUrlSync(List<String> feedUrlValues) {
    final values = feedUrlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'feedUrl', values);
  }

  Future<int> deleteAllByFeedUrl(List<String> feedUrlValues) {
    final values = feedUrlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'feedUrl', values);
  }

  int deleteAllByFeedUrlSync(List<String> feedUrlValues) {
    final values = feedUrlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'feedUrl', values);
  }

  Future<Id> putByFeedUrl(FeedUpdateRecordModel object) {
    return putByIndex(r'feedUrl', object);
  }

  Id putByFeedUrlSync(FeedUpdateRecordModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'feedUrl', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFeedUrl(List<FeedUpdateRecordModel> objects) {
    return putAllByIndex(r'feedUrl', objects);
  }

  List<Id> putAllByFeedUrlSync(List<FeedUpdateRecordModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'feedUrl', objects, saveLinks: saveLinks);
  }
}

extension FeedUpdateRecordModelQueryWhereSort
    on QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QWhere> {
  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhere>
      anyUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updateTime'),
      );
    });
  }
}

extension FeedUpdateRecordModelQueryWhere on QueryBuilder<FeedUpdateRecordModel,
    FeedUpdateRecordModel, QWhereClause> {
  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
      feedUrlEqualTo(String feedUrl) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'feedUrl',
        value: [feedUrl],
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
      updateTimeEqualTo(DateTime updateTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updateTime',
        value: [updateTime],
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterWhereClause>
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

extension FeedUpdateRecordModelQueryFilter on QueryBuilder<
    FeedUpdateRecordModel, FeedUpdateRecordModel, QFilterCondition> {
  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlEqualTo(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlGreaterThan(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlLessThan(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlBetween(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlStartsWith(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlEndsWith(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
          QAfterFilterCondition>
      feedUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
          QAfterFilterCondition>
      feedUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> feedUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastContentHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastContentHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastContentHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastContentHash',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastContentHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastContentHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
          QAfterFilterCondition>
      lastContentHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastContentHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
          QAfterFilterCondition>
      lastContentHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastContentHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastContentHash',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastContentHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastContentHash',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastItemPublishTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastItemPublishTime',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastItemPublishTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastItemPublishTime',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastItemPublishTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastItemPublishTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastItemPublishTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastItemPublishTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastItemPublishTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastItemPublishTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastItemPublishTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastItemPublishTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastUpdateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastUpdateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastUpdateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> lastUpdateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> updateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> updateTimeGreaterThan(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> updateTimeLessThan(
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

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel,
      QAfterFilterCondition> updateTimeBetween(
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

extension FeedUpdateRecordModelQueryObject on QueryBuilder<
    FeedUpdateRecordModel, FeedUpdateRecordModel, QFilterCondition> {}

extension FeedUpdateRecordModelQueryLinks on QueryBuilder<FeedUpdateRecordModel,
    FeedUpdateRecordModel, QFilterCondition> {}

extension FeedUpdateRecordModelQuerySortBy
    on QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QSortBy> {
  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByFeedUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByFeedUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByLastContentHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByLastContentHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByLastItemPublishTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemPublishTime', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByLastItemPublishTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemPublishTime', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      sortByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension FeedUpdateRecordModelQuerySortThenBy
    on QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QSortThenBy> {
  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByFeedUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByFeedUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedUrl', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByLastContentHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByLastContentHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByLastItemPublishTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemPublishTime', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByLastItemPublishTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastItemPublishTime', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QAfterSortBy>
      thenByUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updateTime', Sort.desc);
    });
  }
}

extension FeedUpdateRecordModelQueryWhereDistinct
    on QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QDistinct> {
  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QDistinct>
      distinctByFeedUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QDistinct>
      distinctByLastContentHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastContentHash',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QDistinct>
      distinctByLastItemPublishTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastItemPublishTime');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QDistinct>
      distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, FeedUpdateRecordModel, QDistinct>
      distinctByUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updateTime');
    });
  }
}

extension FeedUpdateRecordModelQueryProperty on QueryBuilder<
    FeedUpdateRecordModel, FeedUpdateRecordModel, QQueryProperty> {
  QueryBuilder<FeedUpdateRecordModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, String, QQueryOperations>
      feedUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedUrl');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, String, QQueryOperations>
      lastContentHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastContentHash');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, DateTime?, QQueryOperations>
      lastItemPublishTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastItemPublishTime');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, DateTime, QQueryOperations>
      lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<FeedUpdateRecordModel, DateTime, QQueryOperations>
      updateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updateTime');
    });
  }
}
