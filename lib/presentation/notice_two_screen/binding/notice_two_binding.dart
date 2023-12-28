import '../controller/notice_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NoticeTwoScreen.
///
/// This class ensures that the NoticeTwoController is created when the
/// NoticeTwoScreen is first loaded.
class NoticeTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoticeTwoController());
  }
}
