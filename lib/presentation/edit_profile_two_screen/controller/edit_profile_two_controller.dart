import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';
import 'package:matchaapplication/presentation/edit_profile_two_screen/models/edit_profile_two_model.dart';
import 'package:flutter/material.dart';
/// A controller class for the EditProfileTwoScreen.
///
/// This class manages the state of the EditProfileTwoScreen, including the
/// current editProfileTwoModelObj
class EditProfileTwoController extends GetxController {
  late final FirestoreService _firestore;

  late UserFireStoreModel userData;

  EditProfileTwoController() {
    _firestore = FirestoreService();
  }

  TextEditingController answerProfessionController = TextEditingController();

  TextEditingController answerHeightController = TextEditingController();

  Rx<EditProfileTwoModel> editProfileTwoModelObj = EditProfileTwoModel().obs;

  Rx<String> religionDropDownValue = "".obs;

  Rx<String> educationRadioGroup = "".obs;

  Rx<String> drinkingRadioGroup = "".obs;

  Rx<String> smokingRadioGroup = "".obs;

  Rx<String> mbtiDropDownValue = "".obs;

  final phoneNumber = Get.arguments;

  @override
  void onInit() async{
    userData = await _firestore.getUserFromFireStoreByPhoneNumber(phoneNumber);
    if (userData != null){
      await setDefaultValue();
    }
  }

  @override
  void onReady() async {

  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> setDefaultValue() async{
    if(userData.userProfession != ""){
      answerProfessionController.text = userData.userProfession!;
    }
    if(userData.userEducation != ""){
      educationRadioGroup.value = translateFromDBtoLabel(userData.userEducation!, "education");
    }
    if(userData.userReligion != ""){
      for (var element in editProfileTwoModelObj.value.religionDropdownItemList.value) {
        element.isSelected = false;
        if (element.title == userData.userReligion) {
          element.isSelected = true;
          religionDropDownValue.value = element.title;
          element.value = element.title;
        }
      }
    }
    if(userData.userHeight != 0){
      answerHeightController.text = userData.userHeight!.toString();
    }
    if(userData.userSmoking != ""){
      smokingRadioGroup.value = translateFromDBtoLabel(userData.userSmoking!, "smoking");
    }
    if(userData.userDrinking != ""){
      drinkingRadioGroup.value = translateFromDBtoLabel(userData.userDrinking!, "drinking");
    }
    if(userData.userMBTI != ""){
      for (var element in editProfileTwoModelObj.value.mbtiDropdownItemList.value) {
        element.isSelected = false;
        if (element.title == userData.userMBTI) {
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

  Future<void> saveUserProfile() async{
    if (answerProfessionController.value.text == null || answerProfessionController.value.text == ""){
      userData.userProfession = "";
    }else{
      userData.userProfession = answerProfessionController.value.text;
    }
    userData.userEducation = educationRadioGroup.value.tr;
    if (religionDropDownValue.value == null || religionDropDownValue.value == ""){
      userData.userReligion = "";
    }else{
      userData.userReligion = religionDropDownValue.value;
    }
    if (answerHeightController.value.text == null || answerHeightController.value.text == ""){
      userData.userHeight = 0;
    }else{
      userData.userHeight = int.parse(answerHeightController.value.text);
    }
    userData.userSmoking = smokingRadioGroup.value.tr;
    userData.userDrinking = drinkingRadioGroup.value.tr;
    if (mbtiDropDownValue.value == null){
      userData.userMBTI = "";
    }else{
      userData.userMBTI = mbtiDropDownValue.value;
    }
    await _saveUserProfileToFireStoreDB();
    Get.delete<EditProfileTwoController>();
  }

  Future<void> _saveUserProfileToFireStoreDB() async {
    await _firestore.updateUserProfileFromFireStoreByPhoneNumber(phoneNumber, userData!);
  }

  String translateFromDBtoLabel(String dbTerm, String fromWhich) {
    String result = '';
    if(fromWhich == "education"){
      editProfileTwoModelObj.value.educationRadioList.value.forEach((element) {
        if(element.tr == dbTerm){
          result = element;
        }
      });
    }else if(fromWhich == "drinking" || fromWhich == "smoking"){
      editProfileTwoModelObj.value.smokingDrinkingRadioList.value.forEach((element){
        if(element.tr == dbTerm){
          result = element;
        }
      });
    }
    return result;
  }

}
