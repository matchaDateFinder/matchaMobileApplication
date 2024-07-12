import 'controller/error_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ErrorScreen extends GetWidget<ErrorController> {
  const ErrorScreen({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.lightGreen200,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 53.h,
            vertical: 36.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 50.v),
              Obx(() =>
                  Text(
                    controller.errorTitle.value, //TODO change to variable according to controller
                    style: theme.textTheme.headlineLarge,
                  ),
              ),
              SizedBox(height: 30.v),
              Obx(() =>
                  CustomImageView(
                    imagePath: controller.errorImage.value, //TODO change to image
                    height: 195.v,
                    width: 253.h,
                  )
              ),
              SizedBox(height: 20.v),
              Obx(() =>
                  Container(
                    width: 214.h,
                    margin: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Text(
                      controller.errorTitle.value, //TODO change to variable according to controller
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.titleLargeSemiBold.copyWith(
                        height: 1.60,
                      ),
                    ),
                  )
              ),
              Spacer(),
              CustomElevatedButton( // TODO need to have logic to handle this
                height: 32.v,
                text: "Back to user profile",
                margin: EdgeInsets.only(
                  left: 24.h,
                  right: 30.h,
                ),
                buttonStyle: CustomButtonStyles.fillLightGreen,
                buttonTextStyle: CustomTextStyles.bodyMediumPoppins,
                onPressed: () {
                  returnToUserProfile();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  returnToUserProfile() async { // TODO need to have logic to handle this
    if (await controller.checkPermissionAgain()){
      String fetchRoutes = controller.fetchRoutes();
      Get.toNamed(
        fetchRoutes,
        arguments: controller.phoneNumber
      );
    }else{
      Get.defaultDialog(
          title: controller.errorTitle.value,
          content: Text(controller.errorTitle.value)
      );
    }
  }

}
