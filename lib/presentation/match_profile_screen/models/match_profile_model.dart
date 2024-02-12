import 'tag_item_model.dart';
import '../../../core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';

/// This class defines the variables used in the [match_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MatchProfileModel {
  Rx<List<TagItemModel>> userTagItemList = Rx([]);

  Future<void> setItemTag(UserFireStoreModel user) async{
    if (user != null) {
      if(user.userEducation != ""){
        TagItemModel educationTag = new TagItemModel();
        educationTag.attributevalue?.value = user.userEducation!;
        educationTag.attributeIcon?.value = ImageConstant.imgIcon16Academiccap;
        userTagItemList.value.add(educationTag);
      }
      if(user.userReligion != ""){
        TagItemModel religionTag = new TagItemModel();
        religionTag.attributevalue?.value = user.userReligion!;
        religionTag.attributeIcon?.value = ImageConstant.imgIcon16Pray;
        userTagItemList.value.add(religionTag);
      }
      if(user.userHeight != 0){
        TagItemModel heightTag = new TagItemModel();
        heightTag.attributevalue?.value = user.userHeight!.toString() + "cm";
        heightTag.attributeIcon?.value = ImageConstant.imgIcon16Ruler;
        userTagItemList.value.add(heightTag);
      }
      if(user.userSmoking != ""){
        TagItemModel smokingTag = new TagItemModel();
        smokingTag.attributevalue?.value = user.userSmoking!;
        smokingTag.attributeIcon?.value = ImageConstant.imgIcon16Smoking;
        userTagItemList.value.add(smokingTag);
      }
      if(user.userDrinking! != ""){
        TagItemModel drinkingTag = new TagItemModel();
        drinkingTag.attributevalue?.value = user.userDrinking!;
        drinkingTag.attributeIcon?.value = ImageConstant.imgIcon16Drink;
        userTagItemList.value.add(drinkingTag);
      }
      if(user.userMBTI != ""){
        TagItemModel mbtiTag = new TagItemModel();
        mbtiTag.attributevalue?.value = user.userMBTI!;
        mbtiTag.attributeIcon?.value = ImageConstant.imgIcon16Puzzlepiece;
        userTagItemList.value.add(mbtiTag);
      }
    }
  }
}
