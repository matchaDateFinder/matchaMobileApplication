import '../controller/login_signup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginSignupScreen.
///
/// This class ensures that the LoginSignupController is created when the
/// LoginSignupScreen is first loaded.
class LoginSignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginSignupController());
  }
}
