import '../user_profile_screen/widgets/tag2_item_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'controller/user_profile_controller.dart';
import 'models/tag2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class UserProfileScreen extends GetWidget<UserProfileController> {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [_buildStack(), _buildUserProfile()])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildStack() {
    return SizedBox(
        height: 360.adaptSize,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          Obx(() =>
              CachedNetworkImage(
                imageUrl: controller.userPhotoPath.value,
                fit: BoxFit.cover,
                height: 360.adaptSize,
                width: 360.adaptSize,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
          ),
        ]));
  }

  /// Section Widget
  Widget _buildColumn() {
    return Padding(
        padding: EdgeInsets.only(right: 18.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Text("lbl_general_info".tr,
                  style: theme.textTheme.bodyLarge)),
          SizedBox(height: 8.v),
          Obx(() => Wrap(
              runSpacing: 8.v,
              spacing: 8.h,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(
                  controller.userProfileModelObj.value.userTagItemList.value
                      .length, (index) {
                UserTagItemModel model = controller
                    .userProfileModelObj.value.userTagItemList.value[index];
                return UserTagItemWidget(model);
              })))
        ]));
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 16.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Obx(() => Text(controller.nameAge.value, // name and age
                  style: CustomTextStyles.headlineSmallSemiBold))),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgIcon16Briefcase,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.symmetric(vertical: 1.v)),
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: Obx(() => Text(controller.userProfession.value == '' ?
                        'Please complete your profile' : controller.userProfession.value,
                        style: theme.textTheme.bodyMedium))),
              ])),
          // SizedBox(height: 5.v),
          _buildColumn(),
          SizedBox(height: 15.v),
          CustomElevatedButton(
              text: "lbl_edit_my_profile".tr,
              margin: EdgeInsets.symmetric(horizontal: 25.h),
              onPressed: () {
                onTapEditMyProfile();
              },
              alignment: Alignment.center),
          // SizedBox(height: 7.v)
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      _onTapBottomNavigation(type);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.chatBottomType:
        return AppRoutes.chatFunctionContainerScreen;
      case BottomBarEnum.matchBottomType:
        return AppRoutes.candidateProfileScreen;
      case BottomBarEnum.profileBottomType:
        return AppRoutes.userProfileScreen;
      default:
        return "/";
    }
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapEditMyProfile() async {
    await controller.manuallyKillConstructor();
    Get.toNamed(
      AppRoutes.editProfileScreen,
      arguments: controller.phoneNumber
    );
  }

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }
}
