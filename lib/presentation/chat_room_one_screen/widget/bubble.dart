import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/models/chat_message.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/chatUtils/formatter.dart';

class Bubble extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final ChatMessage chat;

  const Bubble({
    this.margin,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignmentOnType,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (chat.type == "2") // 2 for received
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar_1.png"),
          ),
        Container(
          margin: margin ?? EdgeInsets.zero,
          child: PhysicalShape(
            clipper: clipperOnType,
            elevation: 2,
            color: bgColorOnType,
            shadowColor: Colors.grey.shade200,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
              ),
              padding: paddingOnType,
              child: Column(
                crossAxisAlignment: crossAlignmentOnType,
                children: [
                  Text(
                    chat.message,
                    style: TextStyle(color: textColorOnType),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    Formatter.formatDateTime(chat.time),
                    style: TextStyle(color: textColorOnType, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color get textColorOnType {
    switch (chat.type) {
      case "1": // 1 for received
        return theme.colorScheme.primary;
      default: // default or 2 is for sent
        return appTheme.lightGreen50;
    }
  }

  Color get bgColorOnType {
    switch (chat.type) {
      case "1": // 1 for received
        return appTheme.chatBubbleMeGreen;
      default: // default or 2 is for sent
        return theme.colorScheme.primary;
    }
  }

  CustomClipper<Path> get clipperOnType {
    switch (chat.type) {
      case "2": // 2 for received
        return ChatBubbleClipper1(type: BubbleType.receiverBubble);
      default: // default or 1 is for sent
        return ChatBubbleClipper1(type: BubbleType.sendBubble);
    }
  }

  CrossAxisAlignment get crossAlignmentOnType {
    switch (chat.type) {
      case "1": // 1 for received
        return CrossAxisAlignment.start;
      default: // default or 1 is for sent
        return CrossAxisAlignment.end;
    }
  }

  MainAxisAlignment get alignmentOnType {
    switch (chat.type) {
      case "1": // 1 for received
        return MainAxisAlignment.end;
      default: // default or 2 is for sent
        return MainAxisAlignment.start;
    }
  }

  EdgeInsets get paddingOnType {
    switch (chat.type) {
      case "2": // 2 for received
        return const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 24,
          right: 10,
        );
      default: // default or 1 is for sent
        return const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 24);
    }
  }

}