import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/login_signup_screen/models/login_signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A controller class for the LoginSignupScreen.
///
/// This class manages the state of the LoginSignupScreen, including the
/// current loginSignupModelObj
class LoginSignupController extends GetxController {
  Rx<LoginSignupModel> loginSignupModelObj = LoginSignupModel().obs;

  late final PrefUtils _prefUtils;

  LoginSignupController(){
    _prefUtils = PrefUtils();
  }

  @override
  void onInit() async{
    print(_prefUtils.getLogInStatus());
    if(_prefUtils.getLogInStatus() == true){
      _prefUtils.setLoginStatus(true);
      IsarService isar = IsarService();
      String phoneNumber = await isar.getPhoneNumberInIsarDB();
      Get.toNamed(
          AppRoutes.userProfileScreen,
          arguments: phoneNumber);
    }
    super.onInit();
  }
}
