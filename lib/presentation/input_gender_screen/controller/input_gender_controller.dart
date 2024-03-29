import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/input_gender_screen/models/input_gender_model.dart';

/// A controller class for the InputGenderScreen.
///
/// This class manages the state of the InputGenderScreen, including the
/// current inputGenderModelObj
class InputGenderController extends GetxController {
  Rx<InputGenderModel> inputGenderModelObj = InputGenderModel().obs;

  Rx<String> radioGroup = "".obs;

  var userDetail = new Map();

  @override
  void onInit(){
    userDetail = Get.arguments;
  }

  bool validateForm(){
    if(radioGroup.value.tr == ""){
      Get.defaultDialog(
          title: "Please select your gender",
          content: Text("Please select your gender")
      );
      return false;
    }
    userDetail['gender'] = radioGroup.value.tr;
    return true;
  }

}
