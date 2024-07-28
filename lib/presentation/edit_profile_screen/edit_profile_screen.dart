import 'package:matchaapplication/widgets/custom_elevated_button.dart';

import '../../widgets/app_bar/appbar_title.dart';
import 'controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_image.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EditProfileScreen extends GetWidget<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: _buildAppBar(),
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildAppBar(),
                  SizedBox(height: 48.v),
                  Expanded(
                    child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5.v),
                            padding: EdgeInsets.symmetric(horizontal: 13.h),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 96.adaptSize,
                                    width: 96.adaptSize,
                                    child: InkWell(
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Obx(() => controller.photoLink.value != controller.newLocalPhotoLink.value ?
                                                ClipOval(
                                                  child: CustomImageView(
                                                    imagePath: controller.newLocalPhotoLink.value,
                                                    height: 264.adaptSize,
                                                    width: 264.adaptSize,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ) : ClipOval(
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller.photoLink.value,
                                                    fit: BoxFit.cover,
                                                    height: 96.adaptSize,
                                                    width: 96.adaptSize,
                                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                        CircularProgressIndicator(value: downloadProgress.progress),
                                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                                    alignment: Alignment.center,
                                                  ),
                                                )
                                            ),
                                            CustomImageView(
                                                imagePath:
                                                ImageConstant.imgCamera,
                                                height: 24.adaptSize,
                                                width: 24.adaptSize,
                                                alignment: Alignment.center)
                                          ]
                                      ),
                                      onTap: () {
                                        _onPictureSelection();
                                      }
                                    )
                                ),
                                SizedBox(height: 15.v),
                                Obx(() => Text(controller.userNameAge.value,
                                    style: CustomTextStyles.titleLargeSemiBold)),
                                SizedBox(height: 15.v),
                                _buildFrameNine(),
                                SizedBox(height: 30.v),
                                CustomElevatedButton(
                                    height: 32.v,
                                    width: 200.h,
                                    text: "lbl_log_out_account".tr,
                                    onPressed: () {
                                      onTapSignOutText();
                                    },
                                    buttonStyle: CustomButtonStyles.outlineRedTransparentFilling,
                                    buttonTextStyle: CustomTextStyles.signOutRed
                                ),
                                SizedBox(height: 30.v),
                              ]
                          )
                      )
                    )
                  )
                ]
              )
            ),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        leadingWidth: 46.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 22.h),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_edit_profile".tr),
        styleType: Style.bgOutline,


    );
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      _onTapBottomNavigation(type);
    });
  }

  /// Section Widget
  Widget _buildFrameNine() {
    return Container(
        margin: EdgeInsets.only(left: 3.h),
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlinePrimary1
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder32),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
              padding: EdgeInsets.only(right: 3.h),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("msg_personal_information".tr,
                    style: theme.textTheme.titleMedium),
                Spacer(),
                CustomImageView(
                    imagePath: ImageConstant.imgEditIcon,
                    height: 16.adaptSize,
                    width: 16.adaptSize,
                    margin: EdgeInsets.only(top: 4.v, bottom: 3.v)),
                Padding(
                    padding: EdgeInsets.only(left: 8.h),
                    child: InkWell(
                     child: Text("lbl_edit_profile".tr,
                         style: CustomTextStyles.bodyMediumPoppins),
                        onTap: (){
                          onTapAttributeTag();
                        }
                    )
                )
              ])),
          SizedBox(height: 28.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgFrameBlack90016x16,
                  attributeTitle: "lbl_profession".tr,
                  attributeValue: controller.userProfession.value =='' ? "lbl_add".tr : controller.userProfession.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Academiccap,
                  attributeTitle: "lbl_education".tr,
                  attributeValue: controller.userEducation.value =='' ? "lbl_add".tr : controller.userEducation.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Pray,
                  attributeTitle: "lbl_religion".tr,
                  attributeValue: controller.userReligion.value =='' ? "lbl_add".tr : controller.userReligion.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 3.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Ruler,
                  attributeTitle: "lbl_height".tr,
                  attributeValue: controller.userHeight.value =='' ? "lbl_add".tr : controller.userHeight.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Drink,
                  attributeTitle: "lbl_drinking".tr,
                  attributeValue: controller.userDrinking.value =='' ? "lbl_add".tr : controller.userDrinking.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Smoking,
                  attributeTitle: "lbl_smoking".tr,
                  attributeValue: controller.userSmoking.value =='' ? "lbl_add".tr : controller.userSmoking.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Puzzlepiece,
                  attributeTitle: "lbl_mbti".tr,
                  attributeValue: controller.userMBTI.value =='' ? "lbl_add".tr : controller.userMBTI.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Puzzlepiece,
                  attributeTitle: "lbl_looking_for".tr,
                  attributeValue: controller.userLookingFor.value =='' ? "lbl_add".tr : controller.userLookingFor.value))),
          SizedBox(height: 16.v),
          Obx(() => Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: _buildAttribute(
                  attributeImage: ImageConstant.imgIcon16Puzzlepiece,
                  attributeTitle: "lbl_marriage_target".tr,
                  attributeValue: controller.userMarriageTarget.value =='' ? "lbl_add".tr : controller.userMarriageTarget.value))),
          // SizedBox(height: 16.v),
          // Padding(
          //     padding: EdgeInsets.only(right: 1.h),
          //     child: _buildAttribute(
          //         attributeImage: ImageConstant.imgFramePrimary16x16,
          //         attributeTitle: "lbl_location".tr,
          //         attributeValue: "lbl_location_added".tr))
        ]));
  }

  /// Common widget
  Widget _buildAttribute({
    required String attributeImage,
    required String attributeTitle,
    required String attributeValue,
  }) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
              imagePath: attributeImage,
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.only(top: 3.v, bottom: 4.v)),
          Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(attributeTitle,
                  style: CustomTextStyles.bodyLargePoppins
                      .copyWith(color: theme.colorScheme.primary))),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text(attributeValue,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.primary))),
        ]
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.chatBottomType:
        return AppRoutes.chatFunctionContainerScreen;
      case BottomBarEnum.matchBottomType:
        return AppRoutes.candidateProfileScreen;
      case BottomBarEnum.profileBottomType:
        return AppRoutes.userProfileScreen;
      default:
        return "/";
    }
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() async{
    await controller.manuallyKillConstructor();
    Get.toNamed(
        AppRoutes.userProfileScreen,
        arguments: controller.userPhoneNumber
    );
  }

  /// Navigates to the editProfileTwoScreen when the action is triggered.
  onTapAttributeTag() async {
    await controller.manuallyKillConstructor();
    Get.toNamed(
      AppRoutes.editProfileTwoScreen,
      arguments: controller.userPhoneNumber
    );
  }

  onTapSignOutText() async {
    await controller.logOutFromTheApp();
    await controller.manuallyKillConstructor();
    Get.toNamed(
      AppRoutes.loginSignupScreen
    );
  }

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }

  _onPictureSelection() async {
    if(await controller.askPermissions()){
      controller.getImage();
    }else{
      Get.defaultDialog(
          title: "Gallery access was not given",
          content: Text("Please give Matcha access to your Gallery and Camera")
      );
    }
  }

}

