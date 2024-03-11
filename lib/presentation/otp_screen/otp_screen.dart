import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_image.dart';
import 'package:matchaapplication/widgets/custom_pin_code_text_field.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'controller/otp_controller.dart';

class OtpScreen extends GetWidget<OtpController> {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 48.h, vertical: 55.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_verification".tr,
                          style: theme.textTheme.titleLarge),
                      SizedBox(height: 27.v),
                      Container(
                          width: 214.h,
                          margin: EdgeInsets.only(right: 49.h),
                          child: Text("msg_verification_explanation".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(height: 1.71))),
                      SizedBox(height: 28.v),
                      Padding(
                          padding: EdgeInsets.only(right: 32.h),
                          child: Obx(() => CustomPinCodeTextField(
                              context: Get.context!,
                              controller: controller.otpController.value,
                              onChanged: (value) {}))),
                      Spacer(),
                      CustomElevatedButton(
                          text: "lbl_verify".tr,
                          onPressed: () {
                            _onPressVerify();
                          },
                          buttonStyle: CustomButtonStyles.fillBlack,
                      ),
                      SizedBox(height: 8.v),
                      Obx(() => CustomElevatedButton(
                          text: controller.buttonState.value == true ? "Resend OTP" : controller.otpResendTimer.value,
                          buttonStyle: controller.buttonState.value == true ? CustomButtonStyles.fillBlack : CustomButtonStyles.outlinePrimaryTL241,
                          buttonTextStyle: controller.buttonState.value == true ? CustomTextStyles.bodyLargePoppinsGray100 : CustomTextStyles.bodyLargePoppins,
                          onPressed: (){
                            if(controller.buttonState.value){
                              _onPressResendOTP();
                            }
                          }
                        ),
                      ),
                    SizedBox(height: 72.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 72.v,
        leadingWidth: 359.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.fromLTRB(27.h, 20.v, 314.h, 20.v),
            onTap: () {
              _onTapVector();
            }));
  }

  /// Navigates to the previous screen.
  _onTapVector() {
    Get.back();
  }

  _onPressVerify() async{
    controller.validateOTP();
  }

  _onPressResendOTP() async {
    await controller.resendOTPCode();
  }

}
