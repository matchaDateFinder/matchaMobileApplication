import 'controller/login_signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class LoginSignupScreen extends GetWidget<LoginSignupController> {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 128.v),
                  decoration: AppDecoration.fillLime,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 29.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          "lbl_matcha".tr,
                          style: theme.textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(height: 12.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          "msg_find_your_favorite".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 40.v),
                      _buildImageMain1(),
                      SizedBox(height: 21.v),
                      CustomElevatedButton(
                        text: "msg_login_with_phone".tr,
                        margin: EdgeInsets.only(
                          left: 49.h,
                          right: 47.h,
                        ),
                        buttonTextStyle: CustomTextStyles.bodyLargePoppinsLime50,
                        buttonStyle: CustomButtonStyles.fillBlack,
                        alignment: Alignment.center,
                        onPressed: () {
                          onTapLoginWithPhoneNumber();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgColor,
                height: 180.v,
                width: 272.h,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 129.v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildImageMain1() {
    return SizedBox(
      height: 247.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 225.v,
              width: 352.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.white.withOpacity(0),
                      height: 225.v,
                      width: 352.h,
                      child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgVectorMatchaLogin,
                                height: 247.v,
                                width: 360.h,
                                alignment: Alignment.center,
                              ),
                            ],
                      ),
                    ),
                    // child: SizedBox(
                    //   height: 225.v,
                    //   width: 352.h,
                    //   child: Stack(
                    //     alignment: Alignment.center,
                    //     children: [
                    //       CustomImageView(
                    //         imagePath: ImageConstant.imgVector225x352,
                    //         height: 225.v,
                    //         width: 352.h,
                    //         alignment: Alignment.center,
                    //       ),
                    //       CustomImageView(
                    //         imagePath: ImageConstant.imgVector1,
                    //         height: 225.v,
                    //         width: 352.h,
                    //         alignment: Alignment.center,
                    //       ),
                    //       CustomImageView(
                    //         imagePath: ImageConstant.imgVector247x360,
                    //         height: 247.v,
                    //         width: 360.h,
                    //         alignment: Alignment.center,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

    /// Navigates to the inputPhoneNumberScreen when the action is triggered.
  onTapLoginWithPhoneNumber() {
    Get.toNamed(
      AppRoutes.inputPhoneNumberScreen,
    );
  }
}
