import '../controller/input_name_controller.dart';
import 'package:get/get.dart';

/// A binding class for the InputNameScreen.
///
/// This class ensures that the InputNameController is created when the
/// InputNameScreen is first loaded.
class InputNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InputNameController());
  }
}
