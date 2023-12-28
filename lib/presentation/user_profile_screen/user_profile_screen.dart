import '../user_profile_screen/widgets/tag2_item_widget.dart';
import 'controller/user_profile_controller.dart';
import 'models/tag2_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/chat_function_tab_container_page.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class UserProfileScreen extends GetWidget<UserProfileController> {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [_buildStack(), _buildUserProfile()])),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  Widget _buildStack() {
    return SizedBox(
        height: 360.adaptSize,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage360x360,
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
        padding: EdgeInsets.only(right: 18.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Text("lbl_general_info".tr,
                  style: theme.textTheme.bodyLarge)),
          SizedBox(height: 8.v),
          Obx(() => Wrap(
              runSpacing: 8.v,
              spacing: 8.h,
              children: List<Widget>.generate(
                  controller.userProfileModelObj.value.tag2ItemList.value
                      .length, (index) {
                Tag2ItemModel model = controller
                    .userProfileModelObj.value.tag2ItemList.value[index];
                return Tag2ItemWidget(model);
              })))
        ]));
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 16.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Text("lbl_name_age".tr,
                  style: CustomTextStyles.headlineSmallSemiBold)),
          SizedBox(height: 5.v),
          Padding(
              padding: EdgeInsets.only(left: 1.h),
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
          SizedBox(height: 26.v),
          _buildColumn(),
          SizedBox(height: 80.v),
          CustomElevatedButton(
              text: "lbl_edit_my_profile".tr,
              margin: EdgeInsets.symmetric(horizontal: 25.h),
              onPressed: () {
                onTapEditMyProfile();
              },
              alignment: Alignment.center),
          SizedBox(height: 7.v)
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

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapEditMyProfile() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
