import '../controller/error_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExplanationOfMatchaScreen.
///
/// This class ensures that the ExplanationOfMatchaController is created when the
/// ExplanationOfMatchaScreen is first loaded.
class ErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ErrorController());
  }
}
