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
            backgroundColor: appTheme.lightGreen200,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 120.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLogo1,
                          height: 360.adaptSize,
                          width: 360.adaptSize),
                      Spacer(),
                      SizedBox(height: 8.v),
                      CustomElevatedButton(
                          text: "msg_login_with_phone".tr,
                          margin: EdgeInsets.symmetric(horizontal: 48.h),
                          onPressed: () {
                            onTapLoginWithPhoneNumber();
                          })
                    ]))));
  }

  /// Navigates to the inputPhoneNumberScreen when the action is triggered.
  onTapLoginWithPhoneNumber() {
    Get.toNamed(
      AppRoutes.inputPhoneNumberScreen,
    );
  }
}
