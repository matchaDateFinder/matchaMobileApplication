import 'package:matchaapplication/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'controller/explanation_of_mutual_controller.dart';

// ignore_for_file: must_be_immutable
class ExplanationOfMutualScreen
    extends GetWidget<ExplanationOfMutualController> {
  const ExplanationOfMutualScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 32.v),
          child: Column(
            children: [
              SizedBox(
                height: 553.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 46.h,
                          right: 73.h,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 199.h,
                              margin: EdgeInsets.only(right: 40.h),
                              child: Text(
                                "msg_matcha_explanation_2".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.titleLarge,
                              ),
                            ),
                            SizedBox(height: 15.v),
                            SizedBox(
                              width: 260.h,
                              child: Text(
                                "msg_matcha_specializes_2".tr,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 400.v,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgMutualMatcha,
                              height: 400.v,
                              width: 360.v,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 46.v),
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
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTwelve() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 366.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgVector366x360,
              height: 366.v,
              width: 360.h,
              alignment: Alignment.center,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVector6,
              height: 225.v,
              width: 360.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 25.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSixteen() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 225.v,
        width: 320.h,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgVector225x320,
              height: 225.v,
              width: 320.h,
              alignment: Alignment.center,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgVector84x70,
              height: 84.v,
              width: 70.h,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 33.h),
            ),
          ],
        ),
      ),
    );
  }

  onTapTxtNext() {
    Get.toNamed(
      AppRoutes.requestContactAccessScreen,
      arguments: Get.arguments,
    );
  }

  onPressBack(){
    Get.back();
  }
}
