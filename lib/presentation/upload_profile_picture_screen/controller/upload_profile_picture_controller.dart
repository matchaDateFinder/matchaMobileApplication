import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/upload_profile_picture_screen/models/upload_profile_picture_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

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
    // TODO check for camera/gallery permission
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


}
