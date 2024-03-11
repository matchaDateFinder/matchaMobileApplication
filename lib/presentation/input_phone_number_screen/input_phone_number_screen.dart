import 'controller/input_phone_number_controller.dart';
import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';
import 'package:matchaapplication/widgets/custom_phone_number.dart';

class InputPhoneNumberScreen extends GetWidget<InputPhoneNumberController> {
  const InputPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding:
                    EdgeInsets.symmetric(
                      horizontal: 47.h,
                      vertical: 127.v,
                    ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text(
                          "msg_what_s_your_number".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 56.v),
                      Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Obx(() => CustomPhoneNumber(
                            country: controller.selectedCountry.value,
                            controller: controller.phoneNumberController,
                            onTap: (Country value) {
                              controller.selectedCountry.value = value;
                            })),
                      ),
                      Spacer(),
                      CustomElevatedButton(
                          text: "msg_verify_your_number".tr,
                          onPressed: () {
                            onTapGetStarted();
                          },
                          margin: EdgeInsets.only(left: 1.h),
                          buttonStyle: CustomButtonStyles.fillBlack
                      )
                    ]))));
  }

  /// Navigates to the explanationOfMatchaScreen when the action is triggered.
  onTapGetStarted() async{
    if(controller.validateForm()){
      Get.toNamed(
          AppRoutes.otpVerifyScreen,
          arguments: controller.userDetail['userPhoneNumber']
      );
    }

  }
}
