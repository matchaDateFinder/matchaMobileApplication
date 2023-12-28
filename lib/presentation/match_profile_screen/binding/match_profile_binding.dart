import '../controller/match_profile_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MatchProfileScreen.
///
/// This class ensures that the MatchProfileController is created when the
/// MatchProfileScreen is first loaded.
class MatchProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchProfileController());
  }
}
