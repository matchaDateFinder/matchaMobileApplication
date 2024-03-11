import 'package:matchaapplication/widgets/custom_elevated_button.dart';

import 'controller/input_age_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:intl/intl.dart';

class InputAgeScreen extends GetWidget<InputAgeController> {
  const InputAgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 64.v),
                child: Column(children: [
                  SizedBox(height: 39.v),
                  Text("msg_when_is_your_birthday".tr,
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 66.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Obx(
                          () => Text(
                           DateFormat("dd-MM-yyyy")
                            .format(controller.selectedDate.value)
                            .toString(),
                            style: TextStyle(fontSize:25),
                          )
                      )
                  ),
                  CustomElevatedButton(
                    onPressed: () => controller.chooseDate(),
                    text: 'Select date of birth',
                    buttonStyle: CustomButtonStyles.fillBlack
                  ),
                  Spacer(),
                  SizedBox(height: 32.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomElevatedButton(
                                height: 40.v,
                                width: 71.h,
                                text: "lbl_back".tr,
                                buttonStyle: CustomButtonStyles.outlinePrimaryTL201,
                                buttonTextStyle: CustomTextStyles.bodyLargePoppins,
                                onPressed: () {
                                  onPressBack();
                                },
                              ),
                              CustomElevatedButton(
                                height: 40.v,
                                width: 67.h,
                                text: "lbl_next".tr,
                                margin: EdgeInsets.only(left: 8.h),
                                buttonStyle: CustomButtonStyles.outlinePrimaryTL20,
                                onPressed: () {
                                  onTapTxtNext();
                                },
                              ),
                            ],
                          )))
                ]))));
  }

  /// Navigates to the previous screen.
  onPressBack() {
    Get.back();
  }

  /// Navigates to the inputGenderScreen when the action is triggered.
  onTapTxtNext() {
    if(controller.validateForm()){
      Get.toNamed(
        AppRoutes.inputGenderScreen,
        arguments: controller.userDetail,
      );
    }
  }
}
