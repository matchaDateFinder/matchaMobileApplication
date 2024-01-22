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
    r'isVisitedByUser1': PropertySchema(
      id: 0,
      name: r'isVisitedByUser1',
      type: IsarType.bool,
    ),
    r'isVisitedByUser2': PropertySchema(
      id: 1,
      name: r'isVisitedByUser2',
      type: IsarType.bool,
    ),
    r'user1Name': PropertySchema(
      id: 2,
      name: r'user1Name',
      type: IsarType.string,
    ),
    r'user1PhoneNumber': PropertySchema(
      id: 3,
      name: r'user1PhoneNumber',
      type: IsarType.string,
    ),
    r'user1Reaction': PropertySchema(
      id: 4,
      name: r'user1Reaction',
      type: IsarType.bool,
    ),
    r'user2Name': PropertySchema(
      id: 5,
      name: r'user2Name',
      type: IsarType.string,
    ),
    r'user2PhoneNumber': PropertySchema(
      id: 6,
      name: r'user2PhoneNumber',
      type: IsarType.string,
    ),
    r'user2Reaction': PropertySchema(
      id: 7,
      name: r'user2Reaction',
      type: IsarType.bool,
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
  bytesCount += 3 + object.user1Name.length * 3;
  bytesCount += 3 + object.user1PhoneNumber.length * 3;
  bytesCount += 3 + object.user2Name.length * 3;
  bytesCount += 3 + object.user2PhoneNumber.length * 3;
  return bytesCount;
}

void _matchSerialize(
  Match object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isVisitedByUser1);
  writer.writeBool(offsets[1], object.isVisitedByUser2);
  writer.writeString(offsets[2], object.user1Name);
  writer.writeString(offsets[3], object.user1PhoneNumber);
  writer.writeBool(offsets[4], object.user1Reaction);
  writer.writeString(offsets[5], object.user2Name);
  writer.writeString(offsets[6], object.user2PhoneNumber);
  writer.writeBool(offsets[7], object.user2Reaction);
}

Match _matchDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Match();
  object.isVisitedByUser1 = reader.readBoolOrNull(offsets[0]);
  object.isVisitedByUser2 = reader.readBoolOrNull(offsets[1]);
  object.user1Name = reader.readString(offsets[2]);
  object.user1PhoneNumber = reader.readString(offsets[3]);
  object.user1Reaction = reader.readBoolOrNull(offsets[4]);
  object.user2Name = reader.readString(offsets[5]);
  object.user2PhoneNumber = reader.readString(offsets[6]);
  object.user2Reaction = reader.readBoolOrNull(offsets[7]);
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
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readBoolOrNull(offset)) as P;
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
  QueryBuilder<Match, Match, QAfterFilterCondition> isVisitedByUser1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isVisitedByUser1',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition>
      isVisitedByUser1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isVisitedByUser1',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> isVisitedByUser1EqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVisitedByUser1',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> isVisitedByUser2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isVisitedByUser2',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition>
      isVisitedByUser2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isVisitedByUser2',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> isVisitedByUser2EqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isVisitedByUser2',
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

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user1Name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'user1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'user1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'user1Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'user1Name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1Name',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1NameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'user1Name',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user1PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user1PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user1PhoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'user1PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'user1PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'user1PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'user1PhoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1PhoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1PhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition>
      user1PhoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'user1PhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'user1Reaction',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'user1Reaction',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user1ReactionEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user1Reaction',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user2Name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'user2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'user2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'user2Name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'user2Name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2Name',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2NameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'user2Name',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'user2PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'user2PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'user2PhoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'user2PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'user2PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'user2PhoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'user2PhoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2PhoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2PhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition>
      user2PhoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'user2PhoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'user2Reaction',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'user2Reaction',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> user2ReactionEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'user2Reaction',
        value: value,
      ));
    });
  }
}

extension MatchQueryObject on QueryBuilder<Match, Match, QFilterCondition> {}

extension MatchQueryLinks on QueryBuilder<Match, Match, QFilterCondition> {}

extension MatchQuerySortBy on QueryBuilder<Match, Match, QSortBy> {
  QueryBuilder<Match, Match, QAfterSortBy> sortByIsVisitedByUser1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser1', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByIsVisitedByUser1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser1', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByIsVisitedByUser2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser2', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByIsVisitedByUser2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser2', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Name', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Name', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1PhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1PhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser1PhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1PhoneNumber', Sort.desc);
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

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Name', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Name', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2PhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2PhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByUser2PhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2PhoneNumber', Sort.desc);
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
  QueryBuilder<Match, Match, QAfterSortBy> thenByIsVisitedByUser1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser1', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByIsVisitedByUser1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser1', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByIsVisitedByUser2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser2', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByIsVisitedByUser2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isVisitedByUser2', Sort.desc);
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

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Name', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1Name', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1PhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1PhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser1PhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user1PhoneNumber', Sort.desc);
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

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2Name() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Name', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2NameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2Name', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2PhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2PhoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByUser2PhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'user2PhoneNumber', Sort.desc);
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
  QueryBuilder<Match, Match, QDistinct> distinctByIsVisitedByUser1() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVisitedByUser1');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByIsVisitedByUser2() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isVisitedByUser2');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser1Name(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user1Name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser1PhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user1PhoneNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser1Reaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user1Reaction');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser2Name(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user2Name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser2PhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user2PhoneNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByUser2Reaction() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'user2Reaction');
    });
  }
}

extension MatchQueryProperty on QueryBuilder<Match, Match, QQueryProperty> {
  QueryBuilder<Match, int, QQueryOperations> matchIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'matchId');
    });
  }

  QueryBuilder<Match, bool?, QQueryOperations> isVisitedByUser1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVisitedByUser1');
    });
  }

  QueryBuilder<Match, bool?, QQueryOperations> isVisitedByUser2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isVisitedByUser2');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> user1NameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user1Name');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> user1PhoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user1PhoneNumber');
    });
  }

  QueryBuilder<Match, bool?, QQueryOperations> user1ReactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user1Reaction');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> user2NameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user2Name');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> user2PhoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user2PhoneNumber');
    });
  }

  QueryBuilder<Match, bool?, QQueryOperations> user2ReactionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'user2Reaction');
    });
  }
}
