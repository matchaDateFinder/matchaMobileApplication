import '../candidate_profile_screen/widgets/tag4_item_widget.dart';
import 'controller/candidate_profile_controller.dart';
import 'models/tag4_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/chat_function_tab_container_page.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:matchaapplication/widgets/custom_icon_button.dart';

class CandidateProfileScreen extends GetWidget<CandidateProfileController> {
  const CandidateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgImage,
                          height: 360.adaptSize,
                          width: 360.adaptSize),
                      SizedBox(height: 8.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text("lbl_name_age".tr,
                              style: CustomTextStyles.headlineSmallSemiBold)),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgIcon16Briefcase,
                                height: 16.adaptSize,
                                width: 16.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 1.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text("lbl_profession".tr,
                                    style: theme.textTheme.bodyMedium))
                          ])),
                      SizedBox(height: 13.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgIcon16Mutual,
                                height: 16.adaptSize,
                                width: 16.adaptSize,
                                margin: EdgeInsets.symmetric(vertical: 1.v)),
                            Padding(
                                padding: EdgeInsets.only(left: 8.h),
                                child: Text("lbl_mutual_info".tr,
                                    style: theme.textTheme.bodyMedium))
                          ])),
                      SizedBox(height: 26.v),
                      _buildCandidateProfile(),
                      SizedBox(height: 30.v),
                      Align(
                          alignment: Alignment.center,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.v),
                                    child: CustomIconButton(
                                        height: 48.adaptSize,
                                        width: 48.adaptSize,
                                        onTap: () {
                                          onTapBtnSearch();
                                        },
                                        child: CustomImageView())),
                                Padding(
                                    padding: EdgeInsets.only(left: 39.h),
                                    child: CustomIconButton(
                                        height: 52.adaptSize,
                                        width: 52.adaptSize,
                                        onTap: () {
                                          onTapBtnCheckmark();
                                        },
                                        child: CustomImageView()))
                              ])),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        centerTitle: true,
        title: AppbarSubtitleOne(text: "msg_next_profile_in".tr),
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildCandidateProfile() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_general_info".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 8.v),
          Obx(() => Wrap(
              runSpacing: 8.v,
              spacing: 8.h,
              children: List<Widget>.generate(
                  controller.candidateProfileModelObj.value.tag4ItemList.value
                      .length, (index) {
                Tag4ItemModel model = controller
                    .candidateProfileModelObj.value.tag4ItemList.value[index];
                return Tag4ItemWidget(model);
              })))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Get.toNamed(getCurrentRoute(type), id: 1);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Frameblack900:
        return AppRoutes.chatFunctionTabContainerPage;
      case BottomBarEnum.Frameblack90032x32:
        return "/";
      case BottomBarEnum.Frame32x32:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.chatFunctionTabContainerPage:
        return ChatFunctionTabContainerPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the noticeOneScreen when the action is triggered.
  onTapBtnSearch() {
    Get.toNamed(
      AppRoutes.noticeOneScreen,
    );
  }

  /// Navigates to the noticeTwoScreen when the action is triggered.
  onTapBtnCheckmark() {
    Get.toNamed(
      AppRoutes.noticeTwoScreen,
    );
  }
}
