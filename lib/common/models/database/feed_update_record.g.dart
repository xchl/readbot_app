// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_update_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFeedUpdateRecordCollection on Isar {
  IsarCollection<FeedUpdateRecord> get feedUpdateRecords => this.collection();
}

const FeedUpdateRecordSchema = CollectionSchema(
  name: r'FeedUpdateRecord',
  id: -4785361976420438009,
  properties: {
    r'feedId': PropertySchema(
      id: 0,
      name: r'feedId',
      type: IsarType.long,
    ),
    r'lastContentHash': PropertySchema(
      id: 1,
      name: r'lastContentHash',
      type: IsarType.string,
    ),
    r'lastUpdate': PropertySchema(
      id: 2,
      name: r'lastUpdate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _feedUpdateRecordEstimateSize,
  serialize: _feedUpdateRecordSerialize,
  deserialize: _feedUpdateRecordDeserialize,
  deserializeProp: _feedUpdateRecordDeserializeProp,
  idName: r'id',
  indexes: {
    r'feedId': IndexSchema(
      id: -9093187642505315800,
      name: r'feedId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'feedId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _feedUpdateRecordGetId,
  getLinks: _feedUpdateRecordGetLinks,
  attach: _feedUpdateRecordAttach,
  version: '3.0.5',
);

int _feedUpdateRecordEstimateSize(
  FeedUpdateRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.lastContentHash.length * 3;
  return bytesCount;
}

void _feedUpdateRecordSerialize(
  FeedUpdateRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.feedId);
  writer.writeString(offsets[1], object.lastContentHash);
  writer.writeDateTime(offsets[2], object.lastUpdate);
}

FeedUpdateRecord _feedUpdateRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeedUpdateRecord(
    feedId: reader.readLong(offsets[0]),
    lastContentHash: reader.readString(offsets[1]),
    lastUpdate: reader.readDateTime(offsets[2]),
  );
  object.id = id;
  return object;
}

P _feedUpdateRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _feedUpdateRecordGetId(FeedUpdateRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _feedUpdateRecordGetLinks(FeedUpdateRecord object) {
  return [];
}

void _feedUpdateRecordAttach(
    IsarCollection<dynamic> col, Id id, FeedUpdateRecord object) {
  object.id = id;
}

extension FeedUpdateRecordByIndex on IsarCollection<FeedUpdateRecord> {
  Future<FeedUpdateRecord?> getByFeedId(int feedId) {
    return getByIndex(r'feedId', [feedId]);
  }

  FeedUpdateRecord? getByFeedIdSync(int feedId) {
    return getByIndexSync(r'feedId', [feedId]);
  }

  Future<bool> deleteByFeedId(int feedId) {
    return deleteByIndex(r'feedId', [feedId]);
  }

  bool deleteByFeedIdSync(int feedId) {
    return deleteByIndexSync(r'feedId', [feedId]);
  }

  Future<List<FeedUpdateRecord?>> getAllByFeedId(List<int> feedIdValues) {
    final values = feedIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'feedId', values);
  }

  List<FeedUpdateRecord?> getAllByFeedIdSync(List<int> feedIdValues) {
    final values = feedIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'feedId', values);
  }

  Future<int> deleteAllByFeedId(List<int> feedIdValues) {
    final values = feedIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'feedId', values);
  }

  int deleteAllByFeedIdSync(List<int> feedIdValues) {
    final values = feedIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'feedId', values);
  }

  Future<Id> putByFeedId(FeedUpdateRecord object) {
    return putByIndex(r'feedId', object);
  }

  Id putByFeedIdSync(FeedUpdateRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'feedId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFeedId(List<FeedUpdateRecord> objects) {
    return putAllByIndex(r'feedId', objects);
  }

  List<Id> putAllByFeedIdSync(List<FeedUpdateRecord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'feedId', objects, saveLinks: saveLinks);
  }
}

extension FeedUpdateRecordQueryWhereSort
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QWhere> {
  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhere> anyFeedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'feedId'),
      );
    });
  }
}

extension FeedUpdateRecordQueryWhere
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QWhereClause> {
  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause> idBetween(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
      feedIdEqualTo(int feedId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'feedId',
        value: [feedId],
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
      feedIdNotEqualTo(int feedId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedId',
              lower: [],
              upper: [feedId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedId',
              lower: [feedId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedId',
              lower: [feedId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'feedId',
              lower: [],
              upper: [feedId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
      feedIdGreaterThan(
    int feedId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'feedId',
        lower: [feedId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
      feedIdLessThan(
    int feedId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'feedId',
        lower: [],
        upper: [feedId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterWhereClause>
      feedIdBetween(
    int lowerFeedId,
    int upperFeedId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'feedId',
        lower: [lowerFeedId],
        includeLower: includeLower,
        upper: [upperFeedId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FeedUpdateRecordQueryFilter
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QFilterCondition> {
  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      feedIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedId',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      feedIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedId',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      feedIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedId',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      feedIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashEqualTo(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashGreaterThan(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashLessThan(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashBetween(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashStartsWith(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashEndsWith(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastContentHash',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastContentHash',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastContentHash',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastContentHashIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastContentHash',
        value: '',
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastUpdateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdate',
        value: value,
      ));
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastUpdateGreaterThan(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastUpdateLessThan(
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

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterFilterCondition>
      lastUpdateBetween(
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
}

extension FeedUpdateRecordQueryObject
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QFilterCondition> {}

extension FeedUpdateRecordQueryLinks
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QFilterCondition> {}

extension FeedUpdateRecordQuerySortBy
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QSortBy> {
  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      sortByFeedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedId', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      sortByFeedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedId', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      sortByLastContentHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      sortByLastContentHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }
}

extension FeedUpdateRecordQuerySortThenBy
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QSortThenBy> {
  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      thenByFeedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedId', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      thenByFeedIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedId', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      thenByLastContentHash() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      thenByLastContentHashDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastContentHash', Sort.desc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QAfterSortBy>
      thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }
}

extension FeedUpdateRecordQueryWhereDistinct
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QDistinct> {
  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QDistinct>
      distinctByFeedId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedId');
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QDistinct>
      distinctByLastContentHash({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastContentHash',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QDistinct>
      distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }
}

extension FeedUpdateRecordQueryProperty
    on QueryBuilder<FeedUpdateRecord, FeedUpdateRecord, QQueryProperty> {
  QueryBuilder<FeedUpdateRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FeedUpdateRecord, int, QQueryOperations> feedIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedId');
    });
  }

  QueryBuilder<FeedUpdateRecord, String, QQueryOperations>
      lastContentHashProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastContentHash');
    });
  }

  QueryBuilder<FeedUpdateRecord, DateTime, QQueryOperations>
      lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }
}
