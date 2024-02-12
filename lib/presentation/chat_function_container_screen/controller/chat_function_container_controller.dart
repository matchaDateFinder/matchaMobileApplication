import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/chatRoomFireStoreModel/chatRoomFireStore.dart';
import 'package:matchaapplication/presentation/chat_function_container_screen/models/chat_function_container_model.dart';
import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';

/// A controller class for the ChatFunctionContainerScreen.
///
/// This class manages the state of the ChatFunctionContainerScreen, including the
/// current chatFunctionContainerModelObj
class ChatFunctionContainerController extends GetxController {
  RxList<ChatFunctionContainerModel> chatFunctionContainerModelObj = <ChatFunctionContainerModel>[].obs;

  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;

  var phoneNumber;
  late UserFireStoreModel user;

  ChatFunctionContainerController() {
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
  }

  @override
  void onInit() async{
    phoneNumber = _prefUtils.getUserPhoneNumber();
    user = await _firestore.getUserFromFireStoreByPhoneNumber(phoneNumber);
    if(user != null) {
      List<ChatRoomFireStoreModel> chatRoomList = await _firestore.getChatRoomForUser(phoneNumber);
      chatRoomList.forEach((chatRoom) async {
        ChatFunctionContainerModel newChatRoom = new ChatFunctionContainerModel();
        chatRoom.participantsNumber.forEach((participantNumber) {
          if(participantNumber != phoneNumber){
            newChatRoom.phoneNumber!.value = participantNumber;
          }
        });
        chatRoom.participantsName.forEach((participantName) {
          if(participantName != user.userName){
            newChatRoom.username!.value = participantName;
          }
        });
        newChatRoom.unreadCount!.value = chatRoom.chatUnreadCount.toString();
        newChatRoom.chatRoomStatus!.value = chatRoom.chatBoxStatus.toString();
        newChatRoom.chatRoomId!.value = chatRoom.chatRoomId!;
        newChatRoom.photoUrl!.value = await _firestore.getUserPhotoLinkFromFireStoreByPhoneNumber(newChatRoom.phoneNumber!.value);
        chatFunctionContainerModelObj.add(newChatRoom);
      });
      chatFunctionContainerModelObj.refresh();
    }
  }

  Future<void> manuallyKillConstructor() async {
    Get.delete<ChatFunctionContainerController>();
  }

  Future<Map<String,String>> convertToMap(String userPhoneNumber, String receiverPhoneNumber, String receiverName,
          String receiverPhotoLink, String chatRoomId) async{
    Map<String,String> result = {};
    result["userPhoneNumber"] = userPhoneNumber;
    result["receiverPhoneNumber"] = receiverPhoneNumber;
    result["receiverName"] = receiverName;
    result["receiverPhotoLink"] = receiverPhotoLink;
    result["chatRoomId"] = chatRoomId;
    return result;
  }
}
