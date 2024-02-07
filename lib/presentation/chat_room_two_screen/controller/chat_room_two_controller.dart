import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_room_two_screen/models/chat_room_two_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the ChatRoomTwoScreen.
///
/// This class manages the state of the ChatRoomTwoScreen, including the
/// current chatRoomTwoModelObj
class ChatRoomTwoController extends GetxController {
  var messages = <ChatRoomTwoModel>[].obs;
  var messageController = TextEditingController();

  void sendMessage() {
    final messageText = messageController.text.trim();
    if (messageText.isNotEmpty) {
      messages.add(ChatRoomTwoModel(text: messageText, isMe: true));
      messageController.clear();
    }
  }
}
