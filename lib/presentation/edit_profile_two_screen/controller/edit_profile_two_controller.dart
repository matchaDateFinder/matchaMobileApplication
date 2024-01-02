import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/edit_profile_two_screen/models/edit_profile_two_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/service/isar_service.dart';
/// A controller class for the EditProfileTwoScreen.
///
/// This class manages the state of the EditProfileTwoScreen, including the
/// current editProfileTwoModelObj
class EditProfileTwoController extends GetxController {

  late final IsarService _isar;

  EditProfileTwoController() {
    _isar = IsarService();
  }

  TextEditingController answerProfessionController = TextEditingController();

  Rx<EditProfileTwoModel> editProfileTwoModelObj = EditProfileTwoModel().obs;

  Rx<String> educationRadioGroup = "".obs;

  Rx<String> drinkingRadioGroup = "".obs;

  Rx<String> smokingRadioGroup = "".obs;

  final phoneNumber = Get.arguments;

  var userData;
  var userReligion;
  var userMBTI;

  @override
  void onInit() async{
    userData = await _isar.getUserByPhoneNumber(phoneNumber);
  }

  @override
  void onClose() {
    super.onClose();
    answerProfessionController.dispose();
  }

  onSelectReligion(dynamic value) {
    for (var element in editProfileTwoModelObj.value.religionDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
        userReligion = element.title;
      }
    }
    editProfileTwoModelObj.value.religionDropdownItemList.refresh();
  }

  onSelected1(dynamic value) { // need change to text field
    for (var element in editProfileTwoModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    editProfileTwoModelObj.value.dropdownItemList1.refresh();
  }

  onSelectMBTI(dynamic value) {
    for (var element in editProfileTwoModelObj.value.mbtiDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
        userMBTI = element.title;
      }
    }
    editProfileTwoModelObj.value.mbtiDropdownItemList.refresh();
  }

  void saveUserProfile() async{
    userData.profession = answerProfessionController.value.text;
    userData.education = educationRadioGroup.value;
    userData.religion = userReligion;
    userData.height = 100;
    userData.smoking = smokingRadioGroup.value;
    userData.drinking = drinkingRadioGroup.value;
    userData.mbti = userMBTI;
    await _isar.saveUser(userData);
  }

}
