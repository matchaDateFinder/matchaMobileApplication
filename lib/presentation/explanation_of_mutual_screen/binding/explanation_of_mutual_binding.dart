import 'package:matchaapplication/presentation/explanation_of_mutual_screen/controller/explanation_of_mutual_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExplanationOfMutualScreen.
///
/// This class ensures that the ExplanationOfMutualController is created when the
/// ExplanationOfMutualScreen is first loaded.
class ExplanationOfMutualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExplanationOfMutualController());
  }
}
