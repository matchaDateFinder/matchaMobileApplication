import 'controller/request_contact_access_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class RequestContactAccessScreen
    extends GetWidget<RequestContactAccessController> {
  const RequestContactAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 64.v, right: 24.h),
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
                      SizedBox(height: 40.v),
                      Container(
                          width: 250.h,
                          margin: EdgeInsets.only(left: 22.h, right: 39.h),
                          child: Text("msg_to_find_these_mutual".tr,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.headlineSmall)),
                      SizedBox(height: 44.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgImagePermission2,
                          height: 145.v,
                          width: 168.h,
                          alignment: Alignment.center),
                      SizedBox(height: 40.v),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgButton,
                                height: 24.adaptSize,
                                width: 24.adaptSize),
                            Padding(
                                padding: EdgeInsets.only(left: 16.h, top: 2.v),
                                child: Text("msg_terms_and_conditions".tr,
                                    style: CustomTextStyles.bodyLargeDMSansTnC
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline)))
                          ])),
                      SizedBox(height: 10.v),
                      CustomElevatedButton(
                          text: "msg_i_agree_find_my".tr,
                          margin: EdgeInsets.only(left: 22.h, right: 26.h),
                          onPressed: () {
                            onTapIAgreefindMyMatcha();
                          },
                          alignment: Alignment.center),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }

  /// Navigates to the inputNameScreen when the action is triggered.
  onTapIAgreefindMyMatcha() async {
    if (await controller.askPermissions()){
      Get.toNamed(
        AppRoutes.inputNameScreen,
        arguments: Get.arguments,
      );
    }else{
      print('permission denied');
    }

  }
}
