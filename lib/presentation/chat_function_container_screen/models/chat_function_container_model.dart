import '../../../core/app_export.dart';

/// This class defines the variables used in the [chat_function_container_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ChatFunctionContainerModel {
  Rx<String>? username = "".obs;
  Rx<String>? phoneNumber = "".obs;
  Rx<String>? chatRoomId = "".obs;
  Rx<String>? photoUrl = "".obs;
  Rx<String>? unreadMessagesCount = "".obs;
}
