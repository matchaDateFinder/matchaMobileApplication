import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/models/chat_function_tab_container_model.dart';

/// A controller class for the ChatFunctionTabContainerPage.
///
/// This class manages the state of the ChatFunctionTabContainerPage, including the
/// current chatFunctionTabContainerModelObj
class ChatFunctionTabContainerController extends GetxController {
  ChatFunctionTabContainerController(this.chatFunctionTabContainerModelObj);

  Rx<ChatFunctionTabContainerModel> chatFunctionTabContainerModelObj;
}
