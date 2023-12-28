import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/input_age_screen/models/input_age_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the InputAgeScreen.
///
/// This class manages the state of the InputAgeScreen, including the
/// current inputAgeModelObj
class InputAgeController extends GetxController {
  Rx<InputAgeModel> inputAgeModelObj = InputAgeModel().obs;
  var selectedDate = DateTime.now().obs;

  TextEditingController inputPlaceholderController = TextEditingController();
  SelectionPopupModel? selectedDropDownValue;

  onSelected(dynamic value) {
    for (var element in inputAgeModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    inputAgeModelObj.value.dropdownItemList.refresh();
  }

  var userDetail = new Map();

  @override
  void onInit(){
    userDetail = Get.arguments;
  }

  bool validateForm(){
    print(inputAgeModelObj.value);
    print(selectedDropDownValue);
    userDetail['birthday'] = selectedDate.value;
    return true;
  }

  chooseDate() async{
    DateTime? pickedDate = await showDatePicker(context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1970),
      lastDate: DateTime.now());
    if(pickedDate != null && pickedDate!=selectedDate.value){
      selectedDate.value = pickedDate;
    }
  }

}
