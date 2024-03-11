import 'package:cloud_firestore/cloud_firestore.dart';

class UserFireStoreModel {
  late String userId;
  late String userName;
  late String userPhoneNumber;
  late String userPhotoLink;
  late String userPhotoSize;
  late String userGender;
  late Timestamp userBirthday;
  late String? userProfession;
  late String? userEducation;
  late String? userReligion;
  late int? userHeight;
  late String? userSmoking;
  late String? userDrinking;
  late String? userMBTI;
  late List<String>? userContactList;
  late Timestamp? lastRecommendationIsGiven;

  UserFireStoreModel({
    required this.userId,
    required this.userName,
    required this.userPhoneNumber,
    required this.userPhotoLink,
    required this.userPhotoSize,
    required this.userGender,
    required this.userBirthday,
    this.userProfession,
    this.userEducation,
    this.userReligion,
    this.userHeight,
    this.userSmoking,
    this.userDrinking,
    this.userMBTI,
    this.userContactList,
    this.lastRecommendationIsGiven
  });

  UserFireStoreModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    userId = documentSnapshot.id;
    userName = documentSnapshot["userName"];
    userPhoneNumber = documentSnapshot["userPhoneNumber"];
    userPhotoLink = documentSnapshot["userPhotoDownloadLink"];
    userPhotoSize = documentSnapshot["userPhotoSize"];
    userGender = documentSnapshot["userGender"];
    userBirthday = documentSnapshot["userBirthday"];
    userProfession = documentSnapshot["userProfession"];
    userEducation = documentSnapshot["userEducation"];
    userReligion = documentSnapshot["userReligion"];
    userHeight = documentSnapshot["userHeight"];
    userSmoking = documentSnapshot["userSmoking"];
    userDrinking = documentSnapshot["userDrinking"];
    userMBTI = documentSnapshot["userMBTI"];
    userContactList = [];
    documentSnapshot["userContactList"].forEach((element) {
      userContactList!.add(element.toString());
    });
    lastRecommendationIsGiven = documentSnapshot["lastRecommendationIsGiven"];
  }

}