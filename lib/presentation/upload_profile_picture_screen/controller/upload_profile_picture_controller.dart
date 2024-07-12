import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/upload_profile_picture_screen/models/upload_profile_picture_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// A controller class for the UploadProfilePictureScreen.
///
/// This class manages the state of the UploadProfilePictureScreen, including the
/// current uploadProfilePictureModelObj
class UploadProfilePictureController extends GetxController {
  Rx<UploadProfilePictureModel> uploadProfilePictureModelObj =
      UploadProfilePictureModel().obs;

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  var userDetail = new Map();

  final deviceInfoPlugin = DeviceInfoPlugin();

  late final PrefUtils _prefUtils;

  UploadProfilePictureController() {
    _prefUtils = PrefUtils();
  }

  @override
  void onInit(){
    userDetail = Get.arguments;
  }

  bool validateForm(){
    if(selectedImagePath.value == "" || selectedImageSize.value == ""){
      Get.defaultDialog(
          title: "Please select your profile picture",
          content: Text("Please select your profile picture")
      );
      return false;
    }
    userDetail['photoPath'] = selectedImagePath.value;
    userDetail['photoSize'] = selectedImageSize.value;
    userDetail['photoFile'] = File(selectedImagePath.value);
    return true;
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
          selectedImagePath.value = croppedFile.path;
          selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+"Mb";
        }
      }
    }else{
      Get.defaultDialog(
        title: "No Image Alert",
        content: Text("No Image Selected"),
      );
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
