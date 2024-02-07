import 'package:isar/isar.dart';
part 'chat.g.dart';

@collection
@Name("Chat")
class Chat {
  final Id chatMessageId = Isar.autoIncrement;
  late String fireStoreMessageId;
  late String chatRoomId;
  late String senderPhoneNumber;
  late String chatMessage;
  late String attachmentLink;
  late String chatStatus;
  late DateTime sentDate;
  late bool isReceived;
}