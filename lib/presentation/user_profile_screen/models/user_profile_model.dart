import 'tag2_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [user_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UserProfileModel {
  Rx<List<UserTagItemModel>> userTagItemList = Rx([]);

  Future<void> setItemTag(user) async{
    if (user != null) {
      if(user.education != ""){
        UserTagItemModel educationTag = new UserTagItemModel();
        educationTag.attributevalue?.value = user.education;
        educationTag.attributeIcon?.value = ImageConstant.imgIcon16Academiccap;
        userTagItemList.value.add(educationTag);
      }
      if(user.religion != ""){
        UserTagItemModel religionTag = new UserTagItemModel();
        religionTag.attributevalue?.value = user.religion;
        religionTag.attributeIcon?.value = ImageConstant.imgIcon16Pray;
        userTagItemList.value.add(religionTag);
      }
      if(user.height != 0){
        UserTagItemModel heightTag = new UserTagItemModel();
        heightTag.attributevalue?.value = user.height.toString();
        heightTag.attributeIcon?.value = ImageConstant.imgIcon16Ruler;
        userTagItemList.value.add(heightTag);
      }
      if(user.smoking != ""){
        UserTagItemModel smokingTag = new UserTagItemModel();
        smokingTag.attributevalue?.value = user.smoking;
        smokingTag.attributeIcon?.value = ImageConstant.imgIcon16Smoking;
        userTagItemList.value.add(smokingTag);
      }
      if(user.drinking != ""){
        UserTagItemModel drinkingTag = new UserTagItemModel();
        drinkingTag.attributevalue?.value = user.drinking;
        drinkingTag.attributeIcon?.value = ImageConstant.imgIcon16Drink;
        userTagItemList.value.add(drinkingTag);
      }
      if(user.mbti != ""){
        UserTagItemModel mbtiTag = new UserTagItemModel();
        mbtiTag.attributevalue?.value = user.mbti;
        mbtiTag.attributeIcon?.value = ImageConstant.imgIcon16Puzzlepiece;
        userTagItemList.value.add(mbtiTag);
      }
    }

  }
}
