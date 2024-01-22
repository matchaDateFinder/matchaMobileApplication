import 'tag4_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [candidate_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CandidateProfileModel {

  Rx<List<CandidateTagItemModel>> candidateTagItemList = Rx([]);

  Future<void> setItemTag(user) async{
    if (user != null) {
      if(user.userEducation != ""){
        CandidateTagItemModel educationTag = new CandidateTagItemModel();
        educationTag.attributevalue?.value = user.userEducation;
        educationTag.attributeIcon?.value = ImageConstant.imgIcon16Academiccap;
        candidateTagItemList.value.add(educationTag);
      }
      if(user.userReligion != ""){
        CandidateTagItemModel religionTag = new CandidateTagItemModel();
        religionTag.attributevalue?.value = user.userReligion;
        religionTag.attributeIcon?.value = ImageConstant.imgIcon16Pray;
        candidateTagItemList.value.add(religionTag);
      }
      if(user.userHeight != 0){
        CandidateTagItemModel heightTag = new CandidateTagItemModel();
        heightTag.attributevalue?.value = user.userHeight.toString() + "cm";
        heightTag.attributeIcon?.value = ImageConstant.imgIcon16Ruler;
        candidateTagItemList.value.add(heightTag);
      }
      if(user.userSmoking != ""){
        CandidateTagItemModel smokingTag = new CandidateTagItemModel();
        smokingTag.attributevalue?.value = user.userSmoking;
        smokingTag.attributeIcon?.value = ImageConstant.imgIcon16Smoking;
        candidateTagItemList.value.add(smokingTag);
      }
      if(user.userDrinking != ""){
        CandidateTagItemModel drinkingTag = new CandidateTagItemModel();
        drinkingTag.attributevalue?.value = user.userDrinking;
        drinkingTag.attributeIcon?.value = ImageConstant.imgIcon16Drink;
        candidateTagItemList.value.add(drinkingTag);
      }
      if(user.userMBTI != ""){
        CandidateTagItemModel mbtiTag = new CandidateTagItemModel();
        mbtiTag.attributevalue?.value = user.userMBTI;
        mbtiTag.attributeIcon?.value = ImageConstant.imgIcon16Puzzlepiece;
        candidateTagItemList.value.add(mbtiTag);
      }
    }

  }
}
