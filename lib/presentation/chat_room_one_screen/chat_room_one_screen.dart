import 'package:cached_network_image/cached_network_image.dart';
import 'controller/chat_room_one_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_leading_image.dart';
import 'package:matchaapplication/widgets/app_bar/appbar_title.dart';
import 'package:matchaapplication/widgets/app_bar/custom_app_bar.dart';
import 'package:matchaapplication/widgets/custom_text_form_field.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/widget/bubble.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/chatUtils/formatter.dart';

class ChatRoomOneScreen extends GetWidget<ChatRoomOneController> {
  const ChatRoomOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: theme.colorScheme.onPrimary,
            appBar: _buildAppBar(),
            body: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus(); // <-- Hide virtual keyboard
                    },
                    child: _buildMessageList(),
                  )
                ),
                _buildChatBar()
              ],
            )
        )
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        height: 64.v,
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimary,
            margin: EdgeInsets.only(left: 24.h, top: 20.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft();
            }),
        title: Padding(
            padding: EdgeInsets.only(left: 8.h),
            child:
              InkWell(
                  child : Row(
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: controller.receiverPhotoLink,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                      AppbarTitle(
                          text: controller.receiverName,
                          margin: EdgeInsets.only(left: 8.h, top: 12.v, bottom: 11.v),
                      )],
                ),
                onTap: () {
                    onTapImgAvatar();
                },
              ),
        ),
        styleType: Style.bgOutline);
  }

  /// Section Widget Message List
  Widget _buildMessageList() {
    var tmpDate = Formatter.tomorrow();
    return Align(
          alignment: Alignment.topCenter,
          child: StreamBuilder<QuerySnapshot>(
              stream: controller.messageListContent,
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Text('Error${snapshot.error}');
                }
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Text('Loading');
                }
                if(snapshot.data == null || snapshot.data!.docs.isEmpty){
                  return Column(
                              children: [
                                SizedBox(height: 31.v),
                                ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: controller.receiverPhotoLink,
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        CircularProgressIndicator(value: downloadProgress.progress),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                SizedBox(height: 31.v),
                                Text("msg_get_the_conversation".tr,
                                    style: theme.textTheme.bodyLarge),
                                SizedBox(height: 5.v)
                              ]);
                }
                List<Widget> messageItemList = [];
                var isSameDate = false;
                snapshot.data!.docs.forEach((document) {
                  Map<String, dynamic> data = document.data() as Map<String,dynamic>;
                  final createdAt = data["sentDate"].toDate();
                  isSameDate = tmpDate.isSameDate(createdAt);
                  if (!isSameDate) {
                    tmpDate = createdAt;
                  }
                  var date;
                  if(DateTime.now().isSameDate(createdAt)){
                    date = "Today";
                  }else if(DateTime.now().subtract(Duration(days:1)).isSameDate(createdAt)){
                    date = "Yesterday";
                  }else{
                    date = Formatter.dateWithDayFormat(createdAt);
                  }
                  if (!isSameDate) messageItemList.add(_dateSeparator(context, date));
                  messageItemList.add(_buildMessageItem(document));
                });
                return ListView(
                  reverse: true,
                  children: messageItemList.reversed.toList(),
                );
              })
          );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String,dynamic>;
    return Bubble(margin: EdgeInsetsDirectional.only(bottom:20.v),
              chat: controller.transformFromMapToChat(data),
              photoLink: controller.receiverPhotoLink);
  }

  /// Date Separator widget
  Widget _dateSeparator(BuildContext context, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        children: [
          const Divider(),
          Center(
            child: Container(
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.green[50],
              child: Text(
                date,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildChatBar() {
    return Container(
        margin: EdgeInsets.only(left: 23.h, right: 23.h, bottom: 16.v),
        decoration: AppDecoration.fillLightGreen,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgFramePrimary24x24,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 4.v)),
              CustomImageView(
                  imagePath: ImageConstant.imgFrame24x24,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 8.h, top: 4.v, bottom: 4.v)),
              Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: CustomTextFormField(
                      focusNode: controller.focusNode,
                      width: 200.h,
                      controller: controller.textHereController,
                      hintText: "lbl_text_here".tr,
                      textInputAction: TextInputAction.done,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 9.h, vertical: 5.v))),
              GestureDetector(
                  onTap: () {
                    onTapTxtSend();
                  },
                  child: Padding(
                      padding:
                          EdgeInsets.only(left: 8.h, top: 4.v, bottom: 3.v),
                      child: Text("lbl_send".tr,
                          style: theme.textTheme.bodyLarge)))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() async {
    await controller.manuallyKillConstructor();
    Get.toNamed(
        AppRoutes.chatFunctionContainerScreen
    );
  }

  /// Navigates to the matchProfileScreen when the action is triggered.
  onTapImgAvatar() async {
    await controller.manuallyKillConstructor();
    Get.toNamed(
      AppRoutes.matchProfileScreen,
      arguments: controller.matchProfileAttribute,
    );
  }

  /// Navigates to the chatRoomTwoScreen when the action is triggered.
  onTapTxtSend() async {
    controller.onFieldSubmitted();
  }
}
