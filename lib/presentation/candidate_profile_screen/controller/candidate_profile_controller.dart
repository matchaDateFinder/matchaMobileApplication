import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/matchFireStoreModel/matchFireStore.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';
import 'package:matchaapplication/data/models/fireStoreModel/chatRoomFireStoreModel/chatRoomFireStore.dart';
import 'package:matchaapplication/presentation/candidate_profile_screen/models/candidate_profile_model.dart';
import 'package:permission_handler/permission_handler.dart';

/// A controller class for the CandidateProfileScreen.
///
/// This class manages the state of the CandidateProfileScreen, including the
/// current candidateProfileModelObj
class CandidateProfileController extends GetxController {
  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;
  late final AgeService _ageService;

  var userPhotoPath = ''.obs;
  var nameAge = ''.obs;
  var userProfession = ''.obs;
  var mutualName = ''.obs;

  RxList listOfMutuals = [].obs;

  Rx<CandidateProfileModel> candidateProfileModelObj =
      CandidateProfileModel().obs;

  var user;
  var phoneNumber;
  var candidateProfile;
  var candidateName;
  var candidatePhoneNumber;
  var candidateAge;

  Map<String,String> argumentForNoticeTwo = {};

  CandidateProfileController() {
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
    _ageService = AgeService();
  }

  @override
  void onInit() async{
    super.onInit();
    phoneNumber = _prefUtils.getUserPhoneNumber();
    if(await askPermissions()){
      user = await _firestore.getUserFromFireStoreByPhoneNumber(phoneNumber);
      if(user != null){
        DateTime lastRecommDate = user!.lastRecommendationIsGiven.toDate();
        if(lastRecommDate.year == 1970 || (daysBetween(lastRecommDate, DateTime.now()) >= 1)){
          Set<String> potentialMatch = await getPotentialMatch();
          Set<String> existingMatchFilter = await checkExistingMatchRow(potentialMatch);
          if(existingMatchFilter.length > 0){
            candidateProfile = await _firestore.getUserFromFireStoreByPhoneNumber(existingMatchFilter.first);
            candidateAge = _ageService.calculateAge(candidateProfile!.userBirthday.toDate());
            candidateName = candidateProfile!.userName;
            candidatePhoneNumber = candidateProfile!.userPhoneNumber;
            nameAge.value = candidateName + ' - ' + candidateAge.toString();
            userPhotoPath.value = candidateProfile!.userPhotoLink;
            userProfession.value = candidateProfile!.userProfession;
            await candidateProfileModelObj.value.setItemTag(candidateProfile);
            List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
            user.userContactList.forEach((userContact) {
              if(candidateProfile.userContactList.contains(userContact)){
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
            if(listOfMutuals.value.length == 0){
              mutualName.value = "";
            }else if(listOfMutuals.value.length == 1){
              mutualName.value = "Friends with " + listOfMutuals.value.first;
            }else{
              mutualName.value = "Friends with " + listOfMutuals.value.first +
                  " and " + (listOfMutuals.value.length-1).toString() + " Others";
            }
          }else{
            await manuallyKillConstructor();
            Get.toNamed(
              AppRoutes.noticeOneScreen,
              arguments: "noMatchInDB"
            );
          }
        }else{
          await manuallyKillConstructor();
          Get.toNamed(
            AppRoutes.noticeOneScreen,
            arguments: "lastMatchLessThanADay"
          );
        }
        candidateProfileModelObj.refresh();
      }
    }else{
      await manuallyKillConstructor();
      Get.defaultDialog(
          title: "Contact access was not given",
          content: Text("Please give Matcha access to your Contact List")
      );
      Get.toNamed(
        AppRoutes.userProfileScreen,
        arguments: phoneNumber
      );

    }
  }

  Future<void> manuallyKillConstructor() async {
    Get.delete<CandidateProfileController>();
  }

  Future<Set<String>> getPotentialMatch() async {
    Set<String> result = new Set();
    if(user?.userContactList.length > 0){
      List<UserFireStoreModel> listOfUserFromContactList = await _firestore.getListOfMutualConnectionByPhoneNumberList(user?.userContactList, user?.userPhoneNumber);
      listOfUserFromContactList.forEach((element) {
        if(element.userGender != user?.userGender){
          result.add(element.userPhoneNumber);
        }
      });
    }
    List<UserFireStoreModel> listOfUserFromContactList = await _firestore.getListOfPotentialMatchByPhoneNumber(user?.userPhoneNumber);
    listOfUserFromContactList.forEach((element) {
      if(element.userGender != user?.userGender){
        result.add(element.userPhoneNumber);
      }
    });
    return result;
  }

  Future<Set<String>> checkExistingMatchRow(Set<String> listOfPhoneNumber) async {
    Set<String> result = new Set();
    List<String> fromOnlineDB = await _firestore.getMatchListByPhoneNumber(phoneNumber, listOfPhoneNumber);
    result.addAll(fromOnlineDB);
    return result;
  }

  Future<bool> saveUserReaction(bool reaction) async {
    bool result = false;
    List<MatchFireStoreModel> listOfMatch = await _firestore.checkIfMatchExistsInFirestoreDB(phoneNumber, candidatePhoneNumber);
    if(listOfMatch.length > 0){
      await _firestore.updateMatchingInFireStore(listOfMatch[0], reaction);
      if(listOfMatch[0].user1Reaction == true && reaction == true){
        result = true;
        ChatRoomFireStoreModel newChatRoomFireStore = ChatRoomFireStoreModel(
            participantsNumber: [phoneNumber, candidatePhoneNumber],
            participantsName: [user.userName, candidateName],
            unreadMessagesCountFromParticipantA: {phoneNumber:0},
            unreadMessagesCountFromParticipantB: {candidatePhoneNumber:0}
        );
        await _firestore.createNewChatRoomInFireStore(newChatRoomFireStore);
        argumentForNoticeTwo["userPhotoLink"] = user.userPhotoLink;
        argumentForNoticeTwo["candidatePhotoLink"] = userPhotoPath.value;
        argumentForNoticeTwo["userPhoneNumber"] = user.userPhoneNumber;
        argumentForNoticeTwo["receiverPhoneNumber"] = candidatePhoneNumber;
        argumentForNoticeTwo["receiverName"] = candidateName;
      }
    }else{
      MatchFireStoreModel newMatch = MatchFireStoreModel(user1Name: user.userName, user1PhoneNumber: phoneNumber, user2Name: candidateName, user2PhoneNumber: candidatePhoneNumber, user1Reaction: reaction, hasBeenVisitedByUser1: true);
      await _firestore.addMatchToFireStore(newMatch);
    }
    await _firestore.updateUserLastRecommendationTimeFromFireStoreByPhoneNumber(phoneNumber, DateTime.now());
    return result;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future<bool> askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      if(_handleInvalidPermanentPermissions(permissionStatus) == "permanentDeny"){
        _prefUtils.setErrorType("contactAccess");
        Get.toNamed(
          AppRoutes.errorScreen,
        );
      }
      return false;
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  String _handleInvalidPermanentPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      return "permanentDeny";
    }
    return "granted";
  }


}
