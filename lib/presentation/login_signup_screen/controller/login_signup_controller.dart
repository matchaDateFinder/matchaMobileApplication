import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/login_signup_screen/models/login_signup_model.dart';

/// A controller class for the LoginSignupScreen.
///
/// This class manages the state of the LoginSignupScreen, including the
/// current loginSignupModelObj
class LoginSignupController extends GetxController {
  Rx<LoginSignupModel> loginSignupModelObj = LoginSignupModel().obs;

  late final PrefUtils _prefUtils;
  Connectivity connectivity = Connectivity();

  LoginSignupController(){
    _prefUtils = PrefUtils();
  }

  @override
  void onInit() async{
    if(await NetworkInfo(connectivity).isConnected()){
      if(_prefUtils.getLogInStatus() == true){
        String phoneNumber = _prefUtils.getUserPhoneNumber()!;
        Future.delayed(Duration.zero, () {
          Get.toNamed(
              AppRoutes.userProfileScreen,
              arguments: phoneNumber);
        });
      }else{
        if(_prefUtils.getOnboardingCheckpoint() == "afterOTP"){
          String phoneNumber = _prefUtils.getUserPhoneNumber()!;
          Future.delayed(Duration.zero, () {
            Get.toNamed(
                AppRoutes.explanationOfMatchaScreen,
                arguments: phoneNumber);
          });
        }else if(_prefUtils.getOnboardingCheckpoint() == "afterContactAccess"){
          String phoneNumber = _prefUtils.getUserPhoneNumber()!;
          Future.delayed(Duration.zero, () {
            Get.toNamed(
                AppRoutes.inputNameScreen,
                arguments: phoneNumber);
          });
        }
      }
    }else{
      _prefUtils.setErrorType("networkConnection");
      Get.toNamed(
        AppRoutes.errorScreen
      );
    }

    super.onInit();
  }
}
