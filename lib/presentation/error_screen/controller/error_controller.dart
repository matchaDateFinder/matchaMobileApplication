import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:permission_handler/permission_handler.dart';

/// A controller class for the NoInternetErrorScreen.
///
/// This class manages the state of the NoInternetErrorScreen, including the
/// current noInternetErrorModelObj
class ErrorController extends GetxController {
  Connectivity connectivity = Connectivity();
  var errorTitle = ''.obs;
  var errorImage = ''.obs;

  late final PrefUtils _prefUtils;
  late final String phoneNumber;
  late final String errorType;

  ErrorController() {
    _prefUtils = PrefUtils();
    errorType = _prefUtils.getErrorType()!;
    phoneNumber = _prefUtils.getUserPhoneNumber()!;
    if (errorType == "networkConnection") {
      errorTitle.value = "lbl_internet_error".tr;
      errorImage.value = ImageConstant.imgMatchaNoticeThatsItForToday;
    } else if (errorType == "contactAccess") {
      errorTitle.value = "lbl_no_contact_access_error".tr;
      errorImage.value = ImageConstant.imageContactAccess2;
    } else if (errorType == "galleryAccess") {
      errorTitle.value = "lbl_no_camera_access_error".tr;
      errorImage.value = ImageConstant.imageGalleryAccess;
    }
  }

  Future<void> manuallyKillConstructor() async {
    Get.delete<ErrorController>();
  }

  Future<bool> askContactPermission() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    return permission;
  }

  Future<bool> askMediaPermission() async {
    PermissionStatus permissionGalleryStatus = await _getContactGalleryPermission();
    if (permissionGalleryStatus == PermissionStatus.granted) {
      return true;
    } else {
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

  Future<bool> checkPermissionAgain() async {
    if (errorType == "networkConnection") {
      return NetworkInfo(connectivity).isConnected();
    } else if (errorType == "contactAccess") {
      return askContactPermission();
    } else if (errorType == "galleryAccess") {
      return askMediaPermission();
    }
    return false;
  }

  String fetchRoutes(){
    _prefUtils.setErrorType("-");
    if(errorType == "galleryAccess"){
      if(_prefUtils.getLogInStatus()!){
        return AppRoutes.editProfileScreen;
      }else{
        return AppRoutes.uploadProfilePictureScreen;
      }
    }else{
      if(_prefUtils.getLogInStatus()!){
        return AppRoutes.userProfileScreen;
      }else{
        if(_prefUtils.getOnboardingCheckpoint()! == "afterOTP"){
          return AppRoutes.explanationOfMatchaScreen;
        }else if(_prefUtils.getOnboardingCheckpoint()! == "afterContactAccess"){
          return AppRoutes.inputNameScreen;
        }else{
          return AppRoutes.inputPhoneNumberScreen;
        }
      }
    }
  }
}
