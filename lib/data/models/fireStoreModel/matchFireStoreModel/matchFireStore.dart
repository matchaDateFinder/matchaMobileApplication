import 'package:cloud_firestore/cloud_firestore.dart';

class MatchFireStoreModel{
  String? matchId;
  late String user1Name;
  late String user1PhoneNumber;
  late String user2Name;
  late String user2PhoneNumber;
  late bool? user1Reaction;
  late bool? user2Reaction;
  late bool? hasBeenVisitedByUser1;
  late bool? hasBeenVisitedByUser2;


  MatchFireStoreModel({
    required this.user1Name,
    required this.user1PhoneNumber,
    required this.user2Name,
    required this.user2PhoneNumber,
    this.user1Reaction,
    this.user2Reaction,
    this.hasBeenVisitedByUser1,
    this.hasBeenVisitedByUser2
  });

  MatchFireStoreModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    matchId = documentSnapshot.id;
    user1Name = documentSnapshot["user1Name"];
    user1PhoneNumber = documentSnapshot["user1PhoneNumber"];
    user2Name = documentSnapshot["user2Name"];
    user2PhoneNumber = documentSnapshot["user2PhoneNumber"];
    user1Reaction = documentSnapshot["user1Reaction"];
      user2Reaction = documentSnapshot["user2Reaction"];
    hasBeenVisitedByUser1 = documentSnapshot["hasBeenVisitedByUser1"];
    hasBeenVisitedByUser2 = documentSnapshot["hasBeenVisitedByUser2"];
  }

}

