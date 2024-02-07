import '../../../core/app_export.dart';

/// This class is used in the [tabviewlist_item_widget] screen.
class TabviewlistItemModel {
  TabviewlistItemModel({this.id}) {
    id = id ?? Rx("");
  }

  Rx<String>? id;
}
