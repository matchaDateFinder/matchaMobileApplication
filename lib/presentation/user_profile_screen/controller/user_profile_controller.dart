import "dart:core";
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/user_profile_screen/models/user_profile_model.dart';
import 'package:matchaapplication/service/isar_service.dart';
/// A controller class for the UserProfileScreen.
///
/// This class manages the state of the UserProfileScreen, including the
/// current userProfileModelObj
class UserProfileController extends GetxController {
  Rx<UserProfileModel> userProfileModelObj = UserProfileModel().obs;

  var phoneNumber;
  var userName;
  var userAge;
  var photoPathFromDB;

  var userPhotoPath = ''.obs;
  var nameAge = ''.obs;

  late final IsarService _isar;

  UserProfileController() {
    _isar = IsarService();
  }

  @override
  void onInit() async {
    // TODO
    // change to fetch from local db instead of get from param
    phoneNumber = Get.arguments;
    final user = await _isar.getUserByPhoneNumber(phoneNumber);
    if (user != null) {
      userName = user?.name;
      photoPathFromDB = user?.photoLink;
      userAge = age(DateTime.now(), user!.age);
      nameAge.value = userName + ' - ' + userAge.toString();
      userPhotoPath.value = photoPathFromDB;
    }

  }

  int age(DateTime today, DateTime dob) {
    final year = today.year - dob.year;
    final mth = today.month - dob.month;
    if(mth < 0){
      return year-1;
    }
    else {
      return year;
    }
  }

}
