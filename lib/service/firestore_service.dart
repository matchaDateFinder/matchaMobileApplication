import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';

class FirestoreService {
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

  Future<List<UserFireStoreModel>> getListOfUserFromFireStoreByPhoneNumber(List<String> phoneNumberList) async {
    final userRef = firebaseFirestore.collection("userData");
    final query = userRef.where("userPhoneNumber", whereIn: phoneNumberList);
    List<UserFireStoreModel> listOfUser = [];
    // UserFireStoreModel userDataResult = new UserFireStoreModel(userName: "userName", userPhoneNumber: "", userPhotoLink: "userPhotoLink", userPhotoSize: "userPhotoSize", userGender: "userGender", userBirthday: Timestamp(0,0));
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

}