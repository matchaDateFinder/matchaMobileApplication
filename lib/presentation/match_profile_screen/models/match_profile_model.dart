import 'tag_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [match_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class MatchProfileModel {
  Rx<List<TagItemModel>> tagItemList =
      Rx(List.generate(6, (index) => TagItemModel()));
}
