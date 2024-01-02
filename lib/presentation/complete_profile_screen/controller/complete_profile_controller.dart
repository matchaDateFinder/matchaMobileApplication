import 'dart:io';

import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/userModel/user.dart';
import 'package:matchaapplication/presentation/complete_profile_screen/models/complete_profile_model.dart';
import 'package:matchaapplication/service/isar_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
/// A controller class for the CompleteProfileScreen.
///
/// This class manages the state of the CompleteProfileScreen, including the
/// current completeProfileModelObj
class CompleteProfileController extends GetxController {
  Rx<CompleteProfileModel> completeProfileModelObj = CompleteProfileModel().obs;

  late final IsarService _isar;

  CompleteProfileController() {
    _isar = IsarService();
  }
  var userDetail = new Map();
  var user = new User();

  @override
  void onInit() async{
    userDetail = Get.arguments;
    Directory documentDir = await getApplicationDocumentsDirectory();
    File photoFile = await userDetail['photoFile'].copy(path.join(documentDir.path, path.basename(userDetail['fullName']+"-"+userDetail['userPhoneNumber'])));
    // save to local repositories first then show the page
    //TODO upload photo using photoLink to firebaseDB and ~~isarDB~~ and then save the link to the photo to the userDB
    List<String>? contactListInit = [];
    user = User()
    ..phoneNumber = userDetail['userPhoneNumber']
    ..name = userDetail['fullName']
    ..photoLink = photoFile.path
    ..photoSize = userDetail['photoSize']
    ..age = userDetail['birthday']
    ..gender = userDetail['gender']
    ..profession = ''
    ..education = ''
    ..religion = ''
    ..height = 0
    ..smoking = ''
    ..drinking = ''
    ..mbti = ''
    ..contactList = contactListInit;
    await _isar.saveUser(user);
  }

}
