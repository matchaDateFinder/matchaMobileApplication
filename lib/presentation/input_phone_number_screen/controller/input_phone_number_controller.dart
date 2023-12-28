import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/input_phone_number_screen/models/input_phone_number_model.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

/// A controller class for the InputPhoneNumberScreen.
///
/// This class manages the state of the InputPhoneNumberScreen, including the
/// current inputPhoneNumberModelObj
class InputPhoneNumberController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  Rx<InputPhoneNumberModel> inputPhoneNumberModelObj =
      InputPhoneNumberModel().obs;

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('62').obs;

  String fullPhoneNumber = '62';

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
    fullPhoneNumber = fullPhoneNumber + phoneNumberController.value.text;
    userDetail['userPhoneNumber'] = fullPhoneNumber;
    return true;
  }
}
