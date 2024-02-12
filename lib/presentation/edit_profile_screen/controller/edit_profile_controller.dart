import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/presentation/edit_profile_screen/models/edit_profile_model.dart';
/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;
  late final FirestoreService _firestoreService;
  late final PrefUtils _prefUtils;
  final userPhoneNumber = Get.arguments;

  Rx<String>  userProfession = ''.obs;
  Rx<String>  userEducation = ''.obs;
  Rx<String>  userReligion = ''.obs;
  Rx<String>  userHeight = ''.obs;
  Rx<String>  userDrinking = ''.obs;
  Rx<String>  userSmoking = ''.obs;
  Rx<String>  userMBTI = ''.obs;
  var photoLink = "".obs;

  EditProfileController() {
    _firestoreService = FirestoreService();
    _prefUtils = PrefUtils();
  }

  var phoneNumber;
  late UserFireStoreModel user;

  @override
  void onInit() async {
    phoneNumber  = _prefUtils.getUserPhoneNumber();
    user = await _firestoreService.getUserFromFireStoreByPhoneNumber(phoneNumber);
    if (user != null) {
      userProfession.value = user.userProfession!;
      userEducation.value = user.userEducation!;
      userReligion.value = user.userReligion!;
      userHeight.value = user.userHeight.toString();
      userDrinking.value = user.userDrinking!;
      userSmoking.value = user.userSmoking!;
      userMBTI.value = user.userMBTI!;
      photoLink.value = user.userPhotoLink!;
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
    // TODO unsubscribe to all of the topic
    _prefUtils.clearLocalPreferences();
  }


}
