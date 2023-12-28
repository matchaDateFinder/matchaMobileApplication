import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_room_two_screen/models/chat_room_two_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ChatRoomTwoScreen.
///
/// This class manages the state of the ChatRoomTwoScreen, including the
/// current chatRoomTwoModelObj
class ChatRoomTwoController extends GetxController {
  TextEditingController textController = TextEditingController();

  Rx<ChatRoomTwoModel> chatRoomTwoModelObj = ChatRoomTwoModel().obs;

  @override
  void onClose() {
    super.onClose();
    textController.dispose();
  }
}
