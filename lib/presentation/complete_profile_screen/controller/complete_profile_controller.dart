import 'dart:io';

import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/presentation/complete_profile_screen/models/complete_profile_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_contacts/flutter_contacts.dart';

/// A controller class for the CompleteProfileScreen.
///
/// This class manages the state of the CompleteProfileScreen, including the
/// current completeProfileModelObj
class CompleteProfileController extends GetxController {
  Rx<CompleteProfileModel> completeProfileModelObj = CompleteProfileModel().obs;
  List<String>? contactListInit = [];

  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;

  String photoDownloadURL = '';

  CompleteProfileController() {
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
  }
  var userDetail = new Map();

  @override
  void onInit() async{
    userDetail = Get.arguments;
  }

  Future<void> saveDataToDatabase() async{
    Directory documentDir = await getApplicationDocumentsDirectory();
    File photoFile = await userDetail['photoFile'].copy(path.join(documentDir.path, path.basename(userDetail['fullName']+"-"+userDetail['userPhoneNumber']+path.extension(userDetail["photoPath"]))));
    photoDownloadURL = await _firestore.uploadUserProfilePicture(photoFile);
    List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
    contacts.forEach((element) {
      element.phones.forEach((elementA) {
        contactListInit!.add(elementA.number);
      });
    });
    _saveToFireStoreDB();
    _prefUtils.setLocalUser(convertUserDetailToUserMap());
    _prefUtils.setLoginStatus(true);
  }

  Map<String,dynamic> convertUserDetailToUserMap(){
    Map<String, dynamic> userMap = {};
    userMap['userPhoneNumber'] = userDetail['userPhoneNumber'];
    userMap['photoLink'] = photoDownloadURL;
    userMap['userName'] = userDetail['fullName'];
    return userMap;
  }

  void _saveToFireStoreDB() async {
    UserFireStoreModel _userFireStoreDBModel = new UserFireStoreModel(
        userName: userDetail['fullName'],
        userPhoneNumber: userDetail['userPhoneNumber'],
        userPhotoLink: photoDownloadURL,
        userPhotoSize: userDetail['photoSize'],
        userGender: userDetail['gender'],
        userBirthday: Timestamp.fromDate(userDetail['birthday']),
        userProfession: '',
        userEducation: '',
        userReligion: '',
        userHeight: 0,
        userSmoking: '',
        userDrinking: '',
        userMBTI: '',
        userContactList: contactListInit,
    );
    await _firestore.addUserToFireStore(_userFireStoreDBModel);
  }




}
