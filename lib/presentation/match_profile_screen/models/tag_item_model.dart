import '../../../core/app_export.dart';

/// This class is used in the [tag_item_widget] screen.
class TagItemModel {
  Rx<String>? attributeIcon = "".obs;
  Rx<String>? attributevalue = "".obs;

  Rx<bool>? isSelected = Rx(false);
}
