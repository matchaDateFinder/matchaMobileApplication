import 'package:cached_network_image/cached_network_image.dart';

import 'controller/chat_function_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
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
            body: Column(
              children: [
                Expanded(
                  child: _buildChatRoomList(),
                )
              ],
            ),
            bottomNavigationBar: _buildBottomBar()));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_chats".tr),
        styleType: Style.bgOutline);
  }

  /// Section Widget
  Widget _buildBottomBar() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      _onTapBottomNavigation(type);
    });
  }

  Widget _buildChatRoomList(){
    return Align(
      alignment: Alignment.topCenter,
      child: StreamBuilder<QuerySnapshot>(
          stream: controller.chatRoomList,
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Text('Error${snapshot.error}');
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Text('Loading');
            }
            List<Widget> chatRoomList = [];
            snapshot.data!.docs.forEach((document) {
              chatRoomList.add(_buildChatRoom(document));
            });
            return ListView(
              reverse: true,
              shrinkWrap: true,
              children: chatRoomList.reversed.toList(),
            );
          }),
    );
  }

  Widget _buildChatRoom(DocumentSnapshot document) {
    Map<String, dynamic> _data = document.data() as Map<String,dynamic>;
    Map<String, String> chatRoom = controller.convertFromDocumentMapToTileMap(_data, document.id);
    return ListTile(
        leading: SizedBox(
          height: 50,
          width: 50,
          child: ClipOval(
              child: FutureBuilder<String>(
                future: controller.getUserImageUrl(chatRoom["phoneNumber"] ?? ""),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return CachedNetworkImage(
                      imageUrl: snapshot.data!,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          CircularProgressIndicator(value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  }else{
                    return LinearProgressIndicator();
                  }
                },
              )
          ),
        ),
        title: Text(chatRoom["userName"] ?? ""), // username
        titleTextStyle: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        trailing: Text((chatRoom["unreadMessagesCount"] ?? "0") == "0" ? "" : chatRoom["unreadMessagesCount"]!),
        onTap: () =>
            _onTapGoToChatRoom(controller.phoneNumber,
                chatRoom["phoneNumber"] ?? "", // phoneNumber
                chatRoom["userName"] ?? "", // username
                chatRoom["chatRoomId"] ?? ""), // chatRoomId
        visualDensity: VisualDensity(vertical: 4)
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

  _onTapBottomNavigation(BottomBarEnum type) async{
    await controller.manuallyKillConstructor();
    Get.toNamed(getCurrentRoute(type));
  }

  _onTapGoToChatRoom(String userPhoneNumber, String receiverPhoneNumber, String receiverName, String chatRoomId) async{
    await controller.manuallyKillConstructor();
    Map<String, String> mapOfArguments = await controller.convertToMap(userPhoneNumber, receiverPhoneNumber,
        receiverName, chatRoomId);
    Get.toNamed(
        AppRoutes.chatRoomOneScreen,
        arguments: mapOfArguments
    );
  }
}
