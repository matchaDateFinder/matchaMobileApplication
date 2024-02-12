import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/presentation/input_phone_number_screen/models/input_phone_number_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the InputPhoneNumberScreen.
///
/// This class manages the state of the InputPhoneNumberScreen, including the
/// current inputPhoneNumberModelObj
class InputPhoneNumberController extends GetxController {
  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;

  InputPhoneNumberController() {
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
      _prefUtils.setLocalUser(convertMapPreferences(userFromFiresToreDB));
      // TODO subscribe the app to all of the related topic in DB
      return true;
    }else{ // user does not exist
      return false;
    }
  }

  Map<String,dynamic> convertMapPreferences(UserFireStoreModel userFromFireStore){
    Map<String, dynamic> userMap = {};
    userMap["userPhoneNumber"] = userFromFireStore.userPhoneNumber;
    userMap["photoLink"] = userFromFireStore.userPhotoLink;
    return userMap;
  }

  Future<List<String>?> _getContactListFromFireStoreDB(List<String>? contactListFromFireStore) async {
    List<String>? contactList = [];
    contactListFromFireStore?.forEach((element) {
      contactList.add(element);
    });
    return contactList;
  }


}
