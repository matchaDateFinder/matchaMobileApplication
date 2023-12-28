import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/input_name_screen/models/input_name_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the InputNameScreen.
///
/// This class manages the state of the InputNameScreen, including the
/// current inputNameModelObj
class InputNameController extends GetxController {
  TextEditingController inputPlaceholderController = TextEditingController();

  Rx<InputNameModel> inputNameModelObj = InputNameModel().obs;

  var userDetail = new Map();

  @override
  void onInit(){
    userDetail = Get.arguments;
  }

  @override
  void onClose() {
    super.onClose();
    inputPlaceholderController.dispose();
  }

  bool validateForm(){
    if(inputPlaceholderController == null){
      print("missing");
      return false;
    }
    if(inputPlaceholderController.value.text.length == 0){
      print("missing");
      return false;
    }
    userDetail['fullName'] = inputPlaceholderController.value.text;
    return true;
  }

}
