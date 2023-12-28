import '../controller/candidate_profile_controller.dart';
import 'package:get/get.dart';

/// A binding class for the CandidateProfileScreen.
///
/// This class ensures that the CandidateProfileController is created when the
/// CandidateProfileScreen is first loaded.
class CandidateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CandidateProfileController());
  }
}
