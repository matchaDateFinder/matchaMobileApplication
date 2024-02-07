import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageFireStoreModel{
  String? chatMessageId;
  late String chatRoomId;
  late String senderPhoneNumber;
  late String chatMessage;
  late String attachmentLink;
  late String chatStatus;
  late Timestamp sentDate;
  late bool isReceived;


  ChatMessageFireStoreModel({
    required this.chatRoomId,
    required this.senderPhoneNumber,
    required this.chatMessage,
    required this.attachmentLink,
    required this.chatStatus,
    required this.sentDate,
    required this.isReceived,
  });

  ChatMessageFireStoreModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    chatMessageId = documentSnapshot.id;
    chatRoomId = documentSnapshot["chatRoomId"];
    senderPhoneNumber = documentSnapshot["senderPhoneNumber"];
    chatMessage = documentSnapshot["chatMessage"];
    attachmentLink = documentSnapshot["attachmentLink"];
    chatStatus = documentSnapshot["chatStatus"];
    sentDate = documentSnapshot["sentDate"];
    isReceived = documentSnapshot["isReceived"];
  }

}

