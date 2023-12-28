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
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftPrimary,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        onTapImgArrowLeft();
                      }),
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
                  ),
                  Spacer(),
                  SizedBox(height: 32.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {
                            onTapTxtNext();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(right: 24.h),
                              child: Text("lbl_next".tr,
                                  style: theme.textTheme.bodyLarge))))
                ]))));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
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
