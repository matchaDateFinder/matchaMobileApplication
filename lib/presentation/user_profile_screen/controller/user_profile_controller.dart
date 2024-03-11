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
    user = UserFireStoreModel(userId:"", userName: "", userPhoneNumber: "",
        userPhotoLink: "", userPhotoSize: "",
        userGender: "", userBirthday: Timestamp.now());
  }

  @override
  void onInit() async {
    phoneNumber = _prefUtils.getUserPhoneNumber();
    user = await _firestoreService.getUserFromFireStoreByPhoneNumber(phoneNumber);
    userName = user.userName;
    photoPathFromDB = user.userPhotoLink;
    userAge = calculateAge(DateTime.now(), user.userBirthday.toDate());
    nameAge.value = userName + ' - ' + userAge.toString();
    userPhotoPath.value = photoPathFromDB;
    if(userProfession.value != null || user.userProfession != ""){
      userProfession.value = user.userProfession!;
    }
    await userProfileModelObj.value.setItemTag(user);
    userProfileModelObj.refresh();
    // TODO check if there is a new contact in phone and if exists then upload it to DB
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
