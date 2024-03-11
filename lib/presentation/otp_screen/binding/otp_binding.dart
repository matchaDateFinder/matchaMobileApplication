import 'package:matchaapplication/presentation/otp_screen/controller/otp_controller.dart';
import 'package:get/get.dart';

/// A binding class for the OtpScreen.
///
/// This class ensures that the OtpController is created when the
/// OtpScreen is first loaded.
class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
