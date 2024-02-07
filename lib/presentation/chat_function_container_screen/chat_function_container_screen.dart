import 'package:cached_network_image/cached_network_image.dart';

import 'controller/chat_function_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/chat_function_tab_container_page.dart';
import 'package:matchaapplication/widgets/custom_bottom_bar.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_subtitle.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';

class ChatFunctionContainerScreen
    extends GetWidget<ChatFunctionContainerController> {
  const ChatFunctionContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            appBar: _buildAppBar(),
            body: Container(
              child: Obx(() => ListView.builder(
                  itemCount: controller.chatFunctionContainerModelObj.length,
                  itemBuilder: (context, index) {
                  final _data = controller.chatFunctionContainerModelObj[index];
                  // final hasPhoto = _data.photoURL != null &&
                  //     _data.photoURL != '';
                    return ListTile(
                        leading: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: _data.photoUrl!.value,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                        title: Text(_data.username!.value),
                        titleTextStyle: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 16.fSize,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        trailing: Text(_data.unreadCount!.value == "0" ? "" : _data.unreadCount!.value),
                        onTap: () =>
                         _onTapGoToChatRoom(controller.phoneNumber,
                             _data.phoneNumber!.value,
                             _data.username!.value,
                             _data.photoUrl!.value,
                             _data.chatRoomId!.value),
                        visualDensity: VisualDensity(vertical: 4)
                    );
                  },
                ),
              )
            ),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_chats".tr),
        styleType: Style.bgFill);
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
        return AppRoutes.chatFunctionContainerScreen;
      case BottomBarEnum.matchBottomType:
        return AppRoutes.candidateProfileScreen;
      case BottomBarEnum.profileBottomType:
        return AppRoutes.userProfileScreen;
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

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }

  _onTapGoToChatRoom(String userPhoneNumber, String receiverPhoneNumber, String receiverName,
      String receiverPhotoLink, String chatRoomId) async{
    await controller.manuallyKillConstructor();
    Map<String, String> mapOfArguments = await controller.convertToMap(userPhoneNumber, receiverPhoneNumber,
        receiverName, receiverPhotoLink, chatRoomId);
    Get.toNamed(
        AppRoutes.chatRoomOneScreen,
        arguments: mapOfArguments
    );
  }
}
