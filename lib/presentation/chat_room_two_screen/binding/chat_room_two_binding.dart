import '../controller/chat_room_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatRoomTwoScreen.
///
/// This class ensures that the ChatRoomTwoController is created when the
/// ChatRoomTwoScreen is first loaded.
class ChatRoomTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoomTwoController());
  }
}
