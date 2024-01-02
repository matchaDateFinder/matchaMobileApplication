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
                    EdgeInsets.symmetric(horizontal: 48.h, vertical: 127.v),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("msg_what_s_your_number".tr,
                          style: theme.textTheme.headlineSmall),
                      SizedBox(height: 49.v),
                      Obx(() => CustomPhoneNumber(
                          country: controller.selectedCountry.value,
                          controller: controller.phoneNumberController,
                          onTap: (Country value) {
                            controller.selectedCountry.value = value;
                          })),
                      Spacer(),
                      CustomElevatedButton(
                          text: "lbl_get_started".tr,
                          onPressed: () {
                            onTapGetStarted();
                          })
                    ]))));
  }

  /// Navigates to the explanationOfMatchaScreen when the action is triggered.
  onTapGetStarted() async{
    if(controller.validateForm()){
      if(await controller.checkForExistingUser()){ // existing user means login
        Get.toNamed(
            AppRoutes.userProfileScreen,
            arguments: controller.userDetail['userPhoneNumber']
        );
      }else{ // non existing user means register
        Get.toNamed(
            AppRoutes.explanationOfMatchaScreen,
            arguments: controller.userDetail['userPhoneNumber']
        );
      }
    }
  }
}
