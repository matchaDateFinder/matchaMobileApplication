import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/chat_function_tab_container_page.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_image.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_subtitle.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';

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
                        CustomImageView(
                            imagePath: ImageConstant.imgAvatar128x128,
                            height: 128.adaptSize,
                            width: 128.adaptSize,
                            radius: BorderRadius.circular(64.h),
                            alignment: Alignment.center),
                        CustomImageView(
                            imagePath: ImageConstant.imgCamera,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            alignment: Alignment.center)
                      ])),
                  SizedBox(height: 47.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgFrameBlack90016x16,
                          educationText: "lbl_profession".tr,
                          addText: "lbl_add".tr,
                          onTapEducation: () {
                            onTapProfession();
                          })),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgFrame16x16,
                          educationText: "lbl_education".tr,
                          addText: "lbl_add".tr,
                          onTapEducation: () {
                            onTapEducation();
                          })),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Pray,
                          educationText: "lbl_religion".tr,
                          addText: "lbl_add".tr,
                          onTapEducation: () {
                            onTapReligion();
                          })),
                  SizedBox(height: 14.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Ruler,
                          educationText: "lbl_height".tr,
                          addText: "lbl_add".tr,
                          onTapEducation: () {
                            onTapHeight();
                          })),
                  SizedBox(height: 14.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Drink,
                          educationText: "lbl_drinking".tr,
                          addText: "lbl_add".tr,
                          onTapEducation: () {
                            onTapDrinking();
                          })),
                  SizedBox(height: 14.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgIcon16Smoking,
                          educationText: "lbl_smoking".tr,
                          addText: "lbl_add".tr,
                          onTapEducation: () {
                            onTapSmoking();
                          })),
                  SizedBox(height: 14.v),
                  Padding(
                      padding: EdgeInsets.only(right: 1.h),
                      child: _buildEducation(
                          userImage: ImageConstant.imgFrame1,
                          educationText: "lbl_mbti".tr,
                          addText: "lbl_add".tr,
                          onTapEducation: () {
                            onTapMbti();
                          })),
                  Spacer(),
                  Text("lbl_log_out_account".tr,
                      style: CustomTextStyles.bodyLargeOnPrimaryContainer)
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
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  /// Common widget
  Widget _buildEducation({
    required String userImage,
    required String educationText,
    required String addText,
    Function? onTapEducation,
  }) {
    return GestureDetector(
        onTap: () {
          onTapEducation!.call();
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
      case BottomBarEnum.Frameblack900:
        return AppRoutes.chatFunctionTabContainerPage;
      case BottomBarEnum.Frameblack90032x32:
        return "/";
      case BottomBarEnum.Frame32x32:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.chatFunctionTabContainerPage:
        return ChatFunctionTabContainerPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapProfession() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
      arguments: controller.userPhoneNumber
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapEducation() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapReligion() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapHeight() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapDrinking() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapSmoking() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapMbti() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
    );
  }
}
