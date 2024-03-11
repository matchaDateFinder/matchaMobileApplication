import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/match_profile_screen/models/match_profile_model.dart';

/// A controller class for the MatchProfileScreen.
///
/// This class manages the state of the MatchProfileScreen, including the
/// current matchProfileModelObj
class MatchProfileController extends GetxController {
  Rx<MatchProfileModel> matchProfileModelObj = MatchProfileModel().obs;
  late final FirestoreService _firestore;

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

  RxList listOfMutuals = [].obs;
  var mutualName = ''.obs;
  var currentUser;
  var candidateUser;

  late final String userName;
  late final DateTime userBirthday;
  late final String userPhotoDownloadLink;
  late final int userAge;

  var currentUserPhoneNumber;
  var contactList;
  var chatRoomId;

  MatchProfileController() {
    _firestore = FirestoreService();
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
  void onInit() async{
    super.onInit();
    currentUser = await _firestore.getUserFromFireStoreByPhoneNumber(currentUserPhoneNumber);
    candidateUser = await _firestore.getUserFromFireStoreByPhoneNumber(userPhoneNumber.value);
    List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
    currentUser.userContactList.forEach((userContact) {
      if(candidateUser.userContactList.contains(userContact)){
        String temp = '';
        contacts.forEach((contact) {
          contact.phones.forEach((number) {
            if(number.number == userContact){
              temp = contact.displayName;
            }
          });
        });
        if(temp == ''){
          listOfMutuals.value.add(userContact);
        }else{
          listOfMutuals.value.add(temp);
        }
      }
    });
    if(listOfMutuals.value.length == 1){
      mutualName.value = "Friends with " + listOfMutuals.value.first;
    }else{
      mutualName.value = "Friends with " + listOfMutuals.value.first +
          " and " + (listOfMutuals.value.length-1).toString() + " Others";
    }
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
