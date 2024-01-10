import 'dart:io';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/edit_profile_screen/models/edit_profile_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  late final IsarService _isar;
  late final PrefUtils _prefUtils;
  final userPhoneNumber = Get.arguments;

  Rx<String>  userProfession = ''.obs;
  Rx<String>  userEducation = ''.obs;
  Rx<String>  userReligion = ''.obs;
  Rx<String>  userHeight = ''.obs;
  Rx<String>  userDrinking = ''.obs;
  Rx<String>  userSmoking = ''.obs;
  Rx<String>  userMBTI = ''.obs;

  EditProfileController() {
    _isar = IsarService();
    _prefUtils = PrefUtils();
  }

  var user;

  String photoLink = "";

  @override
  void onInit() async {
    user  = await _isar.getUserByPhoneNumber(userPhoneNumber);
    if (user != null) {
      userProfession.value = user.profession!;
      userEducation.value = user.education!;
      userReligion.value = user.religion!;
      userHeight.value = user.height.toString();
      userDrinking.value = user.drinking!;
      userSmoking.value = user.smoking!;
      userMBTI.value = user.mbti!;
      photoLink = user.photoLink!;
    }
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
    int checkIfDeleteSuccess = await _erasePhotoFileFromDevice();
    await _isar.clearAllDataFromIsarDB();
    print(_prefUtils.getLogInStatus());
  }

  Future<int> _erasePhotoFileFromDevice() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    try {
      final file = File(path.join(documentDir.path, path.basename(user.photoLink!)));
      await file.delete();
    } catch (e) {
      return 0;
    }
      return 1;
  }

}
