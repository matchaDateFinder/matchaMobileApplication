import 'dart:io';

import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';
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

  late final IsarService _isar;
  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;

  String photoDownloadURL = '';

  CompleteProfileController() {
    _isar = IsarService();
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
  }
  var userDetail = new Map();
  var _userIsarDBModel = new UserModel();

  @override
  void onInit() async{
    userDetail = Get.arguments;
  }

  Future<void> saveDataToDatabase() async{
    Directory documentDir = await getApplicationDocumentsDirectory();
    File photoFile = await userDetail['photoFile'].copy(path.join(documentDir.path, path.basename(userDetail['fullName']+"-"+userDetail['userPhoneNumber']+path.extension(userDetail["photoPath"]))));
    photoDownloadURL = await _firestore.uploadUserProfilePicture(photoFile);
    List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
    // TODO add filter for save only contact that is registered to the firestoreDB and another filter to find and add non existing user
    contacts.forEach((element) {
      element.phones.forEach((elementA) {
        contactListInit!.add(elementA.number);
      });
    });
    _saveToLocalDB(photoFile.path);
    _saveToFireStoreDB();
    _prefUtils.setLoginStatus(true);
  }

  void _saveToLocalDB(String photoFileLocalPath) async {
    _userIsarDBModel = UserModel()
      ..phoneNumber = userDetail['userPhoneNumber']
      ..name = userDetail['fullName']
      ..photoLink = photoFileLocalPath
      ..photoSize = userDetail['photoSize']
      ..age = userDetail['birthday']
      ..gender = userDetail['gender']
      ..profession = ''
      ..education = ''
      ..religion = ''
      ..height = 0
      ..smoking = ''
      ..drinking = ''
      ..mbti = ''
      ..contactList = contactListInit;
    await _isar.saveUser(_userIsarDBModel);
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
