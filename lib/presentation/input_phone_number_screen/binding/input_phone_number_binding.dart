import '../controller/input_phone_number_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InputPhoneNumberScreen.
///
/// This class ensures that the InputPhoneNumberController is created when the
/// InputPhoneNumberScreen is first loaded.
class InputPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputPhoneNumberController());
  }
}
