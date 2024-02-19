import "dart:core";
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/presentation/user_profile_screen/models/user_profile_model.dart';

/// A controller class for the UserProfileScreen.
///
/// This class manages the state of the UserProfileScreen, including the
/// current userProfileModelObj
class UserProfileController extends GetxController {
  late final FirestoreService _firestoreService;
  late final PrefUtils _prefUtils;

  Rx<UserProfileModel> userProfileModelObj = UserProfileModel().obs;

  late UserFireStoreModel user;

  var userPhotoPath = ''.obs;
  var nameAge = ''.obs;
  var userProfession = ''.obs;

  var phoneNumber;
  var userName;
  var userAge;
  var photoPathFromDB;

  UserProfileController() {
    _firestoreService = FirestoreService();
    _prefUtils = PrefUtils();
    user = UserFireStoreModel(userName: "", userPhoneNumber: "",
        userPhotoLink: "", userPhotoSize: "",
        userGender: "", userBirthday: Timestamp.now());
  }

  @override
  void onInit() async {
    // TODO
    // change to fetch from local db instead of get from param
    phoneNumber = _prefUtils.getUserPhoneNumber();
    user = await _firestoreService.getUserFromFireStoreByPhoneNumber(phoneNumber);
    if (user != null) {
      userName = user?.userName;
      photoPathFromDB = user?.userPhotoLink;
      userAge = calculateAge(DateTime.now(), user!.userBirthday.toDate());
      nameAge.value = userName + ' - ' + userAge.toString();
      userPhotoPath.value = photoPathFromDB;
      await userProfileModelObj.value.setItemTag(user);
      userProfileModelObj.refresh();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    Get.delete<UserProfileController>();
    super.dispose();
  }

  int calculateAge(DateTime today, DateTime dob) {
    final year = today.year - dob.year;
    final mth = today.month - dob.month;
    if(mth < 0){
      return year-1;
    }
    else {
      return year;
    }
  }

  Future<void> manuallyKillConstructor() async {
    Get.delete<UserProfileController>();
  }

}
