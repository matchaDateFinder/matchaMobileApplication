import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/edit_profile_two_screen/models/edit_profile_two_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the EditProfileTwoScreen.
///
/// This class manages the state of the EditProfileTwoScreen, including the
/// current editProfileTwoModelObj
class EditProfileTwoController extends GetxController {
  TextEditingController answerreligionController = TextEditingController();

  Rx<EditProfileTwoModel> editProfileTwoModelObj = EditProfileTwoModel().obs;

  Rx<String> radioGroup = "".obs;

  Rx<String> radioGroup1 = "".obs;

  Rx<String> doYouSmoke = "".obs;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  @override
  void onClose() {
    super.onClose();
    answerreligionController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in editProfileTwoModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editProfileTwoModelObj.value.dropdownItemList.refresh();
  }

  onSelected1(dynamic value) {
    for (var element in editProfileTwoModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editProfileTwoModelObj.value.dropdownItemList1.refresh();
  }

  onSelected2(dynamic value) {
    for (var element in editProfileTwoModelObj.value.dropdownItemList2.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editProfileTwoModelObj.value.dropdownItemList2.refresh();
  }
}
