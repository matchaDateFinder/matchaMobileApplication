import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_container_screen/models/chat_function_container_model.dart';

/// A controller class for the ChatFunctionContainerScreen.
///
/// This class manages the state of the ChatFunctionContainerScreen, including the
/// current chatFunctionContainerModelObj
class ChatFunctionContainerController extends GetxController {
  Rx<ChatFunctionContainerModel> chatFunctionContainerModelObj =
      ChatFunctionContainerModel().obs;
}
