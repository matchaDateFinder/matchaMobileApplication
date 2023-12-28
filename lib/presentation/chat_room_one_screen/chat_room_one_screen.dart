import 'controller/chat_room_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_image.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_title.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_text_form_field.dart';

class ChatRoomOneScreen extends GetWidget<ChatRoomOneController> {
  const ChatRoomOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: theme.colorScheme.onPrimary,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 48.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgAvatar96x96,
                      height: 96.adaptSize,
                      width: 96.adaptSize,
                      radius: BorderRadius.circular(48.h),
                      onTap: () {
                        onTapImgAvatar();
                      }),
                  SizedBox(height: 31.v),
                  Text("msg_get_the_conversation".tr,
                      style: theme.textTheme.bodyLarge),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildChatBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_name".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildChatBar() {
    return Container(
        margin: EdgeInsets.only(left: 23.h, right: 23.h, bottom: 16.v),
        decoration: AppDecoration.fillLightGreen,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgFramePrimary24x24,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 4.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgFrame24x24,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 8.h, top: 4.v, bottom: 4.v)),
              Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: CustomTextFormField(
                      width: 200.h,
                      controller: controller.textHereController,
                      hintText: "lbl_text_here".tr,
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 9.h, vertical: 5.v))),
              GestureDetector(
                  onTap: () {
                    onTapTxtSend();
                  },
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 8.h, top: 4.v, bottom: 3.v),
                      child: Text("lbl_send".tr,
                          style: theme.textTheme.bodyLarge)))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the matchProfileScreen when the action is triggered.
  onTapImgAvatar() {
    Get.toNamed(
      AppRoutes.matchProfileScreen,
    );
  }

  /// Navigates to the chatRoomTwoScreen when the action is triggered.
  onTapTxtSend() {
    Get.toNamed(
      AppRoutes.chatRoomTwoScreen,
    );
  }
}
