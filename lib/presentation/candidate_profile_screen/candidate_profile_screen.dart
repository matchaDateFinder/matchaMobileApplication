import '../candidate_profile_screen/widgets/tag4_item_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'controller/candidate_profile_controller.dart';
import 'models/tag4_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
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
                      Obx(() =>
                          CachedNetworkImage(
                            imageUrl: controller.userPhotoPath.value,
                            fit: BoxFit.cover,
                            height: 360.adaptSize,
                            width: 360.adaptSize,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                      ),
                      SizedBox(height: 5.v),
                      Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Obx(() => Text(controller.nameAge.value, // name and age
                              style: CustomTextStyles.headlineSmallSemiBold))),
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
                                child: Obx(() => Text(controller.userProfession.value == '' ?
                                'Please complete your profile' : controller.userProfession.value,
                                    style: theme.textTheme.bodyMedium)))
                          ])),
                      SizedBox(height: 10.v),
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
                                child: Obx(() => Text(controller.mutualName.value == '' ?
                                'for mutual' : controller.mutualName.value,
                                    style: theme.textTheme.bodyMedium)))
                          ])),
                      SizedBox(height: 10.v),
                      _buildCandidateProfile(),
                      SizedBox(height: 10.v),
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
                                        child: Icon(
                                          Icons.cancel,
                                          size: 48,
                                          color: appTheme.green800,
                                        ))),
                                Padding(
                                    padding: EdgeInsets.only(left: 39.h),
                                    child: CustomIconButton(
                                        height: 48.adaptSize,
                                        width: 48.adaptSize,
                                        onTap: () {
                                          onTapBtnCheckmark();
                                        },
                                        child: Icon(
                                            Icons.check_circle,
                                            size: 48,
                                            color: appTheme.green800,
                                        )))
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
                  controller.candidateProfileModelObj.value.candidateTagItemList.value
                      .length, (index) {
                CandidateTagItemModel model = controller
                    .candidateProfileModelObj.value.candidateTagItemList.value[index];
                return Tag4ItemWidget(model);
              })))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
       _onTapBottomNavigation(type);
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.chatBottomType:
        return AppRoutes.chatFunctionTabContainerPage;
      case BottomBarEnum.matchBottomType:
        return AppRoutes.candidateProfileScreen;
      case BottomBarEnum.profileBottomType:
        return AppRoutes.userProfileScreen;
      default:
        return "/";
    }
  }

  /// Navigates to the noticeOneScreen when the action is triggered.
  onTapBtnSearch() async {
    await controller.manuallyKillConstructor();
    if(!(await controller.saveUserReaction(false))){
      Get.toNamed(
        AppRoutes.noticeOneScreen,
      );
    }
  }

  /// Navigates to the noticeTwoScreen when the action is triggered.
  onTapBtnCheckmark() async {
    await controller.manuallyKillConstructor();
    if(await controller.saveUserReaction(true)){
      Get.toNamed(
        AppRoutes.noticeTwoScreen,
      );
    }else{
      Get.toNamed(
        AppRoutes.noticeOneScreen,
      );
    }
  }

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }

}
