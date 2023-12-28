import 'controller/chat_function_controller.dart';
import 'models/chat_function_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

// ignore_for_file: must_be_immutable
class ChatFunctionPage extends StatelessWidget {
  ChatFunctionPage({Key? key}) : super(key: key);

  ChatFunctionController controller =
      Get.put(ChatFunctionController(ChatFunctionModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 16.v),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              onTapUser1();
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 24.h, right: 80.h),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgAvatar,
                                          height: 64.adaptSize,
                                          width: 64.adaptSize,
                                          radius: BorderRadius.circular(32.h)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 24.h, bottom: 8.v),
                                          child: _buildFortyTwo(
                                              nameText: "lbl_name".tr,
                                              conversationText:
                                                  "msg_get_the_conversation"
                                                      .tr))
                                    ]))),
                        SizedBox(height: 32.v),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h, right: 80.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius:
                                              BorderRadius.circular(32.h))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, bottom: 8.v),
                                      child: _buildFortyTwo(
                                          nameText: "lbl_name".tr,
                                          conversationText:
                                              "msg_get_the_conversation".tr))
                                ])),
                        SizedBox(height: 32.v),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h, right: 80.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius:
                                              BorderRadius.circular(32.h))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, bottom: 8.v),
                                      child: _buildFortyTwo(
                                          nameText: "lbl_name".tr,
                                          conversationText:
                                              "msg_get_the_conversation".tr))
                                ])),
                        SizedBox(height: 32.v),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h, right: 80.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius:
                                              BorderRadius.circular(32.h))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, bottom: 8.v),
                                      child: _buildFortyTwo(
                                          nameText: "lbl_name".tr,
                                          conversationText:
                                              "msg_get_the_conversation".tr))
                                ])),
                        SizedBox(height: 32.v),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h, right: 80.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius:
                                              BorderRadius.circular(32.h))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, bottom: 8.v),
                                      child: _buildFortyTwo(
                                          nameText: "lbl_name".tr,
                                          conversationText:
                                              "msg_get_the_conversation".tr))
                                ])),
                        SizedBox(height: 32.v),
                        Padding(
                            padding: EdgeInsets.only(left: 24.h, right: 80.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius:
                                              BorderRadius.circular(32.h))),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.h, bottom: 8.v),
                                      child: _buildFortyTwo(
                                          nameText: "lbl_name".tr,
                                          conversationText:
                                              "msg_get_the_conversation".tr))
                                ])),
                        SizedBox(height: 32.v),
                        Container(
                            height: 64.adaptSize,
                            width: 64.adaptSize,
                            margin: EdgeInsets.only(left: 24.h),
                            decoration: BoxDecoration(
                                color: appTheme.blueGray100,
                                borderRadius: BorderRadius.circular(32.h))),
                        _buildEight(),
                        _buildNavigationBar()
                      ])
                ]))));
  }

  /// Section Widget
  Widget _buildEight() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 80.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 32.h),
              child: Text("lbl_name".tr, style: theme.textTheme.titleMedium)),
          SizedBox(height: 7.v),
          Align(
              alignment: Alignment.centerRight,
              child: Text("msg_get_the_conversation".tr,
                  style: CustomTextStyles.bodyLargeBlack900))
        ]));
  }

  /// Section Widget
  Widget _buildNavigationBar() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(vertical: 16.v),
        decoration: AppDecoration.fillLightGreen,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CustomImageView(
              imagePath: ImageConstant.imgFrame,
              height: 32.adaptSize,
              width: 32.adaptSize),
          CustomImageView(
              imagePath: ImageConstant.imgFramePrimary,
              height: 32.adaptSize,
              width: 32.adaptSize,
              onTap: () {
                onTapImgImage();
              }),
          CustomImageView(
              imagePath: ImageConstant.imgFramePrimary32x32,
              height: 32.adaptSize,
              width: 32.adaptSize,
              onTap: () {
                onTapImgImage1();
              })
        ]));
  }

  /// Common widget
  Widget _buildFortyTwo({
    required String nameText,
    required String conversationText,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(nameText,
          style:
              theme.textTheme.titleMedium!.copyWith(color: appTheme.black900)),
      SizedBox(height: 7.v),
      Text(conversationText,
          style: CustomTextStyles.bodyLargeBlack900
              .copyWith(color: appTheme.black900))
    ]);
  }

  /// Navigates to the chatRoomOneScreen when the action is triggered.
  onTapUser1() {
    Get.toNamed(
      AppRoutes.chatRoomOneScreen,
    );
  }

  /// Navigates to the candidateProfileScreen when the action is triggered.
  onTapImgImage() {
    Get.toNamed(
      AppRoutes.candidateProfileScreen,
    );
  }

  /// Navigates to the userProfileScreen when the action is triggered.
  onTapImgImage1() {
    Get.toNamed(
      AppRoutes.userProfileScreen,
    );
  }
}
