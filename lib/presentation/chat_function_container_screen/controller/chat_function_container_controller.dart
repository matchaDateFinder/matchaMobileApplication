import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_container_screen/models/chat_function_container_model.dart';


/// A controller class for the ChatFunctionContainerScreen.
///
/// This class manages the state of the ChatFunctionContainerScreen, including the
/// current chatFunctionContainerModelObj
class ChatFunctionContainerController extends GetxController {
  RxList<ChatFunctionContainerModel> chatFunctionContainerModelObj = <ChatFunctionContainerModel>[].obs;

  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;
  late final Stream<QuerySnapshot> chatRoomList;
  late final String phoneNumber;
  late final String userName;

  ChatFunctionContainerController() {
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
    phoneNumber = _prefUtils.getUserPhoneNumber()!;
    chatRoomList = _firestore.getChatRoomList(phoneNumber);
    userName = _prefUtils.getUserName()!;
  }

  @override
  void onInit() async{
  }

  Future<void> manuallyKillConstructor() async {
    Get.delete<ChatFunctionContainerController>();
  }

  Future<Map<String,String>> convertToMap(String userPhoneNumber, String receiverPhoneNumber, String receiverName, String chatRoomId) async{
    Map<String,String> result = {};
    result["userPhoneNumber"] = userPhoneNumber;
    result["receiverPhoneNumber"] = receiverPhoneNumber;
    result["receiverName"] = receiverName;
    result["receiverPhotoLink"] = await getUserImageUrl(receiverPhoneNumber);
    result["chatRoomId"] = chatRoomId;
    return result;
  }

  Map<String, String> convertFromDocumentMapToTileMap(Map<String, dynamic> map, String documentId) {
    Map<String, String> result = {};
    map["participantsNumber"].forEach((participantNumber) {
      if(participantNumber != phoneNumber){
        result["phoneNumber"] = participantNumber;
      }
    });
    map["participantsName"].forEach((participantName) {
      if(participantName != userName){
        result["userName"] = participantName;
      }
    });
    map["unreadMessagesCountFromParticipantA"].keys.forEach((key) {
      if(key != phoneNumber){
        result["unreadMessagesCount"] = map["unreadMessagesCountFromParticipantA"][key].toString();
      }
    });
    map["unreadMessagesCountFromParticipantB"].keys.forEach((key) {
      if(key != phoneNumber){
        result["unreadMessagesCount"] = map["unreadMessagesCountFromParticipantB"][key].toString();
      }
    });
    result["chatRoomId"] = documentId;
    return result;
  }

  Future<String> getUserImageUrl(String phoneNumber) async {
    return await _firestore.getUserPhotoLinkFromFireStoreByPhoneNumber(phoneNumber);
  }

}
