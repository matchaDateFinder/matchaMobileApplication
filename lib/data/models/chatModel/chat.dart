import 'package:isar/isar.dart';
part 'chat.g.dart';

@collection
@Name("Chat")
class Chat {
  final Id messageId = Isar.autoIncrement;
  late int senderId;
  late int receiverId;
  late String chatMessage;
  late String attachmentLink;
  late String chatStatus;
}