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
  FirebaseAuth _auth = FirebaseAuth.instance;
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
    if(phoneNumberController.value.text.length < 8 || phoneNumberController.value.text.length > 12 ){
      Get.defaultDialog(
          title: "Phone Number Length is not Valid",
          content: Text("Input phone number length between 8 to 12")
      );
      return false;
    }
    if(!phoneNumberController.value.text.isNumericOnly){
      Get.defaultDialog(
          title: "Only Numeric Input",
          content: Text("Only Numeric Input")
      );
      return false;
    }
    fullPhoneNumber = selectedCountry.value.phoneCode + phoneNumberController.value.text;
    userDetail['userPhoneNumber'] = fullPhoneNumber;
    return true;
  }

}
