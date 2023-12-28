import 'controller/complete_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class CompleteProfileScreen extends GetWidget<CompleteProfileController> {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 64.v, right: 24.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftPrimary,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          onTap: () {
                            onTapImgArrowLeft();
                          }),
                      SizedBox(height: 38.v),
                      Container(
                          width: 177.h,
                          margin: EdgeInsets.only(left: 24.h),
                          child: Text("msg_boost_your_first".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 29.v),
                      Container(
                          width: 226.h,
                          margin: EdgeInsets.only(left: 24.h, right: 61.h),
                          child: Text("msg_complete_your_profile".tr,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.bodyLargeGray700)),
                      SizedBox(height: 45.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgImageCompleteprofile,
                          height: 178.v,
                          width: 176.h,
                          alignment: Alignment.center),
                      SizedBox(height: 47.v),
                      CustomElevatedButton(
                          text: "msg_complete_my_profile".tr,
                          margin: EdgeInsets.symmetric(horizontal: 24.h),
                          onPressed: () {
                            onTapCompleteMyProfile();
                          },
                          alignment: Alignment.center),
                      SizedBox(height: 25.v),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtSkipForNow();
                              },
                              child: Text("lbl_skip_for_now".tr,
                                  style: theme.textTheme.bodyLarge))),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapCompleteMyProfile() {
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
    );
  }

  /// Navigates to the candidateProfileScreen when the action is triggered.
  onTapTxtSkipForNow() {
    Get.toNamed(
      AppRoutes.userProfileScreen,
    );
  }
}
