import 'controller/complete_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class CompleteProfileScreen extends GetWidget<CompleteProfileController> {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 48.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 33.v),
                      SizedBox(
                        width: 150.h,
                        child: Text(
                          "msg_boost_your_first".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleLarge!.copyWith(
                            height: 1.60,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Container(
                          width: 226.h,
                          margin: EdgeInsets.only(right: 37.h),
                          child: Text(
                            "msg_complete_your_profile".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyLargePoppins.copyWith(
                              height: 1.50,
                            ),
                          ),
                      ),
                      SizedBox(height: 45.v),
                      SizedBox(height: 29.v),
                      CustomImageView(
                        imagePath: ImageConstant.imgCompleteMatchaProfile,
                        height: 197.v,
                        width: 264.h,
                      ),
                      SizedBox(height: 42.v),
                      CustomElevatedButton(
                          text: "msg_complete_my_profile".tr,
                          margin: EdgeInsets.symmetric(horizontal: 24.h),
                          onPressed: () {
                            onTapCompleteMyProfile();
                          },
                          alignment: Alignment.center,
                          buttonTextStyle: CustomTextStyles.bodyLargePoppinsLightgreen50,
                          buttonStyle: CustomButtonStyles.fillBlack
                      ),
                      SizedBox(height: 8.v),
                      CustomElevatedButton(
                          text: "msg_maybe_later".tr,
                          margin: EdgeInsets.symmetric(horizontal: 24.h),
                          onPressed: () {
                            onTapTxtSkipForNow();
                          },
                          alignment: Alignment.center,
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL241,
                          buttonTextStyle: CustomTextStyles.bodyLargePoppins,
                      ),
                    ]))));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapCompleteMyProfile() async {
    // await controller.saveDataToDatabase();
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
      arguments: controller.userDetail['userPhoneNumber'],
    );
  }

  /// Navigates to the candidateProfileScreen when the action is triggered.
  onTapTxtSkipForNow() async {
    // await controller.saveDataToDatabase();
    Get.toNamed(
      AppRoutes.userProfileScreen,
      arguments: controller.userDetail['userPhoneNumber'],
    );
  }
}
