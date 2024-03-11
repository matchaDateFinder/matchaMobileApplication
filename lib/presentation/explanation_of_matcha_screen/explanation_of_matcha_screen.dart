import 'package:matchaapplication/widgets/custom_elevated_button.dart';

import 'controller/explanation_of_matcha_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

class ExplanationOfMatchaScreen
    extends GetWidget<ExplanationOfMatchaController> {
  const ExplanationOfMatchaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 64.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.v),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 284.h,
                              margin: EdgeInsets.only(left: 46.h, right: 29.h),
                              child: Text("msg_matcha_explanation".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.titleLarge))),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 284.h,
                              margin: EdgeInsets.only(left: 46.h, right: 29.h),
                              child: Text("msg_matcha_specializes".tr,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyLarge,))),
                      Spacer(),
                      CustomImageView(
                          imagePath: ImageConstant.imgMatchaExplanation,
                          height: 263.v,
                          width: 360.h),
                      SizedBox(height: 29.v),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 24.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
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
                          ),
                        ),
                      ),
                      // Align(
                      //     alignment: Alignment.centerRight,
                      //     child: GestureDetector(
                      //         onTap: () {
                      //           onTapTxtNext();
                      //         },
                      //         child: Padding(
                      //             padding: EdgeInsets.only(right: 34.h),
                      //             child: Text("lbl_next".tr,
                      //                 style: theme.textTheme.bodyLarge)))),
                      SizedBox(height: 7.v)
                    ]))));
  }

  /// Navigates to the requestContactAccessScreen when the action is triggered.
  onTapTxtNext() {
    Get.toNamed(
      AppRoutes.explanationOfMutualScreen,
      arguments: Get.arguments,
    );
  }
}
