import 'package:isar/isar.dart';
part 'chatRoom.g.dart';

@collection
@Name("ChatRoom")
class ChatRoom {
  @Index(unique: true, replace: true)
  final Id chatRoomId = Isar.autoIncrement;
  late List<String> participantsNumber;
  late int chatBoxStatus;
  late int chatCount;
  late int chatUnreadCount;
}