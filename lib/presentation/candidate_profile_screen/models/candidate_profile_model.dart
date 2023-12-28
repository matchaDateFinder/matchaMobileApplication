import 'tag4_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [candidate_profile_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CandidateProfileModel {
  Rx<List<Tag4ItemModel>> tag4ItemList =
      Rx(List.generate(6, (index) => Tag4ItemModel()));
}
