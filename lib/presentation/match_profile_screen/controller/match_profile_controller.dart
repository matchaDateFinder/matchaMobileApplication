import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/match_profile_screen/models/match_profile_model.dart';

/// A controller class for the MatchProfileScreen.
///
/// This class manages the state of the MatchProfileScreen, including the
/// current matchProfileModelObj
class MatchProfileController extends GetxController {
  Rx<MatchProfileModel> matchProfileModelObj = MatchProfileModel().obs;

  RxString userPhoneNumber = ''.obs;
  RxString userGender = ''.obs;
  RxString userProfession = ''.obs;
  RxString userEducation = ''.obs;
  RxString userReligion = ''.obs;
  RxString userHeight = ''.obs;
  RxString userSmoking = ''.obs;
  RxString userDrinking = ''.obs;
  RxString userMBTI = ''.obs;
  RxString nameAge = ''.obs;

  late final String userName;
  late final DateTime userBirthday;
  late final String userPhotoDownloadLink;
  late final int userAge;

  var currentUserPhoneNumber;
  var contactList;
  var chatRoomId;

  MatchProfileController() {
    var arguments = Get.arguments;
    userName = arguments["userName"];
    userPhoneNumber.value = arguments["userPhoneNumber"];
    userPhotoDownloadLink = arguments["userPhotoDownloadLink"];
    userGender.value = arguments["userGender"];
    userBirthday = arguments["userBirthday"];
    userAge = calculateAge(DateTime.now(), userBirthday);
    userProfession.value = arguments["userProfession"];
    userEducation.value = arguments["userEducation"];
    userReligion.value = arguments["userReligion"];
    userHeight.value = arguments["userHeight"].toString();
    userSmoking.value = arguments["userSmoking"];
    userDrinking.value = arguments["userDrinking"];
    userMBTI.value = arguments["userMBTI"];
    nameAge.value = userName + ' - ' + userAge.toString();
    contactList = arguments["userContactList"];
    chatRoomId = arguments["chatRoomId"];
    currentUserPhoneNumber = arguments["currentUserPhoneNumber"];
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    Get.delete<MatchProfileController>();
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
    Get.delete<MatchProfileController>();
  }

  Future<Map<String,String>> convertToMap() async{
    Map<String,String> result = {};
    result["userPhoneNumber"] = currentUserPhoneNumber;
    result["receiverPhoneNumber"] = userPhoneNumber.value;
    result["receiverName"] = userName;
    result["receiverPhotoLink"] = userPhotoDownloadLink;
    result["chatRoomId"] = chatRoomId;
    return result;
  }

}
