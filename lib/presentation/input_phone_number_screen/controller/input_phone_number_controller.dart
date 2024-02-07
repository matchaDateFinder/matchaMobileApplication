import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';
import 'package:matchaapplication/presentation/input_phone_number_screen/models/input_phone_number_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the InputPhoneNumberScreen.
///
/// This class manages the state of the InputPhoneNumberScreen, including the
/// current inputPhoneNumberModelObj
class InputPhoneNumberController extends GetxController {
  late final IsarService _isar;
  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;

  InputPhoneNumberController() {
    _isar = IsarService();
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
  }

  TextEditingController phoneNumberController = TextEditingController();

  Rx<InputPhoneNumberModel> inputPhoneNumberModelObj =
      InputPhoneNumberModel().obs;

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('62').obs;

  String fullPhoneNumber = '';

  var userDetail = new Map();

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
  }

  bool validateForm(){
    if(!phoneNumberController.value.text.isNumericOnly){
      print("is num only");
      return false;
    }
    if(phoneNumberController.value.text.length < 8 || phoneNumberController.value.text.length > 12 ){
      print("len not valid");
      return false;
    }
    if(phoneNumberController == null){
      print("missing");
      return false;
    }
    fullPhoneNumber = selectedCountry.value.phoneCode + phoneNumberController.value.text;
    userDetail['userPhoneNumber'] = fullPhoneNumber;
    return true;
  }

  Future<bool> checkForExistingUser() async{
    final userFromFiresToreDB = await _firestore.getUserFromFireStoreByPhoneNumber(fullPhoneNumber);
    if (userFromFiresToreDB.userName != "userName" && userFromFiresToreDB.userPhoneNumber != "") { // user exists
      _prefUtils.setLoginStatus(true);
      await _saveUserDataFromFireStoreToIsarDB(userFromFiresToreDB);
      // TODO subscribe the app to all of the related topic in DB
      return true;
    }else{ // user does not exist
      return false;
    }
  }

  Future<void> _saveUserDataFromFireStoreToIsarDB(UserFireStoreModel userFromFireStoreDB) async {
    String photoFileLocalPath = await _firestore.downloadPhotoFileFromCloudStorage(userFromFireStoreDB.userPhotoLink, userFromFireStoreDB.userName, userFromFireStoreDB.userPhoneNumber);
    List<String>? contactList = await _getContactListFromFireStoreDB(userFromFireStoreDB.userContactList);
    UserModel userIsarDBModel = UserModel()
      ..phoneNumber = userFromFireStoreDB.userPhoneNumber
      ..name = userFromFireStoreDB.userName
      ..photoLink = photoFileLocalPath
      ..photoSize = userFromFireStoreDB.userPhotoSize
      ..age = userFromFireStoreDB.userBirthday.toDate()
      ..gender = userFromFireStoreDB.userGender
      ..profession = userFromFireStoreDB.userProfession
      ..education = userFromFireStoreDB.userEducation
      ..religion = userFromFireStoreDB.userReligion
      ..height = userFromFireStoreDB.userHeight
      ..smoking = userFromFireStoreDB.userSmoking
      ..drinking = userFromFireStoreDB.userDrinking
      ..mbti = userFromFireStoreDB.userMBTI
      ..contactList = contactList
      ..lastRecommendationIsGiven = userFromFireStoreDB.lastRecommendationIsGiven!.toDate();
    await _isar.saveUser(userIsarDBModel);
  }

  Future<List<String>?> _getContactListFromFireStoreDB(List<String>? contactListFromFireStore) async {
    List<String>? contactList = [];
    contactListFromFireStore?.forEach((element) {
      contactList.add(element);
    });
    return contactList;
  }


}
