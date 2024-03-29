import 'controller/edit_profile_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_image.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_drop_down.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';
import 'package:matchaapplication/widgets/custom_radio_button.dart';
import 'package:matchaapplication/widgets/custom_text_form_field.dart';
import 'package:matchaapplication/widgets/custom_numeric_form_field.dart';

class EditProfileTwoScreen extends GetWidget<EditProfileTwoController> {
  const EditProfileTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 33.v),
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 48.h, right: 48.h, bottom: 5.v),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("msg_what_is_your_profession".tr,
                                  style: theme.textTheme.bodyLarge)),
                          SizedBox(height: 30.v),
                          CustomTextFormField(
                              controller: controller.answerProfessionController,
                              hintText: "lbl_type_here".tr,
                              textInputAction: TextInputAction.done),
                          SizedBox(height: 50.v),
                          _buildEducation(),
                          SizedBox(height: 50.v),
                          _buildReligion(),
                          SizedBox(height: 50.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("msg_what_is_your_height".tr,
                                  style: theme.textTheme.bodyLarge)),
                          SizedBox(height: 50.v),
                          CustomNumericFormField(
                              controller: controller.answerHeightController,
                              hintText: "lbl_height_in_cm".tr,
                              textInputAction: TextInputAction.done),
                          SizedBox(height: 50.v),
                          _buildDrinking(),
                          SizedBox(height: 50.v),
                          _buildSmoking(),
                          SizedBox(height: 50.v),
                          _buildMbti(),
                          SizedBox(height: 50.v),
                          _buildWhatAreYouLookingFor(),
                          _buildMarriageTarget(),
                          CustomElevatedButton(
                            text: "lbl_save_my_profile".tr,
                            onPressed: () {
                              onTapSaveMyProfile();
                            },
                            buttonStyle: CustomButtonStyles.fillBlack,
                          ),
                          SizedBox(height: 30.v),
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 60.v,
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgVector,
            margin: EdgeInsets.fromLTRB(27.h, 20.v, 315.h, 21.v),
            onTap: () {
              onTapVector();
            }));
  }

  /// Section Widget
  Widget _buildEducation() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          width: 211.h,
          margin: EdgeInsets.only(right: 52.h),
          child: Text("msg_what_is_your_current".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(height: 1.50))),
      SizedBox(height: 30.v),
      Obx(() => Column(children: [
            CustomRadioButton(
                width: 264.h,
                text: "lbl_highschools".tr,
                value:
                    controller.editProfileTwoModelObj.value.educationRadioList.value[0],
                groupValue: controller.educationRadioGroup.value,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                isRightCheck: true,
                onChange: (value) {
                  controller.educationRadioGroup.value = value;
                }),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_associates".tr,
                    value: controller
                        .editProfileTwoModelObj.value.educationRadioList.value[1],
                    groupValue: controller.educationRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 12.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.educationRadioGroup.value = value;
                    })),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_bachelors".tr,
                    value: controller
                        .editProfileTwoModelObj.value.educationRadioList.value[2],
                    groupValue: controller.educationRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.educationRadioGroup.value = value;
                    })),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_masters".tr,
                    value: controller
                        .editProfileTwoModelObj.value.educationRadioList.value[3],
                    groupValue: controller.educationRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.educationRadioGroup.value = value;
                    })),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_doctorates".tr,
                    value: controller
                        .editProfileTwoModelObj.value.educationRadioList.value[4],
                    groupValue: controller.educationRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.educationRadioGroup.value = value;
                    }))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildReligion() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_what_is_your_religion".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 29.v),
      Obx(() => CustomDropDown(
          icon: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 16.h, 12.v),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          hintText: controller.religionDropDownValue.value == "" ? "lbl_religion".tr
              : controller.religionDropDownValue.value,
          items:
          controller.editProfileTwoModelObj.value.religionDropdownItemList.value,
          onChanged: (value) {
            controller.onSelectReligion(value);
          }))
    ]);
  }

  /// Section Widget
  Widget _buildDrinking() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_do_you_drink".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 30.v),
      Obx(() => Column(children: [
            CustomRadioButton(
                width: 264.h,
                text: "lbl_yes".tr,
                value:
                    controller.editProfileTwoModelObj.value.smokingDrinkingRadioList.value[0],
                groupValue: controller.drinkingRadioGroup.value,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                isRightCheck: true,
                onChange: (value) {
                  controller.drinkingRadioGroup.value = value;
                }),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_socially".tr,
                    value: controller
                        .editProfileTwoModelObj.value.smokingDrinkingRadioList.value[1],
                    groupValue: controller.drinkingRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 12.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.drinkingRadioGroup.value = value;
                    })),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_no".tr,
                    value: controller
                        .editProfileTwoModelObj.value.smokingDrinkingRadioList.value[2],
                    groupValue: controller.drinkingRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 13.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.drinkingRadioGroup.value = value;
                    }))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildSmoking() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_do_you_smoke".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 29.v),
      Obx(() => Column(children: [
            CustomRadioButton(
                width: 264.h,
                text: "lbl_yes".tr,
                value:
                    controller.editProfileTwoModelObj.value.smokingDrinkingRadioList.value[0],
                groupValue: controller.smokingRadioGroup.value,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                isRightCheck: true,
                onChange: (value) {
                  controller.smokingRadioGroup.value = value;
                }),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_socially".tr,
                    value: controller
                        .editProfileTwoModelObj.value.smokingDrinkingRadioList.value[1],
                    groupValue: controller.smokingRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 12.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.smokingRadioGroup.value = value;
                    })),
            Padding(
                padding: EdgeInsets.only(top: 16.v),
                child: CustomRadioButton(
                    width: 264.h,
                    text: "lbl_no".tr,
                    value: controller
                        .editProfileTwoModelObj.value.smokingDrinkingRadioList.value[2],
                    groupValue: controller.smokingRadioGroup.value,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                    isRightCheck: true,
                    onChange: (value) {
                      controller.smokingRadioGroup.value = value;
                    }))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildMbti() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_what_is_your_mbti".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 30.v),
      Obx(() => CustomDropDown(
          icon: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 16.h, 12.v),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          hintText: controller.mbtiDropDownValue.value == "" ? "lbl_mbti".tr
              : controller.mbtiDropDownValue.value,
          items:
              controller.editProfileTwoModelObj.value.mbtiDropdownItemList.value,
          onChanged: (value) {
            controller.onSelectMBTI(value);
          })
      )
    ]);
  }

  Widget _buildWhatAreYouLookingFor() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_what_are_you_looking_for".tr, style: theme.textTheme.bodyLarge),
      SizedBox(height: 30.v),
      Obx(() => CustomDropDown(
          icon: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 16.h, 12.v),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          hintText: controller.lookingForDropDownValue.value == "" ? "lbl_looking_for".tr
              : controller.lookingForDropDownValue.value,
          items:
          controller.editProfileTwoModelObj.value.lookingForDropdownItemList.value,
          onChanged: (value) {
            controller.onSelectLookingFor(value);
          })
      )
    ]);
  }

  Widget _buildMarriageTarget() {
    return Obx(() => controller.isMarriageChosen.value ?
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 50.v),
        Align(
            alignment: Alignment.centerLeft,
            child: Text("msg_what_is_your_marriage_target_year".tr,
                style: theme.textTheme.bodyLarge)),
        SizedBox(height: 50.v),
        CustomDropDown(
          icon: Container(
              margin: EdgeInsets.fromLTRB(30.h, 12.v, 16.h, 12.v),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgArrowdown,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          hintText: controller.marriageTargetDropDownValue.value == "" ? "lbl_marriage_target_in_year".tr
              : controller.marriageTargetDropDownValue.value,
          items:
          controller.editProfileTwoModelObj.value.marriagePlanDropdownItemList.value,
          onChanged: (value) {
            controller.onSelectMarriageTarget(value);
        }),
        SizedBox(height: 30.v),
      ]) : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 50.v),
      ]));
  }

  /// Navigates to the previous screen.
  onTapVector() {
    Get.back();
  }

  /// Navigates to the editProfileScreen when the action is triggered.
  onTapSaveMyProfile() async {
    if(controller.validateMarriageTarget()){
      await controller.saveUserProfile();
      Get.toNamed(
          AppRoutes.editProfileScreen,
          arguments: controller.phoneNumber
      );
    }else{
      Get.defaultDialog(
          title: "Marriage target is not selected",
          content: Text("Please select your marriage target")
      );
    }
  }
}
