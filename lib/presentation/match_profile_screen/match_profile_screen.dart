import '../match_profile_screen/widgets/tag_item_widget.dart';
import 'controller/match_profile_controller.dart';
import 'models/tag_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/chat_function_tab_container_page.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';

class MatchProfileScreen extends GetWidget<MatchProfileController> {
  const MatchProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [_buildStack(), _buildMatchProfile()])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildStack() {
    return SizedBox(
        height: 360.adaptSize,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage,
              height: 360.adaptSize,
              width: 360.adaptSize,
              alignment: Alignment.center),
          CustomAppBar(
              leadingWidth: double.maxFinite,
              leading: AppbarLeadingIconbutton(
                  imagePath: ImageConstant.imgArrowLeft,
                  margin: EdgeInsets.only(left: 20.h, right: 308.h),
                  onTap: () {
                    onTapArrowLeft();
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildColumn() {
    return Padding(
        padding: EdgeInsets.only(right: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_general_info".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 8.v),
          Obx(() => Wrap(
              runSpacing: 8.v,
              spacing: 8.h,
              children: List<Widget>.generate(
                  controller.matchProfileModelObj.value.tagItemList.value
                      .length, (index) {
                TagItemModel model = controller
                    .matchProfileModelObj.value.tagItemList.value[index];
                return TagItemWidget(model);
              })))
        ]));
  }

  /// Section Widget
  Widget _buildMatchProfile() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_name_age".tr,
              style: CustomTextStyles.headlineSmallSemiBold),
          SizedBox(height: 5.v),
          Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgIcon16Briefcase,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 1.v)),
            Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text("lbl_profession".tr,
                    style: theme.textTheme.bodyMedium))
          ]),
          SizedBox(height: 13.v),
          Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgIcon16Mutual,
                height: 16.adaptSize,
                width: 16.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 1.v)),
            Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text("lbl_mutual_info".tr,
                    style: theme.textTheme.bodyMedium))
          ]),
          SizedBox(height: 26.v),
          _buildColumn(),
          SizedBox(height: 5.v)
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
      case BottomBarEnum.chatBottomType:
        return AppRoutes.chatFunctionTabContainerPage;
      case BottomBarEnum.matchBottomType:
        return "/";
      case BottomBarEnum.profileBottomType:
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

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
