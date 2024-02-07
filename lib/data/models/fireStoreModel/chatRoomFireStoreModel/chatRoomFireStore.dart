import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomFireStoreModel{
  String? chatRoomId;
  late List<String> participantsNumber;
  late List<String> participantsName;
  late int? chatBoxStatus;
  late int? chatCount;
  late int? chatUnreadCount;


  ChatRoomFireStoreModel({
    required this.participantsNumber,
    required this.participantsName,
    this.chatBoxStatus,
    this.chatCount,
    this.chatUnreadCount,
  });

  ChatRoomFireStoreModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    chatRoomId = documentSnapshot.id;
    participantsNumber = [];
    documentSnapshot["participantsNumber"].forEach((participantNumber) {
      participantsNumber.add(participantNumber);
    });
    participantsName = [];
    documentSnapshot["participantsName"].forEach((participantName) {
      participantsName.add(participantName);
    });
    chatBoxStatus = documentSnapshot["chatBoxStatus"];
    chatCount = documentSnapshot["chatCount"];
    chatUnreadCount = documentSnapshot["chatUnreadCount"];
  }

}

