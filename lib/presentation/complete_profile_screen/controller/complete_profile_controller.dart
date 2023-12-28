import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/complete_profile_screen/models/complete_profile_model.dart';

/// A controller class for the CompleteProfileScreen.
///
/// This class manages the state of the CompleteProfileScreen, including the
/// current completeProfileModelObj
class CompleteProfileController extends GetxController {
  Rx<CompleteProfileModel> completeProfileModelObj = CompleteProfileModel().obs;

  @override
  void onInit(){
    // save to local repositories first then show the page
  }
}
