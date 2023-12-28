import '../controller/input_age_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InputAgeScreen.
///
/// This class ensures that the InputAgeController is created when the
/// InputAgeScreen is first loaded.
class InputAgeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputAgeController());
  }
}
