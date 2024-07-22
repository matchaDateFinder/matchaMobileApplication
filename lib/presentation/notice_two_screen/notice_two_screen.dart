import 'controller/notice_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:matchaapplication/core/app_export.dart';
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
                      SizedBox(height: 30.v),
                      Text("lbl_it_s_a_match_a".tr,
                        style: theme.textTheme.headlineLarge
                      ),
                      SizedBox(height: 10.v),
                      _buildEightyNineStack(),
                      SizedBox(height: 10.v),
                      CustomElevatedButton(
                          text: "msg_ask_for_a_matcha".tr,
                          margin: EdgeInsets.symmetric(horizontal: 21.h),
                          onPressed: () {
                            onTapAskForAMatchaDate();
                          },
                          buttonStyle: CustomButtonStyles.fillBlack,
                      ),
                      SizedBox(height: 10.v),
                      CustomElevatedButton(
                        text: "lbl_skip_for_now".tr,
                        margin: EdgeInsets.symmetric(horizontal: 21.h),
                        onPressed: () {
                          onTapTxtSkipForNow();
                        },
                        buttonStyle: CustomButtonStyles.outlinePrimary,
                      ),
                ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildEightyNineStack() {
    return SizedBox(
        height: 320.v,
        width: 320.h,
        child: Stack(alignment: Alignment.center, children: [
          // Align(
          //     alignment: Alignment.bottomRight,
          //     child: Container(
          //         height: 144.v,
          //         width: 161.h,
          //         padding: EdgeInsets.all(8.h),
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: fs.Svg(ImageConstant.imgUser2),
          //                 fit: BoxFit.cover)),
          //         child: CustomImageView(
          //             imagePath: controller.userPhotoLink,
          //             height: 128.adaptSize,
          //             width: 128.adaptSize,
          //             radius: BorderRadius.circular(64.h),
          //             alignment: Alignment.centerLeft))),
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 320.v,
                  width: 320.h,
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: fs.Svg(ImageConstant.imgUser1),
                          fit: BoxFit.cover)),
                  child: CustomImageView(
                      imagePath: controller.candidatePhotoLink,
                      height: 320.adaptSize,
                      width: 320.adaptSize,
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
        return AppRoutes.chatFunctionContainerScreen;
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

  /// Navigates to the chatRoomOneScreen when the action is triggered.
  onTapAskForAMatchaDate() async {
    Map<String, String> mapOfArguments = await controller.convertToMap();
    await controller.manuallyKillConstructor();
    Get.toNamed(
        AppRoutes.chatRoomOneScreen,
        arguments: mapOfArguments
    );
  }

  /// Navigates to the noticeOneScreen when the action is triggered.
  onTapTxtSkipForNow() async {
    await controller.manuallyKillConstructor();
    Get.toNamed(
      AppRoutes.userProfileScreen,
    );
  }
}
