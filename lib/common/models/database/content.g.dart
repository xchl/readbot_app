// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetContentModelCollection on Isar {
  IsarCollection<ContentModel> get contentModels => this.collection();
}

const ContentModelSchema = CollectionSchema(
  name: r'ContentModel',
  id: -1562986863270883678,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'feedItemMd5String': PropertySchema(
      id: 1,
      name: r'feedItemMd5String',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ContentModeltypeEnumValueMap,
    ),
    r'uri': PropertySchema(
      id: 3,
      name: r'uri',
      type: IsarType.string,
    )
  },
  estimateSize: _contentModelEstimateSize,
  serialize: _contentModelSerialize,
  deserialize: _contentModelDeserialize,
  deserializeProp: _contentModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'uri': IndexSchema(
      id: 8568316795971944889,
      name: r'uri',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uri',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _contentModelGetId,
  getLinks: _contentModelGetLinks,
  attach: _contentModelAttach,
  version: '3.1.0+1',
);

int _contentModelEstimateSize(
  ContentModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.feedItemMd5String.length * 3;
  bytesCount += 3 + object.uri.length * 3;
  return bytesCount;
}

void _contentModelSerialize(
  ContentModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeString(offsets[1], object.feedItemMd5String);
  writer.writeByte(offsets[2], object.type.index);
  writer.writeString(offsets[3], object.uri);
}

ContentModel _contentModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ContentModel(
    content: reader.readString(offsets[0]),
    feedItemMd5String: reader.readString(offsets[1]),
    type: _ContentModeltypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
        ContentType.html,
    uri: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _contentModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (_ContentModeltypeValueEnumMap[reader.readByteOrNull(offset)] ??
          ContentType.html) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ContentModeltypeEnumValueMap = {
  'html': 0,
};
const _ContentModeltypeValueEnumMap = {
  0: ContentType.html,
};

Id _contentModelGetId(ContentModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _contentModelGetLinks(ContentModel object) {
  return [];
}

void _contentModelAttach(
    IsarCollection<dynamic> col, Id id, ContentModel object) {
  object.id = id;
}

extension ContentModelByIndex on IsarCollection<ContentModel> {
  Future<ContentModel?> getByUri(String uri) {
    return getByIndex(r'uri', [uri]);
  }

  ContentModel? getByUriSync(String uri) {
    return getByIndexSync(r'uri', [uri]);
  }

  Future<bool> deleteByUri(String uri) {
    return deleteByIndex(r'uri', [uri]);
  }

  bool deleteByUriSync(String uri) {
    return deleteByIndexSync(r'uri', [uri]);
  }

  Future<List<ContentModel?>> getAllByUri(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return getAllByIndex(r'uri', values);
  }

  List<ContentModel?> getAllByUriSync(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uri', values);
  }

  Future<int> deleteAllByUri(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uri', values);
  }

  int deleteAllByUriSync(List<String> uriValues) {
    final values = uriValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uri', values);
  }

  Future<Id> putByUri(ContentModel object) {
    return putByIndex(r'uri', object);
  }

  Id putByUriSync(ContentModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'uri', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUri(List<ContentModel> objects) {
    return putAllByIndex(r'uri', objects);
  }

  List<Id> putAllByUriSync(List<ContentModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uri', objects, saveLinks: saveLinks);
  }
}

extension ContentModelQueryWhereSort
    on QueryBuilder<ContentModel, ContentModel, QWhere> {
  QueryBuilder<ContentModel, ContentModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ContentModelQueryWhere
    on QueryBuilder<ContentModel, ContentModel, QWhereClause> {
  QueryBuilder<ContentModel, ContentModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ContentModel, ContentModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ContentModel, ContentModel, QAfterWhereClause> uriEqualTo(
      String uri) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uri',
        value: [uri],
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterWhereClause> uriNotEqualTo(
      String uri) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uri',
              lower: [],
              upper: [uri],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uri',
              lower: [uri],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uri',
              lower: [uri],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uri',
              lower: [],
              upper: [uri],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ContentModelQueryFilter
    on QueryBuilder<ContentModel, ContentModel, QFilterCondition> {
  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedItemMd5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedItemMd5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedItemMd5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedItemMd5String',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feedItemMd5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feedItemMd5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedItemMd5String',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedItemMd5String',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedItemMd5String',
        value: '',
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      feedItemMd5StringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedItemMd5String',
        value: '',
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> typeEqualTo(
      ContentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      typeGreaterThan(
    ContentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> typeLessThan(
    ContentType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> typeBetween(
    ContentType lower,
    ContentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      uriGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uri',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uri',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uri',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition> uriIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uri',
        value: '',
      ));
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterFilterCondition>
      uriIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uri',
        value: '',
      ));
    });
  }
}

extension ContentModelQueryObject
    on QueryBuilder<ContentModel, ContentModel, QFilterCondition> {}

extension ContentModelQueryLinks
    on QueryBuilder<ContentModel, ContentModel, QFilterCondition> {}

extension ContentModelQuerySortBy
    on QueryBuilder<ContentModel, ContentModel, QSortBy> {
  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy>
      sortByFeedItemMd5String() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedItemMd5String', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy>
      sortByFeedItemMd5StringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedItemMd5String', Sort.desc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> sortByUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> sortByUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.desc);
    });
  }
}

extension ContentModelQuerySortThenBy
    on QueryBuilder<ContentModel, ContentModel, QSortThenBy> {
  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy>
      thenByFeedItemMd5String() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedItemMd5String', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy>
      thenByFeedItemMd5StringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feedItemMd5String', Sort.desc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenByUri() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.asc);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QAfterSortBy> thenByUriDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uri', Sort.desc);
    });
  }
}

extension ContentModelQueryWhereDistinct
    on QueryBuilder<ContentModel, ContentModel, QDistinct> {
  QueryBuilder<ContentModel, ContentModel, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QDistinct>
      distinctByFeedItemMd5String({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedItemMd5String',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ContentModel, ContentModel, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<ContentModel, ContentModel, QDistinct> distinctByUri(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uri', caseSensitive: caseSensitive);
    });
  }
}

extension ContentModelQueryProperty
    on QueryBuilder<ContentModel, ContentModel, QQueryProperty> {
  QueryBuilder<ContentModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ContentModel, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<ContentModel, String, QQueryOperations>
      feedItemMd5StringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedItemMd5String');
    });
  }

  QueryBuilder<ContentModel, ContentType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<ContentModel, String, QQueryOperations> uriProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uri');
    });
  }
}
