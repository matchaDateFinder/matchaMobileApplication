import 'controller/notice_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/chat_function_tab_container_page.dart';
import 'package:matchaapplication/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:matchaapplication/presentation/candidate_profile_screen/candidate_profile_screen.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class NoticeTwoScreen extends GetWidget<NoticeTwoController> {
  const NoticeTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.lightGreen200,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 42.v),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  SizedBox(height: 87.v),
                  Text("lbl_congratulation".tr,
                      style: CustomTextStyles.headlineSmallSemiBold),
                  SizedBox(height: 38.v),
                  _buildEightyNineStack(),
                  SizedBox(height: 39.v),
                  Text("lbl_it_s_a_match_a".tr,
                      style: CustomTextStyles.headlineSmallSemiBold),
                  SizedBox(height: 64.v),
                  CustomElevatedButton(
                      text: "msg_ask_for_a_matcha".tr,
                      margin: EdgeInsets.symmetric(horizontal: 21.h),
                      onPressed: () {
                        onTapAskForAMatchaDate();
                      }),
                  SizedBox(height: 17.v),
                  GestureDetector(
                      onTap: () {
                        onTapTxtSkipForNow();
                      },
                      child: Text("lbl_skip_for_now".tr,
                          style: theme.textTheme.bodyLarge))
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildEightyNineStack() {
    return SizedBox(
        height: 228.v,
        width: 306.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: 144.v,
                  width: 161.h,
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: fs.Svg(ImageConstant.imgUser2),
                          fit: BoxFit.cover)),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgAvatar2,
                      height: 128.adaptSize,
                      width: 128.adaptSize,
                      radius: BorderRadius.circular(64.h),
                      alignment: Alignment.centerLeft))),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  height: 144.v,
                  width: 175.h,
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: fs.Svg(ImageConstant.imgUser1),
                          fit: BoxFit.cover)),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgAvatar1,
                      height: 128.adaptSize,
                      width: 128.adaptSize,
                      radius: BorderRadius.circular(64.h),
                      alignment: Alignment.centerRight)))
        ]));
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

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.chatFunctionTabContainerPage:
        return ChatFunctionTabContainerPage();
      case AppRoutes.candidateProfileScreen:
        return CandidateProfileScreen();
      case AppRoutes.userProfileScreen:
        return UserProfileScreen();
      default:
        return DefaultWidget();
    }
  }

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }

  /// Navigates to the chatRoomOneScreen when the action is triggered.
  onTapAskForAMatchaDate() {
    Get.toNamed(
      AppRoutes.chatRoomOneScreen,
    );
  }

  /// Navigates to the noticeOneScreen when the action is triggered.
  onTapTxtSkipForNow() {
    Get.toNamed(
      AppRoutes.userProfileScreen,
    );
  }
}
