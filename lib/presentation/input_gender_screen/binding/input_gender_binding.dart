import '../controller/input_gender_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InputGenderScreen.
///
/// This class ensures that the InputGenderController is created when the
/// InputGenderScreen is first loaded.
class InputGenderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputGenderController());
  }
}
