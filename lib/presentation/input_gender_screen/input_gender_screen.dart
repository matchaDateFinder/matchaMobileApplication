import 'package:matchaapplication/widgets/custom_elevated_button.dart';

import 'controller/input_gender_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_radio_button.dart';

class InputGenderScreen extends GetWidget<InputGenderController> {
  const InputGenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 64.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("msg_what_is_your_gender".tr,
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 65.v),
                      _buildGenderSelection(),
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

  /// Section Widget
  Widget _buildGenderSelection() {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Obx(() => Column(children: [
                  CustomRadioButton(
                      width: 264.h,
                      text: "lbl_woman".tr,
                      value: controller
                          .inputGenderModelObj.value.radioList.value[0],
                      groupValue: controller.radioGroup.value,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 13.v),
                      isRightCheck: true,
                      onChange: (value) {
                        controller.radioGroup.value = value;
                      }),
                  Padding(
                      padding: EdgeInsets.only(top: 16.v),
                      child: CustomRadioButton(
                          width: 264.h,
                          text: "lbl_man".tr,
                          value: controller
                              .inputGenderModelObj.value.radioList.value[1],
                          groupValue: controller.radioGroup.value,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.h, vertical: 13.v),
                          isRightCheck: true,
                          onChange: (value) {
                            controller.radioGroup.value = value;
                          }))
                ]))));
  }

  /// Navigates to the previous screen.
  onPressBack() {
    Get.back();
  }

  /// Navigates to the completeProfileScreen when the action is triggered.
  onTapTxtNext() {
    if(controller.validateForm()){
      Get.toNamed(
        AppRoutes.completeProfileScreen,
        arguments: controller.userDetail,
      );
    }
  }
}
