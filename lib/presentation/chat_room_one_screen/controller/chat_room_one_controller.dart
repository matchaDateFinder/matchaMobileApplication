import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/models/chat_room_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ChatRoomOneScreen.
///
/// This class manages the state of the ChatRoomOneScreen, including the
/// current chatRoomOneModelObj
class ChatRoomOneController extends GetxController {
  TextEditingController textHereController = TextEditingController();

  Rx<ChatRoomOneModel> chatRoomOneModelObj = ChatRoomOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    textHereController.dispose();
  }
}
