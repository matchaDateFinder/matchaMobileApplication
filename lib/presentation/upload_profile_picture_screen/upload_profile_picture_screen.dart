import 'dart:io';

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
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftPrimary,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          onTap: () {
                            onTapImgArrowLeft();
                          }),
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
                                Obx(()=>controller.selectedImagePath.value==''?
                                  Container(
                                      height: 264.adaptSize,
                                      width: 264.adaptSize,
                                      decoration: AppDecoration.fillOnPrimary.copyWith(
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
