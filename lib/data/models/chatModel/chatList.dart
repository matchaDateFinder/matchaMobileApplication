import 'package:isar/isar.dart';
part 'chatList.g.dart';

@collection
@Name("ChatList")
class ChatList {
  @Index(unique: true, replace: true)
  final Id chatListId = Isar.autoIncrement;
  late String senderNumber;
  late String receiverNumber;
  late int chatBoxStatus;
  late int chatCount;
  late int chatUnreadCount;
}