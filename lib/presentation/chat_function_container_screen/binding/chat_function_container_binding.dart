import '../controller/chat_function_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChatFunctionContainerScreen.
///
/// This class ensures that the ChatFunctionContainerController is created when the
/// ChatFunctionContainerScreen is first loaded.
class ChatFunctionContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatFunctionContainerController());
  }
}
