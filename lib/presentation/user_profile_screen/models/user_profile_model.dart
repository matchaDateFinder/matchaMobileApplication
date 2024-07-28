import 'tag2_item_model.dart';
import '../../../core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';

/// This class defines the variables used in the [user_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UserProfileModel {
  Rx<List<UserTagItemModel>> userTagItemList = Rx([]);

  Future<void> setItemTag(UserFireStoreModel user) async{
    if(user.userEducation != ""){
      UserTagItemModel educationTag = new UserTagItemModel();
      educationTag.attributevalue?.value = user.userEducation!;
      educationTag.attributeIcon?.value = ImageConstant.imgIcon16Academiccap;
      userTagItemList.value.add(educationTag);
    }
    if(user.userReligion != ""){
      UserTagItemModel religionTag = new UserTagItemModel();
      religionTag.attributevalue?.value = user.userReligion!;
      religionTag.attributeIcon?.value = ImageConstant.imgIcon16Pray;
      userTagItemList.value.add(religionTag);
    }
    if(user.userHeight != 0){
      UserTagItemModel heightTag = new UserTagItemModel();
      heightTag.attributevalue?.value = user.userHeight!.toString() + "cm";
      heightTag.attributeIcon?.value = ImageConstant.imgIcon16Ruler;
      userTagItemList.value.add(heightTag);
    }
    if(user.userSmoking != ""){
      UserTagItemModel smokingTag = new UserTagItemModel();
      smokingTag.attributevalue?.value = user.userSmoking!;
      smokingTag.attributeIcon?.value = ImageConstant.imgIcon16Smoking;
      userTagItemList.value.add(smokingTag);
    }
    if(user.userDrinking! != ""){
      UserTagItemModel drinkingTag = new UserTagItemModel();
      drinkingTag.attributevalue?.value = user.userDrinking!;
      drinkingTag.attributeIcon?.value = ImageConstant.imgIcon16Drink;
      userTagItemList.value.add(drinkingTag);
    }
    if(user.userMBTI != ""){
      UserTagItemModel mbtiTag = new UserTagItemModel();
      mbtiTag.attributevalue?.value = user.userMBTI!;
      mbtiTag.attributeIcon?.value = ImageConstant.imgIcon16Puzzlepiece;
      userTagItemList.value.add(mbtiTag);
    }
    if(user.userLookingFor != ""){
      UserTagItemModel lookingForTag = new UserTagItemModel();
      lookingForTag.attributevalue?.value = user.userLookingFor!;
      lookingForTag.attributeIcon?.value = ImageConstant.imgIcon16Puzzlepiece;
      userTagItemList.value.add(lookingForTag);
      if(user.userLookingFor == "Marriage" && user.userMarriageTarget != ""){
        UserTagItemModel marriageTargetTag = new UserTagItemModel();
        marriageTargetTag.attributevalue?.value = user.userMarriageTarget!;
        marriageTargetTag.attributeIcon?.value = ImageConstant.imgIcon16Puzzlepiece;
        userTagItemList.value.add(marriageTargetTag);
      }
    }
  }
}
