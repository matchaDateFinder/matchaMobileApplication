import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/login_signup_screen/models/login_signup_model.dart';

/// A controller class for the LoginSignupScreen.
///
/// This class manages the state of the LoginSignupScreen, including the
/// current loginSignupModelObj
class LoginSignupController extends GetxController {
  Rx<LoginSignupModel> loginSignupModelObj = LoginSignupModel().obs;
}
