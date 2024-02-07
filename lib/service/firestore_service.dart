import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:matchaapplication/core/app_export.dart';

import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/data/models/fireStoreModel/matchFireStoreModel/matchFireStore.dart';
import 'package:matchaapplication/data/models/fireStoreModel/chatRoomFireStoreModel/chatRoomFireStore.dart';
import 'package:matchaapplication/data/models/fireStoreModel/chatMessageFireStoreModel/chatMessageFireStore.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';

class FirestoreService extends ChangeNotifier{
  late FirebaseFirestore firebaseFirestore;
  late FirebaseStorage firebaseStorage;

  FirestoreService(){
    firebaseFirestore = FirebaseFirestore.instance;
    firebaseStorage = FirebaseStorage.instance;
  }

  Future<void> addUserToFireStore(UserFireStoreModel userModel) async {
    await firebaseFirestore
        .collection('userData')
        .add({
      'userName': userModel.userName,
      'userPhoneNumber': userModel.userPhoneNumber,
      'userPhotoDownloadLink': userModel.userPhotoLink,
      'userPhotoSize': userModel.userPhotoSize,
      'userBirthday': userModel.userBirthday,
      'userGender': userModel.userGender,
      'userProfession': userModel.userProfession,
      'userEducation': userModel.userEducation,
      'userReligion': userModel.userReligion,
      'userHeight': userModel.userHeight,
      'userSmoking': userModel.userSmoking,
      'userDrinking': userModel.userDrinking,
      'userMBTI': userModel.userMBTI,
      'userContactList': userModel.userContactList,
    });
  }

  Future<UserFireStoreModel> getUserFromFireStoreByPhoneNumber(String phoneNumber) async {
    final userRef = firebaseFirestore.collection("userData");
    final query = userRef.where("userPhoneNumber", isEqualTo: phoneNumber);
    UserFireStoreModel userDataResult = new UserFireStoreModel(userName: "userName", userPhoneNumber: "", userPhotoLink: "userPhotoLink", userPhotoSize: "userPhotoSize", userGender: "userGender", userBirthday: Timestamp(0,0));
    await query.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          userDataResult = UserFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot);
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return userDataResult;
  }

  Future<void> updateUserProfileFromFireStoreByPhoneNumber(String phoneNumber, UserModel userData) async {
    UserFireStoreModel userRef = await getUserFromFireStoreByPhoneNumber(phoneNumber);
    firebaseFirestore.collection("userData").doc(userRef.userId).update({
      'userProfession' : userData.profession,
      'userEducation' : userData.education,
      'userReligion' : userData.religion,
      'userHeight' : userData.height,
      'userSmoking' : userData.smoking,
      'userDrinking' : userData.drinking,
      'userMBTI' : userData.mbti,
    });
  }

  Future<void> updateUserLastRecommendationTimeFromFireStoreByPhoneNumber(String phoneNumber, DateTime recommendationTimeIsGiven) async {
    UserFireStoreModel userRef = await getUserFromFireStoreByPhoneNumber(phoneNumber);
    firebaseFirestore.collection("userData").doc(userRef.userId).update({
      'lastRecommendationIsGiven' : Timestamp.fromDate(recommendationTimeIsGiven),
    });
  }

  Future<String> uploadUserProfilePicture(File uploadFile) async {
    final fileName = path.basename(uploadFile.path);
    final destination = 'userProfilePhoto/$fileName';
    try {
      final ref = firebaseStorage
          .ref(destination)
          .child(fileName);
      await ref.putFile(uploadFile!);
      return(ref.getDownloadURL());
    } catch (e) {
      return('error occured');
    }
  }

  Future<String> downloadPhotoFileFromCloudStorage(String userPhotoLink, String userFullName, String userPhoneNumber) async {
    String photoLocalLink = await downloadUserProfilePicture(userPhotoLink, userFullName, userPhoneNumber);
    return photoLocalLink;
  }

  Future<String> downloadUserProfilePicture(String downloadURL, String userName, String phoneNumber) async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    String filePath = '';
    try{
      final httpsReference = firebaseStorage.refFromURL(downloadURL);
      final File tempFile = File(path.join(documentDir.path, path.basename(userName+"-"+phoneNumber+path.extension(httpsReference.fullPath))));
      await httpsReference.writeToFile(tempFile);
      filePath = tempFile.path;
    } catch (e) {
      return("file not found");
    }
    return filePath;
  }

  Future<List<UserFireStoreModel>> getListOfMutualConnectionByPhoneNumberList(List<String> phoneNumberList, String phoneNumber) async {
    final userRef = firebaseFirestore.collection("userData");
    final query = userRef.where("userContactList", arrayContainsAny: phoneNumberList)
                         .where("userPhoneNumber", isNotEqualTo: phoneNumber);
    List<UserFireStoreModel> listOfUser = [];
    await query.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          listOfUser.add(UserFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return listOfUser;
  }

  Future<List<String>> getMatchListByPhoneNumber(String phoneNumber, List<String> phoneNumberList) async {
    final matchRef = firebaseFirestore.collection("matchList");
    final queryForUserAsFirstUser = matchRef.where("user1PhoneNumber", isEqualTo: phoneNumber).where("hasBeenVisitedByUser1", isEqualTo: true);
    final queryForUserAsSecondUser = matchRef.where("user2PhoneNumber", isEqualTo: phoneNumber).where("hasBeenVisitedByUser2", isEqualTo: true);
    List<String> result = [];
    List<String> queryResult = [];
    await queryForUserAsFirstUser.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          queryResult.add(MatchFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot).user2PhoneNumber);
        }
      },
      onError: (e) => print("Error completing query 1: $e"),
    );
    await queryForUserAsSecondUser.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          queryResult.add(MatchFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot).user1PhoneNumber);
        }
      },
      onError: (e) => print("Error completing query 2: $e"),
    );
    phoneNumberList.forEach((element) {
      if(!(queryResult.contains(element))){
        result.add(element);
      }
    });
    return result;
  }

  Future<List<MatchFireStoreModel>> checkIfMatchExistsInFirestoreDB(String userPhoneNumber1, String userPhoneNumber2) async {
    final matchRef = firebaseFirestore.collection("matchList");
    final queryForUserAsFirstUser = matchRef.where("user1PhoneNumber", isEqualTo: userPhoneNumber1).where("user2PhoneNumber", isEqualTo: userPhoneNumber2);
    final queryForUserAsSecondUser = matchRef.where("user2PhoneNumber", isEqualTo: userPhoneNumber1).where("user1PhoneNumber", isEqualTo: userPhoneNumber2);
    List<MatchFireStoreModel> result = [];
    await queryForUserAsFirstUser.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          result.add(MatchFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot));
        }
      },
      onError: (e) => print("Error completing query 1: $e"),
    );
    await queryForUserAsSecondUser.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          result.add(MatchFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot));
        }
      },
      onError: (e) => print("Error completing query 2: $e"),
    );
    return result;
  }

  Future<void> addMatchToFireStore(MatchFireStoreModel matchModel) async {
    await firebaseFirestore
        .collection('matchList')
        .add({
      'user1Name': matchModel.user1Name,
      'user1PhoneNumber': matchModel.user1PhoneNumber,
      'user2Name': matchModel.user2Name,
      'user2PhoneNumber': matchModel.user2PhoneNumber,
      'user1Reaction': matchModel.user1Reaction,
      'user2Reaction': false,
      'hasBeenVisitedByUser1': matchModel.hasBeenVisitedByUser1,
      'hasBeenVisitedByUser2': false,
    });
  }

  Future<void> updateMatchingInFireStore(MatchFireStoreModel matchModel, bool user2Reaction) async {
    firebaseFirestore.collection("userData").doc(matchModel.matchId).update({
      'user2Reaction' : user2Reaction,
      'hasBeenVisitedByUser2' : true
    });
  }

  Future<void> createNewChatRoomInFireStore(ChatRoomFireStoreModel chatRoomFireStoreModel) async {
    await firebaseFirestore
        .collection('chatRoom')
        .add({
      'participantsNumber' : chatRoomFireStoreModel.participantsNumber,
      'participantsName' : chatRoomFireStoreModel.participantsName,
      'chatBoxStatus' : chatRoomFireStoreModel.chatBoxStatus,
      'chatCount' : chatRoomFireStoreModel.chatCount,
      'chatUnreadCount' : chatRoomFireStoreModel.chatUnreadCount,
    });
  }

  Future<List<ChatRoomFireStoreModel>> getChatRoomForUser(String phoneNumber) async {
    List<ChatRoomFireStoreModel> result = [];
    final chatRoomRef = firebaseFirestore.collection("chatRoom");
    final query = chatRoomRef.where("participantsNumber", arrayContains: phoneNumber);
    await query.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          result.add(ChatRoomFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return result;
  }

  Future<List<ChatMessageFireStoreModel>> getChatMessage(String chatRoomId, String userPhoneNumber, String matchPhoneNumber) async {
    List<ChatMessageFireStoreModel> result = [];
    final chatMessageRef = firebaseFirestore.collection("chatMessage");
    final query = chatMessageRef.where("chatRoomId", isEqualTo: chatRoomId).where("senderPhoneNumber", whereIn: [userPhoneNumber, matchPhoneNumber]).orderBy("sentDate");
    await query.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          result.add(ChatMessageFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot));
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return result;
  }

  Future<void> sendChatMessage(ChatMessageFireStoreModel newChat) async {
    await firebaseFirestore
        .collection('chatMessage')
        .add({
      'chatRoomId' : newChat.chatRoomId,
      'senderPhoneNumber' : newChat.senderPhoneNumber,
      'chatMessage' : newChat.chatMessage,
      'attachmentLink' : newChat.attachmentLink,
      'chatStatus' : newChat.chatStatus,
      'sentDate' : newChat.sentDate,
      'isReceived' : newChat.isReceived,
    });
  }

  Stream<QuerySnapshot> getMessage(String chatRoomId, String userPhoneNumber, String matchPhoneNumber) {
    return firebaseFirestore
                .collection("chatMessage")
                .where("chatRoomId", isEqualTo: chatRoomId)
                .where("senderPhoneNumber", whereIn: [userPhoneNumber, matchPhoneNumber])
                .orderBy("sentDate")
                .snapshots();
  }

  Future<String> getUserPhotoLinkFromFireStoreByPhoneNumber(String phoneNumber) async {
    final userRef = firebaseFirestore.collection("userData");
    final query = userRef.where("userPhoneNumber", isEqualTo: phoneNumber);
    String userDataResult = "";
    await query.get().then(
          (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          userDataResult = UserFireStoreModel.fromDocumentSnapshot(documentSnapshot: docSnapshot).userPhotoLink;
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
    return userDataResult;
  }
}