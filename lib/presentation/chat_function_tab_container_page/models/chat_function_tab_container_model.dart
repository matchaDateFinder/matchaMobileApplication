import 'tabviewlist_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [chat_function_tab_container_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ChatFunctionTabContainerModel {
  Rx<List<TabviewlistItemModel>> tabviewlistItemList =
      Rx(List.generate(2, (index) => TabviewlistItemModel()));
}
