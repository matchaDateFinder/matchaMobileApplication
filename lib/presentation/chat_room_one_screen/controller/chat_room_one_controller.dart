import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/chatModel/chat.dart';
import 'package:matchaapplication/data/models/fireStoreModel/chatMessageFireStoreModel/chatMessageFireStore.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/models/chat_message.dart';

/// A controller class for the ChatRoomOneScreen.
///
/// This class manages the state of the ChatRoomOneScreen, including the
/// current chatRoomOneModelObj

class ChatRoomOneController extends GetxController {

  RxList<ChatMessage> chatList = <ChatMessage>[].obs;

  late final ScrollController scrollController;
  late final TextEditingController textHereController;
  late final FocusNode focusNode;
  late final FirestoreService _firestore;
  late final String userPhoneNumber;
  late final String matchPhoneNumber;
  late final String chatRoomId;
  late final String receiverName;
  late final String receiverPhotoLink;
  late final Stream<QuerySnapshot> messageListContent;

  bool get isTextFieldEnable => textHereController.text.isNotEmpty;

  ChatRoomOneController() {
    var arguments = Get.arguments;
    scrollController = ScrollController();
    textHereController = TextEditingController();
    focusNode = FocusNode();
    _firestore = FirestoreService();
    userPhoneNumber = arguments["userPhoneNumber"];
    matchPhoneNumber = arguments["receiverPhoneNumber"];
    chatRoomId = arguments["chatRoomId"];
    receiverName = arguments["receiverName"];
    receiverPhotoLink = arguments["receiverPhotoLink"];
    messageListContent = _firestore.getMessage(chatRoomId, userPhoneNumber, matchPhoneNumber);
  }

  var matchProfile;

  @override
  void onInit() async {
    matchProfile = await _firestore.getUserFromFireStoreByPhoneNumber(matchPhoneNumber);
    chatList.refresh();
  }

  @override
  void onClose() {
    super.onClose();
    textHereController.dispose();
  }

  Future<void> onFieldSubmitted() async {
    if (!isTextFieldEnable) return;

    ChatMessageFireStoreModel newChat = ChatMessageFireStoreModel(
        chatRoomId: chatRoomId,
        senderPhoneNumber: userPhoneNumber,
        chatMessage: textHereController.text,
        attachmentLink: "",
        chatStatus: "1",
        sentDate: Timestamp.fromDate(DateTime.now()),
        isReceived: false);

    await _firestore.sendChatMessage(newChat);

    if(scrollController.hasClients){
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    textHereController.text = '';
    update();

  }

  void onFieldChanged(String term) {
    update();
  }

  Future<void> manuallyKillConstructor() async {
    Get.delete<ChatRoomOneController>();
  }

  Map<String,String> matchProfileAttribute(){
    Map<String, String> matchProfileAttribute = new Map<String,String>();
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    matchProfileAttribute[""] = matchProfile!.name;
    return matchProfileAttribute;
  }

  ChatMessage transformFromMapToChat(Map<String, dynamic> documentData) {
      String chatType = "2";
      if(documentData["senderPhoneNumber"] == userPhoneNumber){
        chatType = "1";
      }
      ChatMessage chat = new ChatMessage(message: documentData["chatMessage"], type: chatType, time: documentData["sentDate"].toDate());
      return chat;
  }

}
