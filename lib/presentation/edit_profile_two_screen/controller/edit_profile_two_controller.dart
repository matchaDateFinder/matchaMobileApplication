import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/edit_profile_two_screen/models/edit_profile_two_model.dart';
import 'package:flutter/material.dart';
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

  Rx<String> religionDropDownValue = "".obs;

  Rx<String> educationRadioGroup = "".obs;

  Rx<String> drinkingRadioGroup = "".obs;

  Rx<String> smokingRadioGroup = "".obs;

  Rx<String> mbtiDropDownValue = "".obs;

  final phoneNumber = Get.arguments;

  var userData;

  @override
  void onInit() async{
    userData = await _isar.getUserByPhoneNumber(phoneNumber);
    if (userData != null){
      await setDefaultValue();
    }
  }

  @override
  void onClose() {
    super.onClose();
    answerProfessionController.dispose();
  }

  Future<void> setDefaultValue() async{
    if(userData.profession != ""){
      answerProfessionController.text = userData.profession;
    }
    if(userData.education != ""){
      educationRadioGroup.value = userData.education;
    }
    if(userData.religion != ""){
      for (var element in editProfileTwoModelObj.value.religionDropdownItemList.value) {
        element.isSelected = false;
        if (element.title == userData.religion) {
          element.isSelected = true;
          religionDropDownValue.value = element.title;
          element.value = element.title;
        }
      }
    }
    // if(userData.height != 0){
    //   educationRadioGroup = userData.education;
    // }
    if(userData.smoking != ""){
      smokingRadioGroup.value = userData.smoking;
    }
    if(userData.drinking != ""){
      drinkingRadioGroup.value = userData.drinking;
    }
    if(userData.mbti != ""){
      for (var element in editProfileTwoModelObj.value.mbtiDropdownItemList.value) {
        element.isSelected = false;
        if (element.title == userData.mbti) {
          element.isSelected = true;
          mbtiDropDownValue.value = element.title;
          element.value = element.title;
        }
      }
    }
  }

  onSelectReligion(dynamic value) {
    for (var element in editProfileTwoModelObj.value.religionDropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
        religionDropDownValue.value = element.title;
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
        mbtiDropDownValue.value = element.title;
      }
    }
    editProfileTwoModelObj.value.mbtiDropdownItemList.refresh();
  }

  void saveUserProfile() async{
    if (answerProfessionController.value.text == null || answerProfessionController.value.text == ""){
      userData.profession = "";
    }else{
      userData.profession = answerProfessionController.value.text;
    }
    userData.education = educationRadioGroup.value;
    if (religionDropDownValue.value == null || religionDropDownValue.value == ""){
      userData.religion = "";
    }else{
      userData.religion = religionDropDownValue.value;
    }
    userData.height = 100;
    userData.smoking = smokingRadioGroup.value;
    userData.drinking = drinkingRadioGroup.value;
    if (mbtiDropDownValue.value == null){
      userData.mbti = "";
    }else{
      userData.mbti = mbtiDropDownValue.value;
    }
    await _isar.saveUser(userData);
  }

}
