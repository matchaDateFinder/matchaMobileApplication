import 'tag2_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [user_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class UserProfileModel {
  Rx<List<Tag2ItemModel>> tag2ItemList =
      Rx(List.generate(6, (index) => Tag2ItemModel()));
}
