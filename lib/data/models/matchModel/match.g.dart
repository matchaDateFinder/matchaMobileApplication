// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMatchCollection on Isar {
  IsarCollection<Match> get matchs => this.collection();
}

const MatchSchema = CollectionSchema(
  name: r'Match',
  id: -4384922031457139852,
  properties: {
    r'isVisited': PropertySchema(
      id: 0,
      name: r'isVisited',
      type: IsarType.bool,
    ),
    r'user1Id': PropertySchema(
      id: 1,
      name: r'user1Id',
      type: IsarType.long,
    ),
    r'user1Reaction': PropertySchema(
      id: 2,
      name: r'user1Reaction',
      type: IsarType.string,
    ),
    r'user2Id': PropertySchema(
      id: 3,
      name: r'user2Id',
      type: IsarType.long,
    ),
    r'user2Reaction': PropertySchema(
      id: 4,
      name: r'user2Reaction',
      type: IsarType.string,
    )
  },
  estimateSize: _matchEstimateSize,
  serialize: _matchSerialize,
  deserialize: _matchDeserialize,
  deserializeProp: _matchDeserializeProp,
  idName: r'matchId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _matchGetId,
  getLinks: _matchGetLinks,
  attach: _matchAttach,
  version: '3.1.0+1',
);

int _matchEstimateSize(
  Match object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.user1Reaction.length * 3;
  bytesCount += 3 + object.user2Reaction.length * 3;
  return bytesCount;
}

void _matchSerialize(
  Match object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isVisited);
  writer.writeLong(offsets[1], object.user1Id);
  writer.writeString(offsets[2], object.user1Reaction);
  writer.writeLong(offsets[3], object.user2Id);
  writer.writeString(offsets[4], object.user2Reaction);
}

Match _matchDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Match();
  object.isVisited = reader.readBool(offsets[0]);
  object.user1Id = reader.readLong(offsets[1]);
  object.user1Reaction = reader.readString(offsets[2]);
  object.user2Id = reader.readLong(offsets[3]);
  object.user2Reaction = reader.readString(offsets[4]);
  return object;
}

P _matchDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _matchGetId(Match object) {
  return object.matchId;
}

List<IsarLinkBase<dynamic>> _matchGetLinks(Match object) {
  return [];
}

void _matchAttach(IsarCollection<dynamic> col, Id id, Match object) {}

extension MatchQueryWhereSort on QueryBuilder<Match, Match, QWhere> {
  QueryBuilder<Match, Match, QAfterWhere> anyMatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MatchQueryWhere on QueryBuilder<Match, Match, QWhereClause> {
  QueryBuilder<Match, Match, QAfterWhereClause> matchIdEqualTo(Id matchId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: matchId,
        upper: matchId,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterWhereClause> matchIdNotEqualTo(Id matchId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: matchId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: matchId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: matchId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: matchId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Match, Match, QAfterWhereClause> matchIdGreaterThan(Id matchId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: matchId, includeLower: include),
      );
    });
  }

  QueryBuilder<Match, Match, QAfterWhereClause> matchIdLessThan(Id matchId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: matchId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Match, Match, QAfterWhereClause> matchIdBetween(
    Id lowerMatchId,
    Id upperMatchId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerMatchId,
        includeLower: includeLower,
        upper: upperMatchId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MatchQueryFilter on QueryBuilder<Match, Match, QFilterCondition> {
  QueryBuilder<Match, Match, QAfterFilterCondition> isVisitedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVisited',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> matchIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'matchId',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> matchIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'matchId',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> matchIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'matchId',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> matchIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'matchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1IdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1Id',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1IdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user1Id',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1IdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user1Id',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1IdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user1Id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user1Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user1Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user1Reaction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'user1Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'user1Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'user1Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'user1Reaction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1Reaction',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'user1Reaction',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2IdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2Id',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2IdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user2Id',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2IdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user2Id',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2IdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user2Id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user2Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user2Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user2Reaction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'user2Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'user2Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'user2Reaction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'user2Reaction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2Reaction',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'user2Reaction',
        value: '',
      ));
    });
  }
}

extension MatchQueryObject on QueryBuilder<Match, Match, QFilterCondition> {}

extension MatchQueryLinks on QueryBuilder<Match, Match, QFilterCondition> {}

extension MatchQuerySortBy on QueryBuilder<Match, Match, QSortBy> {
  QueryBuilder<Match, Match, QAfterSortBy> sortByIsVisited() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisited', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByIsVisitedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisited', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1Id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Id', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1IdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Id', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1Reaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Reaction', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1ReactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Reaction', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2Id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Id', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2IdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Id', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2Reaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Reaction', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2ReactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Reaction', Sort.desc);
    });
  }
}

extension MatchQuerySortThenBy on QueryBuilder<Match, Match, QSortThenBy> {
  QueryBuilder<Match, Match, QAfterSortBy> thenByIsVisited() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisited', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByIsVisitedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisited', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByMatchId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByMatchIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'matchId', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1Id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Id', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1IdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Id', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1Reaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Reaction', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1ReactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Reaction', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2Id() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Id', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2IdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Id', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2Reaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Reaction', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2ReactionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Reaction', Sort.desc);
    });
  }
}

extension MatchQueryWhereDistinct on QueryBuilder<Match, Match, QDistinct> {
  QueryBuilder<Match, Match, QDistinct> distinctByIsVisited() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVisited');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser1Id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user1Id');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser1Reaction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user1Reaction',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser2Id() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user2Id');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser2Reaction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user2Reaction',
          caseSensitive: caseSensitive);
    });
  }
}

extension MatchQueryProperty on QueryBuilder<Match, Match, QQueryProperty> {
  QueryBuilder<Match, int, QQueryOperations> matchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchId');
    });
  }

  QueryBuilder<Match, bool, QQueryOperations> isVisitedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVisited');
    });
  }

  QueryBuilder<Match, int, QQueryOperations> user1IdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user1Id');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> user1ReactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user1Reaction');
    });
  }

  QueryBuilder<Match, int, QQueryOperations> user2IdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user2Id');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> user2ReactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user2Reaction');
    });
  }
}
