import '../controller/edit_profile_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditProfileTwoScreen.
///
/// This class ensures that the EditProfileTwoController is created when the
/// EditProfileTwoScreen is first loaded.
class EditProfileTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileTwoController());
  }
}
