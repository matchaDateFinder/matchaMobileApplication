import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          screenTitle: "Edit Profile Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Match Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.matchProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Chat Function - Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.chatFunctionContainerScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Input Name".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.inputNameScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Notice One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.noticeOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Edit Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.editProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "User Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.userProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Input Phone Number".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.inputPhoneNumberScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Candidate Profile".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.candidateProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Complete Profile".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.completeProfileScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Notice Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.noticeTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Chat Room Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chatRoomTwoScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Input Gender".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.inputGenderScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Request Contact Access".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.requestContactAccessScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Chat Room One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chatRoomOneScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Upload Profile Picture".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.uploadProfilePictureScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Input Age".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.inputAgeScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "Explanation of Matcha".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.explanationOfMatchaScreen),
                        ),
                        _buildScreenTitle(
                          screenTitle: "LogIn/SignUp".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginSignupScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
