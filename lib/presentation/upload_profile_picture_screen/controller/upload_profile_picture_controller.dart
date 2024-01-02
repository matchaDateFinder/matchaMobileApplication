import 'dart:io';

import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/upload_profile_picture_screen/models/upload_profile_picture_model.dart';
import 'package:image_picker/image_picker.dart';

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
    userDetail['photoPath'] = selectedImagePath.value;
    userDetail['photoSize'] = selectedImageSize.value;
    userDetail['photoFile'] = File(selectedImagePath.value);
    return true;
  }

  void getImage() async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+"Mb";
    }else{
      print('No image selected.');
    }
  }


}
