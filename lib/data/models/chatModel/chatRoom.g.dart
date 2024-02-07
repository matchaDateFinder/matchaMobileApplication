// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatRoom.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChatRoomCollection on Isar {
  IsarCollection<ChatRoom> get chatRooms => this.collection();
}

const ChatRoomSchema = CollectionSchema(
  name: r'ChatRoom',
  id: 3645375135519982771,
  properties: {
    r'chatBoxStatus': PropertySchema(
      id: 0,
      name: r'chatBoxStatus',
      type: IsarType.long,
    ),
    r'chatCount': PropertySchema(
      id: 1,
      name: r'chatCount',
      type: IsarType.long,
    ),
    r'chatUnreadCount': PropertySchema(
      id: 2,
      name: r'chatUnreadCount',
      type: IsarType.long,
    ),
    r'participantsNumber': PropertySchema(
      id: 3,
      name: r'participantsNumber',
      type: IsarType.stringList,
    )
  },
  estimateSize: _chatRoomEstimateSize,
  serialize: _chatRoomSerialize,
  deserialize: _chatRoomDeserialize,
  deserializeProp: _chatRoomDeserializeProp,
  idName: r'chatRoomId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chatRoomGetId,
  getLinks: _chatRoomGetLinks,
  attach: _chatRoomAttach,
  version: '3.1.0+1',
);

int _chatRoomEstimateSize(
  ChatRoom object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.participantsNumber.length * 3;
  {
    for (var i = 0; i < object.participantsNumber.length; i++) {
      final value = object.participantsNumber[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _chatRoomSerialize(
  ChatRoom object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chatBoxStatus);
  writer.writeLong(offsets[1], object.chatCount);
  writer.writeLong(offsets[2], object.chatUnreadCount);
  writer.writeStringList(offsets[3], object.participantsNumber);
}

ChatRoom _chatRoomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChatRoom();
  object.chatBoxStatus = reader.readLong(offsets[0]);
  object.chatCount = reader.readLong(offsets[1]);
  object.chatUnreadCount = reader.readLong(offsets[2]);
  object.participantsNumber = reader.readStringList(offsets[3]) ?? [];
  return object;
}

P _chatRoomDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chatRoomGetId(ChatRoom object) {
  return object.chatRoomId;
}

List<IsarLinkBase<dynamic>> _chatRoomGetLinks(ChatRoom object) {
  return [];
}

void _chatRoomAttach(IsarCollection<dynamic> col, Id id, ChatRoom object) {}

extension ChatRoomQueryWhereSort on QueryBuilder<ChatRoom, ChatRoom, QWhere> {
  QueryBuilder<ChatRoom, ChatRoom, QAfterWhere> anyChatRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChatRoomQueryWhere on QueryBuilder<ChatRoom, ChatRoom, QWhereClause> {
  QueryBuilder<ChatRoom, ChatRoom, QAfterWhereClause> chatRoomIdEqualTo(
      Id chatRoomId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: chatRoomId,
        upper: chatRoomId,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterWhereClause> chatRoomIdNotEqualTo(
      Id chatRoomId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: chatRoomId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: chatRoomId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: chatRoomId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: chatRoomId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterWhereClause> chatRoomIdGreaterThan(
      Id chatRoomId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: chatRoomId, includeLower: include),
      );
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterWhereClause> chatRoomIdLessThan(
      Id chatRoomId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: chatRoomId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterWhereClause> chatRoomIdBetween(
    Id lowerChatRoomId,
    Id upperChatRoomId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerChatRoomId,
        includeLower: includeLower,
        upper: upperChatRoomId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChatRoomQueryFilter
    on QueryBuilder<ChatRoom, ChatRoom, QFilterCondition> {
  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatBoxStatusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatBoxStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      chatBoxStatusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatBoxStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatBoxStatusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatBoxStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatBoxStatusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatBoxStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatRoomIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatRoomId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatRoomIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatRoomId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatRoomIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatRoomId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition> chatRoomIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatRoomId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      chatUnreadCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatUnreadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      chatUnreadCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatUnreadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      chatUnreadCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatUnreadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      chatUnreadCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatUnreadCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'participantsNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'participantsNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'participantsNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'participantsNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'participantsNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'participantsNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'participantsNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'participantsNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'participantsNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'participantsNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantsNumber',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantsNumber',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantsNumber',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantsNumber',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantsNumber',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterFilterCondition>
      participantsNumberLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'participantsNumber',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension ChatRoomQueryObject
    on QueryBuilder<ChatRoom, ChatRoom, QFilterCondition> {}

extension ChatRoomQueryLinks
    on QueryBuilder<ChatRoom, ChatRoom, QFilterCondition> {}

extension ChatRoomQuerySortBy on QueryBuilder<ChatRoom, ChatRoom, QSortBy> {
  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> sortByChatBoxStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.asc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> sortByChatBoxStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.desc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> sortByChatCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.asc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> sortByChatCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.desc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> sortByChatUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.asc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> sortByChatUnreadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.desc);
    });
  }
}

extension ChatRoomQuerySortThenBy
    on QueryBuilder<ChatRoom, ChatRoom, QSortThenBy> {
  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatBoxStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.asc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatBoxStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.desc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.asc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.desc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatRoomId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatRoomId', Sort.asc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatRoomIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatRoomId', Sort.desc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.asc);
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QAfterSortBy> thenByChatUnreadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.desc);
    });
  }
}

extension ChatRoomQueryWhereDistinct
    on QueryBuilder<ChatRoom, ChatRoom, QDistinct> {
  QueryBuilder<ChatRoom, ChatRoom, QDistinct> distinctByChatBoxStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatBoxStatus');
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QDistinct> distinctByChatCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatCount');
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QDistinct> distinctByChatUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatUnreadCount');
    });
  }

  QueryBuilder<ChatRoom, ChatRoom, QDistinct> distinctByParticipantsNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'participantsNumber');
    });
  }
}

extension ChatRoomQueryProperty
    on QueryBuilder<ChatRoom, ChatRoom, QQueryProperty> {
  QueryBuilder<ChatRoom, int, QQueryOperations> chatRoomIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatRoomId');
    });
  }

  QueryBuilder<ChatRoom, int, QQueryOperations> chatBoxStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatBoxStatus');
    });
  }

  QueryBuilder<ChatRoom, int, QQueryOperations> chatCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatCount');
    });
  }

  QueryBuilder<ChatRoom, int, QQueryOperations> chatUnreadCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatUnreadCount');
    });
  }

  QueryBuilder<ChatRoom, List<String>, QQueryOperations>
      participantsNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'participantsNumber');
    });
  }
}
