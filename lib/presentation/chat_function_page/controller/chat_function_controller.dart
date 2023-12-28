import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_page/models/chat_function_model.dart';

/// A controller class for the ChatFunctionPage.
///
/// This class manages the state of the ChatFunctionPage, including the
/// current chatFunctionModelObj
class ChatFunctionController extends GetxController {
  ChatFunctionController(this.chatFunctionModelObj);

  Rx<ChatFunctionModel> chatFunctionModelObj;
}
