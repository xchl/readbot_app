// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_timestamp.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSyncTimestampModelCollection on Isar {
  IsarCollection<SyncTimestampModel> get syncTimestampModels =>
      this.collection();
}

const SyncTimestampModelSchema = CollectionSchema(
  name: r'SyncTimestampModel',
  id: 3079856239940135159,
  properties: {
    r'modelName': PropertySchema(
      id: 0,
      name: r'modelName',
      type: IsarType.byte,
      enumMap: _SyncTimestampModelmodelNameEnumValueMap,
    ),
    r'syncTime': PropertySchema(
      id: 1,
      name: r'syncTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _syncTimestampModelEstimateSize,
  serialize: _syncTimestampModelSerialize,
  deserialize: _syncTimestampModelDeserialize,
  deserializeProp: _syncTimestampModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'modelName': IndexSchema(
      id: -5766876836036160997,
      name: r'modelName',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'modelName',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _syncTimestampModelGetId,
  getLinks: _syncTimestampModelGetLinks,
  attach: _syncTimestampModelAttach,
  version: '3.1.0+1',
);

int _syncTimestampModelEstimateSize(
  SyncTimestampModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _syncTimestampModelSerialize(
  SyncTimestampModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.modelName.index);
  writer.writeDateTime(offsets[1], object.syncTime);
}

SyncTimestampModel _syncTimestampModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SyncTimestampModel(
    _SyncTimestampModelmodelNameValueEnumMap[
            reader.readByteOrNull(offsets[0])] ??
        ModelName.feed,
    syncTime: reader.readDateTime(offsets[1]),
  );
  object.id = id;
  return object;
}

P _syncTimestampModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SyncTimestampModelmodelNameValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ModelName.feed) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SyncTimestampModelmodelNameEnumValueMap = {
  'feed': 0,
  'feedItem': 1,
  'feedUpdateRecord': 2,
  'feedGroup': 3,
};
const _SyncTimestampModelmodelNameValueEnumMap = {
  0: ModelName.feed,
  1: ModelName.feedItem,
  2: ModelName.feedUpdateRecord,
  3: ModelName.feedGroup,
};

Id _syncTimestampModelGetId(SyncTimestampModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _syncTimestampModelGetLinks(
    SyncTimestampModel object) {
  return [];
}

void _syncTimestampModelAttach(
    IsarCollection<dynamic> col, Id id, SyncTimestampModel object) {
  object.id = id;
}

extension SyncTimestampModelByIndex on IsarCollection<SyncTimestampModel> {
  Future<SyncTimestampModel?> getByModelName(ModelName modelName) {
    return getByIndex(r'modelName', [modelName]);
  }

  SyncTimestampModel? getByModelNameSync(ModelName modelName) {
    return getByIndexSync(r'modelName', [modelName]);
  }

  Future<bool> deleteByModelName(ModelName modelName) {
    return deleteByIndex(r'modelName', [modelName]);
  }

  bool deleteByModelNameSync(ModelName modelName) {
    return deleteByIndexSync(r'modelName', [modelName]);
  }

  Future<List<SyncTimestampModel?>> getAllByModelName(
      List<ModelName> modelNameValues) {
    final values = modelNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'modelName', values);
  }

  List<SyncTimestampModel?> getAllByModelNameSync(
      List<ModelName> modelNameValues) {
    final values = modelNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'modelName', values);
  }

  Future<int> deleteAllByModelName(List<ModelName> modelNameValues) {
    final values = modelNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'modelName', values);
  }

  int deleteAllByModelNameSync(List<ModelName> modelNameValues) {
    final values = modelNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'modelName', values);
  }

  Future<Id> putByModelName(SyncTimestampModel object) {
    return putByIndex(r'modelName', object);
  }

  Id putByModelNameSync(SyncTimestampModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'modelName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByModelName(List<SyncTimestampModel> objects) {
    return putAllByIndex(r'modelName', objects);
  }

  List<Id> putAllByModelNameSync(List<SyncTimestampModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'modelName', objects, saveLinks: saveLinks);
  }
}

extension SyncTimestampModelQueryWhereSort
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QWhere> {
  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhere>
      anyModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'modelName'),
      );
    });
  }
}

extension SyncTimestampModelQueryWhere
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QWhereClause> {
  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
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

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
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

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      modelNameEqualTo(ModelName modelName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'modelName',
        value: [modelName],
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      modelNameNotEqualTo(ModelName modelName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'modelName',
              lower: [],
              upper: [modelName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'modelName',
              lower: [modelName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'modelName',
              lower: [modelName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'modelName',
              lower: [],
              upper: [modelName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      modelNameGreaterThan(
    ModelName modelName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'modelName',
        lower: [modelName],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      modelNameLessThan(
    ModelName modelName, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'modelName',
        lower: [],
        upper: [modelName],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterWhereClause>
      modelNameBetween(
    ModelName lowerModelName,
    ModelName upperModelName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'modelName',
        lower: [lowerModelName],
        includeLower: includeLower,
        upper: [upperModelName],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncTimestampModelQueryFilter
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QFilterCondition> {
  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
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

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
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

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
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

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      modelNameEqualTo(ModelName value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modelName',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      modelNameGreaterThan(
    ModelName value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modelName',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      modelNameLessThan(
    ModelName value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modelName',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      modelNameBetween(
    ModelName lower,
    ModelName upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modelName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      syncTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      syncTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      syncTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterFilterCondition>
      syncTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SyncTimestampModelQueryObject
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QFilterCondition> {}

extension SyncTimestampModelQueryLinks
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QFilterCondition> {}

extension SyncTimestampModelQuerySortBy
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QSortBy> {
  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      sortByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      sortByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      sortBySyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTime', Sort.asc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      sortBySyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTime', Sort.desc);
    });
  }
}

extension SyncTimestampModelQuerySortThenBy
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QSortThenBy> {
  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      thenByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.asc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      thenByModelNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modelName', Sort.desc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      thenBySyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTime', Sort.asc);
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QAfterSortBy>
      thenBySyncTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncTime', Sort.desc);
    });
  }
}

extension SyncTimestampModelQueryWhereDistinct
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QDistinct> {
  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QDistinct>
      distinctByModelName() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modelName');
    });
  }

  QueryBuilder<SyncTimestampModel, SyncTimestampModel, QDistinct>
      distinctBySyncTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncTime');
    });
  }
}

extension SyncTimestampModelQueryProperty
    on QueryBuilder<SyncTimestampModel, SyncTimestampModel, QQueryProperty> {
  QueryBuilder<SyncTimestampModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SyncTimestampModel, ModelName, QQueryOperations>
      modelNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modelName');
    });
  }

  QueryBuilder<SyncTimestampModel, DateTime, QQueryOperations>
      syncTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncTime');
    });
  }
}
