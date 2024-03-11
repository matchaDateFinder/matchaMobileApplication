import '../match_profile_screen/widgets/tag_item_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'controller/match_profile_controller.dart';
import 'models/tag_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_iconbutton.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';

class MatchProfileScreen extends GetWidget<MatchProfileController> {
  const MatchProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    children: [
                      _buildStack(),
                      _buildMatchProfile(context)
                    ]
                )
            )
        )
    );
  }

  /// Section Widget
  Widget _buildStack() {
    return SizedBox(
        height: 360.adaptSize,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          CachedNetworkImage(
            imageUrl: controller.userPhotoDownloadLink,
            fit: BoxFit.cover,
            height: 360.adaptSize,
            width: 360.adaptSize,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
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
  Widget _buildColumn() { // TODO tanya reyhan kalau match chat profile perlu ada gambar yang sama di candidate kah
    return Padding(
        padding: EdgeInsets.only(right: 15.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_general_info".tr, style: theme.textTheme.bodyLarge),
          SizedBox(height: 8.v),
          Obx(() => Wrap(
              runSpacing: 8.v,
              spacing: 8.h,
              children: List<Widget>.generate(
                  controller.matchProfileModelObj.value.userTagItemList.value
                      .length, (index) {
                TagItemModel model = controller
                    .matchProfileModelObj.value.userTagItemList.value[index];
                return TagItemWidget(model);
              })))
        ]));
  }

  /// Section Widget
  Widget _buildMatchProfile(context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Obx(() => Text(controller.nameAge.value, // name and age
              style: CustomTextStyles.titleLargeSemiBold)),
          SizedBox(height: 5.v),
          Row(children: [
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
              child: Obx(() => controller.mutualName.value == '' ?
                Text('-', style: theme.textTheme.bodyMedium) :
                InkWell(
                  child: Text(controller.mutualName.value,
                      style: theme.textTheme.bodyMedium),
                  onTap: () {
                    if(controller.listOfMutuals.length > 1){
                      onTapListOfMutual(context);
                    }
                  },
                )
              ),
            )
          ]),
          SizedBox(height: 26.v),
          _buildColumn(),
          SizedBox(height: 5.v)
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() async {
    await controller.manuallyKillConstructor();
    Map<String, String> mapOfArguments = await controller.convertToMap();
    Get.toNamed(
        AppRoutes.chatRoomOneScreen,
        arguments: mapOfArguments
    );
  }

  onTapListOfMutual(context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20.0)),
            child: Container(
                constraints: BoxConstraints(maxHeight: 350),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("List of Mutuals"),
                        SizedBox(height: 5.v),
                        Container(
                          child: _buildListOfMutuals(),
                        )
                      ],
                    ),
                  ),
                )
            ),
          );
        });
  }

  Widget _buildListOfMutuals(){
    String listOfMutual = '';
    controller.listOfMutuals.value.forEach((contact) {
      listOfMutual = listOfMutual + contact + '\n';
    });
    return Text(listOfMutual, style: CustomTextStyles.bodyMediumPoppins);
  }
}
