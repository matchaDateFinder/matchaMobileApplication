import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/edit_profile_screen/models/edit_profile_model.dart';

/// A controller class for the EditProfileScreen.
///
/// This class manages the state of the EditProfileScreen, including the
/// current editProfileModelObj
class EditProfileController extends GetxController {
  Rx<EditProfileModel> editProfileModelObj = EditProfileModel().obs;

  final userPhoneNumber = Get.arguments;
}
