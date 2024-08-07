import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/input_age_screen/models/input_age_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the InputAgeScreen.
///
/// This class manages the state of the InputAgeScreen, including the
/// current inputAgeModelObj
class InputAgeController extends GetxController {
  late final AgeService _ageService;

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

  InputAgeController() {
    _ageService = AgeService();
  }

  @override
  void onInit(){
    userDetail = Get.arguments;
  }

  bool validateForm(){
    userDetail['birthday'] = selectedDate.value;
    return true;
  }

  chooseDate() async{
    DateTime? pickedDate = await showDatePicker(context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1970),
      lastDate: DateTime.now());
    if(pickedDate != null && pickedDate != selectedDate.value){
      if(!_ageService.isAdultAge(pickedDate!)){
        Get.defaultDialog(
          title: "Age must be above 18 years old",
          content: Text("Age must be above 18 years old"),
        );
      }else{
        selectedDate.value = pickedDate;
      }
    }else{
      Get.defaultDialog(
        title: "Date of birth is missing",
        content: Text("Date of birth is missing"),
      );
    }
  }

}
