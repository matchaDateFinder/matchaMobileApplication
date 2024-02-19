import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoomFireStoreModel{
  String? chatRoomId;
  late List<String> participantsNumber;
  late List<String> participantsName;
  late Map<String,int>? unreadMessagesCountFromParticipantA;
  late Map<String,int>? unreadMessagesCountFromParticipantB;


  ChatRoomFireStoreModel({
    required this.participantsNumber,
    required this.participantsName,
    this.unreadMessagesCountFromParticipantA,
    this.unreadMessagesCountFromParticipantB,
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
    unreadMessagesCountFromParticipantA = {};
    documentSnapshot["unreadMessagesCountFromParticipantA"].keys.forEach((key){
      unreadMessagesCountFromParticipantA?[key] = documentSnapshot["unreadMessagesCountFromParticipantA"][key];
    });
    unreadMessagesCountFromParticipantB = {};
    documentSnapshot["unreadMessagesCountFromParticipantB"].keys.forEach((key){
      unreadMessagesCountFromParticipantB?[key] = documentSnapshot["unreadMessagesCountFromParticipantB"][key];
    });
  }

}

