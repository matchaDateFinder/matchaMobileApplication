import 'controller/notice_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:matchaapplication/presentation/candidate_profile_screen/candidate_profile_screen.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class NoticeOneScreen extends GetWidget<NoticeOneController> {
  const NoticeOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.lightGreen200,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 53.h,
            vertical: 36.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 93.v),
              Text(
                "msg_that_s_it_for_today".tr,
                style: CustomTextStyles.headlineSmallSemiBold,
              ),
              SizedBox(height: 67.v),
              CustomImageView(
                imagePath: ImageConstant.imgImageNotice1,
                height: 195.v,
                width: 253.h,
              ),
              SizedBox(height: 33.v),
              Container(
                width: 214.h,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  "msg_come_back_again_for".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headlineSmallSemiBold.copyWith(
                    height: 1.33,
                  ),
                ),
              ),
              Spacer(),
              Obx(() =>
              CustomElevatedButton(
                  height: 32.v,
                  text: controller.textToShow.value,
                  margin: EdgeInsets.only(
                    left: 24.h,
                    right: 30.h,
                  ),
                  buttonStyle: CustomButtonStyles.fillLightGreen,
                  buttonTextStyle: CustomTextStyles.bodyMediumPoppins,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        _onTapBottomNavigation(type);
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.chatBottomType:
        return AppRoutes.chatFunctionTabContainerPage;
      case BottomBarEnum.matchBottomType:
        return AppRoutes.candidateProfileScreen;
      case BottomBarEnum.profileBottomType:
        return AppRoutes.userProfileScreen;
      default:
        return "/";
    }
  }

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }

}
