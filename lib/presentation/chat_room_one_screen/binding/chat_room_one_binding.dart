import '../controller/chat_room_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatRoomOneScreen.
///
/// This class ensures that the ChatRoomOneController is created when the
/// ChatRoomOneScreen is first loaded.
class ChatRoomOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoomOneController());
  }
}
