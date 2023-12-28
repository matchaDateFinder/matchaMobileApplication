import 'controller/input_name_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_text_form_field.dart';

class InputNameScreen extends GetWidget<InputNameController> {
  const InputNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 48.h, vertical: 95.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 31.v),
                      Text("msg_what_is_your_name".tr,
                          style: theme.textTheme.headlineSmall),
                      SizedBox(height: 67.v),
                      CustomTextFormField(
                          controller: controller.inputPlaceholderController,
                          hintText: "lbl_type_here".tr,
                          textInputAction: TextInputAction.done),
                      Spacer(),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtNext();
                              },
                              child: Text("lbl_next".tr,
                                  style: theme.textTheme.bodyLarge)))
                    ]))));
  }

  /// Navigates to the uploadProfilePictureScreen when the action is triggered.
  onTapTxtNext() {
    if(controller.validateForm()){
      Get.toNamed(
        AppRoutes.uploadProfilePictureScreen,
        arguments: controller.userDetail,
      );
    }
  }
}
