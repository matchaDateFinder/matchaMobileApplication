import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_image.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_subtitle.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 29.v),
                child: Column(children: [
                  SizedBox(height: 15.v),
                  SizedBox(
                      height: 128.adaptSize,
                      width: 128.adaptSize,
                      child: Stack(alignment: Alignment.center, children: [
                        Obx(() =>
                        ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: controller.photoLink.value,
                              fit: BoxFit.cover,
                              height: 128.adaptSize,
                              width: 128.adaptSize,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  CircularProgressIndicator(value: downloadProgress.progress),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                        )),
                        CustomImageView(
                            imagePath: ImageConstant.imgCamera,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            alignment: Alignment.center)
                      ])),
                  SizedBox(height: 47.v),
                  Obx(() => Padding(
                        padding: EdgeInsets.only(right: 1.h),
                        child: _buildEducation(
                            userImage: ImageConstant.imgFrameBlack90016x16,
                            educationText: "lbl_profession".tr,
                            addText: controller.userProfession.value =='' ? "lbl_add".tr : controller.userProfession.value,
                            onTabUserTag: () {
                              onTapAttributeTag();
                            }))
                  ),
                  SizedBox(height: 16.v),
                  Obx(() => Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgFrame16x16,
                          educationText: "lbl_education".tr,
                          addText: controller.userEducation.value =='' ? "lbl_add".tr : controller.userEducation.value,
                          onTabUserTag: () {
                            onTapAttributeTag();
                          }))
                  ),
                  SizedBox(height: 16.v),
                  Obx(() => Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Pray,
                          educationText: "lbl_religion".tr,
                          addText: controller.userReligion.value =='' ? "lbl_add".tr : controller.userReligion.value,
                          onTabUserTag: () {
                            onTapAttributeTag();
                          }))
                  ),
                  SizedBox(height: 14.v),
                  Obx(() => Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Ruler,
                          educationText: "lbl_height".tr,
                          addText: controller.userHeight.value =='' ? "lbl_add".tr : controller.userHeight.value,
                          onTabUserTag: () {
                            onTapAttributeTag();
                          }))
                  ),
                  SizedBox(height: 14.v),
                  Obx(() => Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Drink,
                          educationText: "lbl_drinking".tr,
                          addText: controller.userDrinking.value =='' ? "lbl_add".tr : controller.userDrinking.value,
                          onTabUserTag: () {
                            onTapAttributeTag();
                          }))
                  ),
                  SizedBox(height: 14.v),
                  Obx(() => Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Smoking,
                          educationText: "lbl_smoking".tr,
                          addText: controller.userSmoking.value =='' ? "lbl_add".tr : controller.userSmoking.value,
                          onTabUserTag: () {
                            onTapAttributeTag();
                          }))
                  ),
                  SizedBox(height: 14.v),
                  Obx(() => Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgFrame1,
                          educationText: "lbl_mbti".tr,
                          addText: controller.userMBTI.value =='' ? "lbl_add".tr : controller.userMBTI.value,
                          onTabUserTag: () {
                            onTapAttributeTag();
                          }))
                  ),
                  Spacer(),
                  InkWell(
                      child :
                      Text("lbl_log_out_account".tr,
                          style: CustomTextStyles.bodyLargeOnPrimaryContainer),
                      onTap: (){
                        onTapSignOutText();
                      }
                  ),
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_edit_profile".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      _onTapBottomNavigation(type);
    });
  }

  /// Common widget
  Widget _buildEducation({
    required String userImage,
    required String educationText,
    required String addText,
    Function? onTabUserTag,
  }) {
    return GestureDetector(
        onTap: () {
          onTabUserTag!.call();
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomImageView(
              imagePath: userImage,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.only(top: 4.v, bottom: 3.v)),
          Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(educationText,
                  style: CustomTextStyles.bodyLargeBlack900
                      .copyWith(color: appTheme.black900))),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(addText,
                  style: CustomTextStyles.bodyLargeDMSansBlack900
                      .copyWith(color: appTheme.black900))),
          CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.only(left: 8.h, top: 4.v, bottom: 3.v))
        ]));
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

  /// Navigates to the previous screen.
  onTapArrowLeft() async{
    await controller.manuallyKillConstructor();
    Get.toNamed(
        AppRoutes.userProfileScreen,
        arguments: controller.userPhoneNumber
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapAttributeTag() async {
    await controller.manuallyKillConstructor();
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
      arguments: controller.userPhoneNumber
    );
  }

  onTapSignOutText() async {
    await controller.logOutFromTheApp();
    await controller.manuallyKillConstructor();
    Get.toNamed(
      AppRoutes.loginSignupScreen
    );
  }

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }
}

