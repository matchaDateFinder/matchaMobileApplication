import 'dart:io';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  late final FirestoreService _firestoreService;
  late final AgeService _ageService;
  late final PrefUtils _prefUtils;
  final userPhoneNumber = Get.arguments;
  FirebaseAuth _auth = FirebaseAuth.instance;

  final deviceInfoPlugin = DeviceInfoPlugin();

  Rx<String>  userNameAge = ''.obs;
  Rx<String>  userProfession = ''.obs;
  Rx<String>  userEducation = ''.obs;
  Rx<String>  userReligion = ''.obs;
  Rx<String>  userHeight = ''.obs;
  Rx<String>  userDrinking = ''.obs;
  Rx<String>  userSmoking = ''.obs;
  Rx<String>  userMBTI = ''.obs;
  Rx<String>  userLookingFor = ''.obs;
  Rx<String>  userMarriageTarget = ''.obs;
  var photoLink = "".obs;
  var newLocalPhotoLink = "".obs;

  EditProfileController() {
    _firestoreService = FirestoreService();
    _ageService = AgeService();
    _prefUtils = PrefUtils();
  }

  var phoneNumber;
  var selectedImagePath;
  var selectedImageSize;
  late UserFireStoreModel user;

  @override
  void onInit() async {
    super.onInit();
    phoneNumber  = _prefUtils.getUserPhoneNumber();
    user = await _firestoreService.getUserFromFireStoreByPhoneNumber(phoneNumber);
    String userName = user.userName;
    int userAge = _ageService.calculateAge(user.userBirthday.toDate());
    userNameAge.value = userName + ' - ' + userAge.toString();
    userProfession.value = user.userProfession!;
    userEducation.value = user.userEducation!;
    userReligion.value = user.userReligion!;
    userHeight.value = user.userHeight.toString();
    userDrinking.value = user.userDrinking!;
    userSmoking.value = user.userSmoking!;
    userMBTI.value = user.userMBTI!;
    userLookingFor.value = user.userLookingFor!;
    userMarriageTarget.value = user.userMarriageTarget!;
    photoLink.value = user.userPhotoLink;
    newLocalPhotoLink.value = user.userPhotoLink;
  }

  @override
  void onClose() {
    Get.delete<EditProfileController>();
    super.onClose();
  }

  @override
  void dispose() {
    Get.delete<EditProfileController>();
    super.dispose();
  }

  Future<void> manuallyKillConstructor() async {
    Get.delete<EditProfileController>();
  }

  Future<void> logOutFromTheApp() async {
    _prefUtils.setLoginStatus(false);
    _prefUtils.clearPreferencesData();
    _auth.signOut();
  }

  void getImage() async{
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100
    );
    if (pickedFile != null) {
      final croppedFile = await cropImage(pickedFile);
      if(croppedFile != null){
        if((File(croppedFile.path)).lengthSync()/1024/1024 > 3){
          Get.defaultDialog(
            title: "Image size too large",
            content: Text("Image size too large"),
          );
        }else{
          selectedImagePath = croppedFile.path;
          selectedImageSize = ((File(selectedImagePath)).lengthSync()/1024/1024).toStringAsFixed(2)+"Mb";
          // delete old photo and upload the new one
          Directory documentDir = await getApplicationDocumentsDirectory();
          File photoFile = await File(selectedImagePath).copy(path.join(documentDir.path, path.basename(user.userName+"-"+user.userPhoneNumber+path.extension(selectedImagePath))));
          String newPhotoLink = await _firestoreService.uploadUserProfilePicture(photoFile);
          await _firestoreService.updateUserPhotoLinkFromFireStoreByPhoneNumber(user.userPhoneNumber, newPhotoLink, selectedImageSize);
          newLocalPhotoLink.value = selectedImagePath;
        }
      }
    }
  }

  Future<CroppedFile?> cropImage(XFile file) async {
    return await ImageCropper().cropImage(
        cropStyle: CropStyle.rectangle,
        sourcePath: file.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
  }

  Future<bool> askPermissions() async {
    PermissionStatus permissionGalleryStatus = await _getContactGalleryPermission();
    if (permissionGalleryStatus == PermissionStatus.granted) {
      return true;
    } else {
      if(_handleInvalidPermanentPermissions(permissionGalleryStatus) == "permanentDeny"){
        _prefUtils.setErrorType("galleryAccess");
        Get.toNamed(
          AppRoutes.errorScreen,
        );
      }
      return false;
    }
  }

  Future<PermissionStatus> _getContactGalleryPermission() async {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    if (deviceInfo.version.sdkInt <= 32) {
      PermissionStatus permission = await Permission.storage.status;
      if (permission != PermissionStatus.granted &&
          permission != PermissionStatus.permanentlyDenied) {
        PermissionStatus permissionStatus = await Permission.storage.request();
        return permissionStatus;
      } else {
        return permission;
      }
    } else {
      PermissionStatus permission = await Permission.photos.status;
      if (permission != PermissionStatus.granted &&
          permission != PermissionStatus.permanentlyDenied) {
        PermissionStatus permissionStatus = await Permission.photos.request();
        return permissionStatus;
      } else {
        return permission;
      }
    }
  }

  String _handleInvalidPermanentPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      return "permanentDeny";
    }
    return "granted";
  }
}
