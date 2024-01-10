import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';
import 'package:matchaapplication/presentation/edit_profile_two_screen/models/edit_profile_two_model.dart';
import 'package:flutter/material.dart';
/// A controller class for the EditProfileTwoScreen.
///
/// This class manages the state of the EditProfileTwoScreen, including the
/// current editProfileTwoModelObj
class EditProfileTwoController extends GetxController {

  late final IsarService _isar;
  late final FirestoreService _firestore;

  late UserModel userData;

  EditProfileTwoController() {
    _isar = IsarService();
    _firestore = FirestoreService();
    userData = new UserModel();
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
    userData = (await _isar.getUserByPhoneNumber(phoneNumber))!;
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
    if(userData.profession != ""){
      answerProfessionController.text = userData.profession!;
    }
    if(userData.education != ""){
      educationRadioGroup.value = translateFromDBtoLabel(userData.education!, "education");
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
    if(userData.height != 0){
      answerHeightController.text = userData.height!.toString();
    }
    if(userData.smoking != ""){
      smokingRadioGroup.value = translateFromDBtoLabel(userData.smoking!, "smoking");
    }
    if(userData.drinking != ""){
      drinkingRadioGroup.value = translateFromDBtoLabel(userData.drinking!, "drinking");
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
      userData.profession = "";
    }else{
      userData.profession = answerProfessionController.value.text;
    }
    userData.education = educationRadioGroup.value.tr;
    if (religionDropDownValue.value == null || religionDropDownValue.value == ""){
      userData.religion = "";
    }else{
      userData.religion = religionDropDownValue.value;
    }
    if (answerHeightController.value.text == null || answerHeightController.value.text == ""){
      userData.height = 0;
    }else{
      userData.height = int.parse(answerHeightController.value.text);
    }
    userData.smoking = smokingRadioGroup.value.tr;
    userData.drinking = drinkingRadioGroup.value.tr;
    if (mbtiDropDownValue.value == null){
      userData.mbti = "";
    }else{
      userData.mbti = mbtiDropDownValue.value;
    }
    await _saveUserProfileToIsarDB();
    await _saveUserProfileToFireStoreDB();
    Get.delete<EditProfileTwoController>();
  }

  Future<void> _saveUserProfileToIsarDB() async {
    await _isar.saveUser(userData!);
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
