// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetFeedCollection on Isar {
  IsarCollection<Feed> get feeds => this.collection();
}

const FeedSchema = CollectionSchema(
  name: r'Feed',
  id: 8879644747771893978,
  properties: {
    r'createTime': PropertySchema(
      id: 0,
      name: r'createTime',
      type: IsarType.dateTime,
    ),
    r'customDescription': PropertySchema(
      id: 1,
      name: r'customDescription',
      type: IsarType.string,
    ),
    r'customLogo': PropertySchema(
      id: 2,
      name: r'customLogo',
      type: IsarType.string,
    ),
    r'customName': PropertySchema(
      id: 3,
      name: r'customName',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'groupId': PropertySchema(
      id: 5,
      name: r'groupId',
      type: IsarType.long,
    ),
    r'logo': PropertySchema(
      id: 6,
      name: r'logo',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 8,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 9,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 10,
      name: r'type',
      type: IsarType.int,
      enumMap: _FeedtypeEnumValueMap,
    ),
    r'url': PropertySchema(
      id: 11,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _feedEstimateSize,
  serialize: _feedSerialize,
  deserialize: _feedDeserialize,
  deserializeProp: _feedDeserializeProp,
  idName: r'id',
  indexes: {
    r'url': IndexSchema(
      id: -5756857009679432345,
      name: r'url',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'url',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _feedGetId,
  getLinks: _feedGetLinks,
  attach: _feedAttach,
  version: '3.0.5',
);

int _feedEstimateSize(
  Feed object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.customDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customLogo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customName;
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
  {
    final value = object.logo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
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
  bytesCount += 3 + object.url.length * 3;
  return bytesCount;
}

void _feedSerialize(
  Feed object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createTime);
  writer.writeString(offsets[1], object.customDescription);
  writer.writeString(offsets[2], object.customLogo);
  writer.writeString(offsets[3], object.customName);
  writer.writeString(offsets[4], object.description);
  writer.writeLong(offsets[5], object.groupId);
  writer.writeString(offsets[6], object.logo);
  writer.writeString(offsets[7], object.name);
  writer.writeStringList(offsets[8], object.tags);
  writer.writeString(offsets[9], object.title);
  writer.writeInt(offsets[10], object.type?.index);
  writer.writeString(offsets[11], object.url);
}

Feed _feedDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Feed(
    reader.readString(offsets[11]),
    customDescription: reader.readStringOrNull(offsets[1]),
    customLogo: reader.readStringOrNull(offsets[2]),
    customName: reader.readStringOrNull(offsets[3]),
    description: reader.readStringOrNull(offsets[4]),
    logo: reader.readStringOrNull(offsets[6]),
    name: reader.readStringOrNull(offsets[7]),
    tags: reader.readStringList(offsets[8]),
    type: _FeedtypeValueEnumMap[reader.readIntOrNull(offsets[10])],
  );
  object.createTime = reader.readDateTime(offsets[0]);
  object.groupId = reader.readLongOrNull(offsets[5]);
  object.id = id;
  return object;
}

P _feedDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (_FeedtypeValueEnumMap[reader.readIntOrNull(offset)]) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FeedtypeEnumValueMap = {
  'Atom': 0,
  'Rss': 1,
  'Unknown': 2,
};
const _FeedtypeValueEnumMap = {
  0: FeedType.Atom,
  1: FeedType.Rss,
  2: FeedType.Unknown,
};

Id _feedGetId(Feed object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _feedGetLinks(Feed object) {
  return [];
}

void _feedAttach(IsarCollection<dynamic> col, Id id, Feed object) {
  object.id = id;
}

extension FeedByIndex on IsarCollection<Feed> {
  Future<Feed?> getByUrl(String url) {
    return getByIndex(r'url', [url]);
  }

  Feed? getByUrlSync(String url) {
    return getByIndexSync(r'url', [url]);
  }

  Future<bool> deleteByUrl(String url) {
    return deleteByIndex(r'url', [url]);
  }

  bool deleteByUrlSync(String url) {
    return deleteByIndexSync(r'url', [url]);
  }

  Future<List<Feed?>> getAllByUrl(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndex(r'url', values);
  }

  List<Feed?> getAllByUrlSync(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'url', values);
  }

  Future<int> deleteAllByUrl(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'url', values);
  }

  int deleteAllByUrlSync(List<String> urlValues) {
    final values = urlValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'url', values);
  }

  Future<Id> putByUrl(Feed object) {
    return putByIndex(r'url', object);
  }

  Id putByUrlSync(Feed object, {bool saveLinks = true}) {
    return putByIndexSync(r'url', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUrl(List<Feed> objects) {
    return putAllByIndex(r'url', objects);
  }

  List<Id> putAllByUrlSync(List<Feed> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'url', objects, saveLinks: saveLinks);
  }
}

extension FeedQueryWhereSort on QueryBuilder<Feed, Feed, QWhere> {
  QueryBuilder<Feed, Feed, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FeedQueryWhere on QueryBuilder<Feed, Feed, QWhereClause> {
  QueryBuilder<Feed, Feed, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Feed, Feed, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Feed, Feed, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Feed, Feed, QAfterWhereClause> idBetween(
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

  QueryBuilder<Feed, Feed, QAfterWhereClause> urlEqualTo(String url) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'url',
        value: [url],
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterWhereClause> urlNotEqualTo(String url) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [url],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'url',
              lower: [],
              upper: [url],
              includeUpper: false,
            ));
      }
    });
  }
}

extension FeedQueryFilter on QueryBuilder<Feed, Feed, QFilterCondition> {
  QueryBuilder<Feed, Feed, QAfterFilterCondition> createTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> createTimeGreaterThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> createTimeLessThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> createTimeBetween(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customDescription',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customDescription',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition>
      customDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customLogo',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customLogo',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customLogo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customLogo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customLogoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customName',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customName',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customName',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> customNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customName',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> groupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupId',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> groupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupId',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> groupIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> groupIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> groupIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupId',
        value: value,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> groupIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> logoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tags',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementEqualTo(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementGreaterThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementLessThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementBetween(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementStartsWith(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementEndsWith(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsIsEmpty() {
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsIsNotEmpty() {
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsLengthLessThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsLengthGreaterThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> tagsLengthBetween(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> typeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> typeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'type',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> typeEqualTo(FeedType? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> typeGreaterThan(
    FeedType? value, {
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> typeLessThan(
    FeedType? value, {
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> typeBetween(
    FeedType? lower,
    FeedType? upper, {
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

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<Feed, Feed, QAfterFilterCondition> urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension FeedQueryObject on QueryBuilder<Feed, Feed, QFilterCondition> {}

extension FeedQueryLinks on QueryBuilder<Feed, Feed, QFilterCondition> {}

extension FeedQuerySortBy on QueryBuilder<Feed, Feed, QSortBy> {
  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCustomDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDescription', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCustomDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDescription', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCustomLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customLogo', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCustomLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customLogo', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCustomName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customName', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByCustomNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customName', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension FeedQuerySortThenBy on QueryBuilder<Feed, Feed, QSortThenBy> {
  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCreateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createTime', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCustomDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDescription', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCustomDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customDescription', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCustomLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customLogo', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCustomLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customLogo', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCustomName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customName', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByCustomNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customName', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<Feed, Feed, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension FeedQueryWhereDistinct on QueryBuilder<Feed, Feed, QDistinct> {
  QueryBuilder<Feed, Feed, QDistinct> distinctByCreateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createTime');
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByCustomDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByCustomLogo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customLogo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByCustomName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId');
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByLogo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }

  QueryBuilder<Feed, Feed, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension FeedQueryProperty on QueryBuilder<Feed, Feed, QQueryProperty> {
  QueryBuilder<Feed, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Feed, DateTime, QQueryOperations> createTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createTime');
    });
  }

  QueryBuilder<Feed, String?, QQueryOperations> customDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customDescription');
    });
  }

  QueryBuilder<Feed, String?, QQueryOperations> customLogoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customLogo');
    });
  }

  QueryBuilder<Feed, String?, QQueryOperations> customNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customName');
    });
  }

  QueryBuilder<Feed, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Feed, int?, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<Feed, String?, QQueryOperations> logoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logo');
    });
  }

  QueryBuilder<Feed, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Feed, List<String>?, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<Feed, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Feed, FeedType?, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Feed, String, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
