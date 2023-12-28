import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/user_profile_screen/models/user_profile_model.dart';

/// A controller class for the UserProfileScreen.
///
/// This class manages the state of the UserProfileScreen, including the
/// current userProfileModelObj
class UserProfileController extends GetxController {
  Rx<UserProfileModel> userProfileModelObj = UserProfileModel().obs;
}
