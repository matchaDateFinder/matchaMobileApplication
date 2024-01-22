// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatList.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChatListCollection on Isar {
  IsarCollection<ChatList> get chatLists => this.collection();
}

const ChatListSchema = CollectionSchema(
  name: r'ChatList',
  id: 1276879455473298040,
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
    r'receiverNumber': PropertySchema(
      id: 3,
      name: r'receiverNumber',
      type: IsarType.string,
    ),
    r'senderNumber': PropertySchema(
      id: 4,
      name: r'senderNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _chatListEstimateSize,
  serialize: _chatListSerialize,
  deserialize: _chatListDeserialize,
  deserializeProp: _chatListDeserializeProp,
  idName: r'chatListId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _chatListGetId,
  getLinks: _chatListGetLinks,
  attach: _chatListAttach,
  version: '3.1.0+1',
);

int _chatListEstimateSize(
  ChatList object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.receiverNumber.length * 3;
  bytesCount += 3 + object.senderNumber.length * 3;
  return bytesCount;
}

void _chatListSerialize(
  ChatList object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.chatBoxStatus);
  writer.writeLong(offsets[1], object.chatCount);
  writer.writeLong(offsets[2], object.chatUnreadCount);
  writer.writeString(offsets[3], object.receiverNumber);
  writer.writeString(offsets[4], object.senderNumber);
}

ChatList _chatListDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChatList();
  object.chatBoxStatus = reader.readLong(offsets[0]);
  object.chatCount = reader.readLong(offsets[1]);
  object.chatUnreadCount = reader.readLong(offsets[2]);
  object.receiverNumber = reader.readString(offsets[3]);
  object.senderNumber = reader.readString(offsets[4]);
  return object;
}

P _chatListDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _chatListGetId(ChatList object) {
  return object.chatListId;
}

List<IsarLinkBase<dynamic>> _chatListGetLinks(ChatList object) {
  return [];
}

void _chatListAttach(IsarCollection<dynamic> col, Id id, ChatList object) {}

extension ChatListQueryWhereSort on QueryBuilder<ChatList, ChatList, QWhere> {
  QueryBuilder<ChatList, ChatList, QAfterWhere> anyChatListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChatListQueryWhere on QueryBuilder<ChatList, ChatList, QWhereClause> {
  QueryBuilder<ChatList, ChatList, QAfterWhereClause> chatListIdEqualTo(
      Id chatListId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: chatListId,
        upper: chatListId,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterWhereClause> chatListIdNotEqualTo(
      Id chatListId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: chatListId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: chatListId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: chatListId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: chatListId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterWhereClause> chatListIdGreaterThan(
      Id chatListId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: chatListId, includeLower: include),
      );
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterWhereClause> chatListIdLessThan(
      Id chatListId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: chatListId, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterWhereClause> chatListIdBetween(
    Id lowerChatListId,
    Id upperChatListId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerChatListId,
        includeLower: includeLower,
        upper: upperChatListId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChatListQueryFilter
    on QueryBuilder<ChatList, ChatList, QFilterCondition> {
  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatBoxStatusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatBoxStatus',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatBoxStatusLessThan(
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatBoxStatusBetween(
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatCountGreaterThan(
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatCountLessThan(
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatCountBetween(
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatListIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatListId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatListIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatListId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatListIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatListId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> chatListIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatListId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      chatUnreadCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatUnreadCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
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

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> receiverNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      receiverNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      receiverNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> receiverNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      receiverNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      receiverNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      receiverNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> receiverNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      receiverNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      receiverNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> senderNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      senderNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> senderNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> senderNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      senderNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> senderNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> senderNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition> senderNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      senderNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterFilterCondition>
      senderNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderNumber',
        value: '',
      ));
    });
  }
}

extension ChatListQueryObject
    on QueryBuilder<ChatList, ChatList, QFilterCondition> {}

extension ChatListQueryLinks
    on QueryBuilder<ChatList, ChatList, QFilterCondition> {}

extension ChatListQuerySortBy on QueryBuilder<ChatList, ChatList, QSortBy> {
  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByChatBoxStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByChatBoxStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByChatCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByChatCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByChatUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByChatUnreadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByReceiverNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverNumber', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortByReceiverNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverNumber', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortBySenderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderNumber', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> sortBySenderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderNumber', Sort.desc);
    });
  }
}

extension ChatListQuerySortThenBy
    on QueryBuilder<ChatList, ChatList, QSortThenBy> {
  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatBoxStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatBoxStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatBoxStatus', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatCount', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatListId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatListId', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatListIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatListId', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByChatUnreadCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatUnreadCount', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByReceiverNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverNumber', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenByReceiverNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverNumber', Sort.desc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenBySenderNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderNumber', Sort.asc);
    });
  }

  QueryBuilder<ChatList, ChatList, QAfterSortBy> thenBySenderNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderNumber', Sort.desc);
    });
  }
}

extension ChatListQueryWhereDistinct
    on QueryBuilder<ChatList, ChatList, QDistinct> {
  QueryBuilder<ChatList, ChatList, QDistinct> distinctByChatBoxStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatBoxStatus');
    });
  }

  QueryBuilder<ChatList, ChatList, QDistinct> distinctByChatCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatCount');
    });
  }

  QueryBuilder<ChatList, ChatList, QDistinct> distinctByChatUnreadCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatUnreadCount');
    });
  }

  QueryBuilder<ChatList, ChatList, QDistinct> distinctByReceiverNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChatList, ChatList, QDistinct> distinctBySenderNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderNumber', caseSensitive: caseSensitive);
    });
  }
}

extension ChatListQueryProperty
    on QueryBuilder<ChatList, ChatList, QQueryProperty> {
  QueryBuilder<ChatList, int, QQueryOperations> chatListIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatListId');
    });
  }

  QueryBuilder<ChatList, int, QQueryOperations> chatBoxStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatBoxStatus');
    });
  }

  QueryBuilder<ChatList, int, QQueryOperations> chatCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatCount');
    });
  }

  QueryBuilder<ChatList, int, QQueryOperations> chatUnreadCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatUnreadCount');
    });
  }

  QueryBuilder<ChatList, String, QQueryOperations> receiverNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverNumber');
    });
  }

  QueryBuilder<ChatList, String, QQueryOperations> senderNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderNumber');
    });
  }
}
