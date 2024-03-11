
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

import 'controller/upload_profile_picture_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

class UploadProfilePictureScreen
    extends GetWidget<UploadProfilePictureController> {
  const UploadProfilePictureScreen({Key? key}) : super(key: key);

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
                      SizedBox(height: 38.v),
                      Container(
                          width: 146.h,
                          margin: EdgeInsets.only(left: 24.h),
                          child: Text("msg_upload_your_best".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.headlineSmall!
                                  .copyWith(height: 1.33))),
                      SizedBox(height: 33.v),
                      Align(
                          alignment: Alignment.center,
                          child: InkWell(
                              child :
                                Obx(() => controller.selectedImagePath.value==''?
                                  Container(
                                      height: 264.adaptSize,
                                      width: 264.adaptSize,
                                      decoration: AppDecoration.outlineFillPrimary.copyWith(
                                          borderRadius:
                                          BorderRadiusStyle.roundedBorder10),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgButtonPrimary,
                                          height: 32.adaptSize,
                                          width: 32.adaptSize,
                                          alignment: Alignment.center)
                                  ) : CustomImageView(
                                  imagePath: controller.selectedImagePath.value,
                                  height: 264.adaptSize,
                                  width: 264.adaptSize,
                                )
                                // Image.file(File(controller.selectedImagePath.value))
                                ),
                                onTap: (){
                                  _onPictureSelection();
                                }
                          )
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

  /// Navigates to the inputAgeScreen when the action is triggered.
  onTapTxtNext() {
    if(controller.validateForm()){
      Get.toNamed(
        AppRoutes.inputAgeScreen,
        arguments: controller.userDetail,
      );
    }
  }

  _onPictureSelection() async {
    controller.getImage();
  }

}
