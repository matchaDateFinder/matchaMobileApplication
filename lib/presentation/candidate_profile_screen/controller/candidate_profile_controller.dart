import 'package:isar/isar.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/matchFireStoreModel/matchFireStore.dart';
import 'package:matchaapplication/presentation/candidate_profile_screen/models/candidate_profile_model.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';

/// A controller class for the CandidateProfileScreen.
///
/// This class manages the state of the CandidateProfileScreen, including the
/// current candidateProfileModelObj
class CandidateProfileController extends GetxController {
  late final IsarService _isar;
  late final FirestoreService _firestore;

  var userPhotoPath = ''.obs;
  var nameAge = ''.obs;
  var userProfession = ''.obs;
  var mutualName = ''.obs;

  Rx<CandidateProfileModel> candidateProfileModelObj =
      CandidateProfileModel().obs;

  var user;
  var phoneNumber;
  var candidateProfile;
  var candidateName;
  var candidatePhoneNumber;
  var candidateAge;

  CandidateProfileController() {
    _isar = IsarService();
    _firestore = FirestoreService();
  }

  @override
  void onInit() async{
    phoneNumber = await _isar.getPhoneNumberInIsarDB();
    user = await _firestore.getUserFromFireStoreByPhoneNumber(phoneNumber);
    if(user != null){
      DateTime dt1 = user!.lastRecommendationIsGiven.toDate();
      if(dt1.year == 1970 || DateTime.now().day-dt1.day > 1){
        List<String> potentialMatch = await getPotentialMatch();
        Set<String> existingMatchFilter = await checkExistingMatchRow(potentialMatch);
        if(existingMatchFilter.length == 0 ){
          // TODO create a function to fetch random pairing from database
        }
        if(existingMatchFilter.length > 0){
          candidateProfile = await _firestore.getUserFromFireStoreByPhoneNumber(existingMatchFilter.first);
          String photoFileLocalPath = await _firestore.downloadPhotoFileFromCloudStorage(candidateProfile!.userPhotoLink, candidateProfile!.userName, candidateProfile!.userPhoneNumber);
          candidateAge = calculateAge(DateTime.now(), candidateProfile!.userBirthday.toDate());
          candidateName = candidateProfile!.userName;
          candidatePhoneNumber = candidateProfile!.userPhoneNumber;
          nameAge.value = candidateName + ' - ' + candidateAge.toString();
          userPhotoPath.value = photoFileLocalPath;
          userProfession.value = candidateProfile!.userProfession;
          await candidateProfileModelObj.value.setItemTag(candidateProfile);
          candidateProfileModelObj.refresh();
        }
      }else{
        await manuallyKillConstructor();
        Get.toNamed(
          AppRoutes.noticeOneScreen,
        );
      }
    }
  }

  // TODO need to find a way to dispose the current controller when moving to another page via the bottom bar
  Future<void> manuallyKillConstructor() async {
    // TODO clean up photo file from user device

    Get.delete<CandidateProfileController>();
  }

  Future<List<String>> getPotentialMatch() async {
    List<String> result = [];
    List<UserFireStoreModel> listOfUserFromContactList = await _firestore.getListOfMutualConnectionByPhoneNumberList(user?.userContactList, user?.userPhoneNumber);
    listOfUserFromContactList.forEach((element) {
      if(element.userGender != user?.userGender){
        result.add(element.userPhoneNumber);
      }
    });
    return result;
  }

  Future<Set<String>> checkExistingMatchRow(List<String> listOfPhoneNumber) async {
    Set<String> result = new Set();
    List<String> fromOnlineDB = await _firestore.getMatchListByPhoneNumber(phoneNumber, listOfPhoneNumber);
    result.addAll(fromOnlineDB);
    return result;
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

  Future<bool> saveUserReaction(bool reaction) async {
    bool result = false;
    List<MatchFireStoreModel> listOfMatch = await _firestore.checkIfMatchExistsInFirestoreDB(phoneNumber, candidatePhoneNumber);
    if(listOfMatch.length > 0){
      // TODO ketika nemu entry di firestore
      print("match exist");
      await _firestore.updateMatchingInFireStore(listOfMatch[0], reaction);
      if(listOfMatch[0].user1Reaction == true && reaction == true){
        result = true;
      }
    }else{
      // TODO ketika tidak nemu entry di firestore
      print("match does not exist");
      MatchFireStoreModel newMatch = MatchFireStoreModel(user1Name: user.userName, user1PhoneNumber: phoneNumber, user2Name: candidateName, user2PhoneNumber: candidatePhoneNumber, user1Reaction: reaction, hasBeenVisitedByUser1: true);
      await _firestore.addMatchToFireStore(newMatch);
    }
    await _firestore.updateUserLastRecommendationTimeFromFireStoreByPhoneNumber(phoneNumber, DateTime.now());
    return result;
  }





}
