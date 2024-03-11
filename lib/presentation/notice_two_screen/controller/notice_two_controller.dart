import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/data/models/fireStoreModel/chatRoomFireStoreModel/chatRoomFireStore.dart';
import 'package:matchaapplication/presentation/notice_two_screen/models/notice_two_model.dart';

/// A controller class for the NoticeTwoScreen.
///
/// This class manages the state of the NoticeTwoScreen, including the
/// current noticeTwoModelObj
class NoticeTwoController extends GetxController {
  Rx<NoticeTwoModel> noticeTwoModelObj = NoticeTwoModel().obs;

  late final FirestoreService _firestore;
  late final String userPhoneNumber;
  late final String receiverPhoneNumber;
  late final String receiverName;
  late final String userPhotoLink;
  late final String candidatePhotoLink;

  NoticeTwoController() {
    _firestore = FirestoreService();
    var arguments = Get.arguments;
    userPhoneNumber = arguments["userPhoneNumber"];
    receiverPhoneNumber = arguments["receiverPhoneNumber"];
    receiverName = arguments["receiverName"];
    userPhotoLink = arguments["userPhotoLink"];
    candidatePhotoLink = arguments["candidatePhotoLink"];
  }


  Future<void> manuallyKillConstructor() async {
    Get.delete<NoticeTwoController>();
  }

  Future<Map<String,String>> convertToMap() async{
    ChatRoomFireStoreModel chatRoom = await _firestore.getChatRoomForMatchaNotification(userPhoneNumber, receiverPhoneNumber);
    Map<String,String> result = {};
    result["userPhoneNumber"] = userPhoneNumber;
    result["receiverPhoneNumber"] = receiverPhoneNumber;
    result["receiverName"] = receiverName;
    result["receiverPhotoLink"] = await getUserImageUrl(receiverPhoneNumber);
    result["chatRoomId"] = chatRoom.chatRoomId!;
    return result;
  }

  Future<String> getUserImageUrl(String phoneNumber) async {
    return await _firestore.getUserPhotoLinkFromFireStoreByPhoneNumber(phoneNumber);
  }

}
