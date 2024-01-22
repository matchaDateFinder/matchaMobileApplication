import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/notice_two_screen/models/notice_two_model.dart';

/// A controller class for the NoticeTwoScreen.
///
/// This class manages the state of the NoticeTwoScreen, including the
/// current noticeTwoModelObj
class NoticeTwoController extends GetxController {
  Rx<NoticeTwoModel> noticeTwoModelObj = NoticeTwoModel().obs;

  // TODO need to find a way to dispose the current controller when moving to another page via the bottom bar
  Future<void> manuallyKillConstructor() async {
    Get.delete<NoticeTwoController>();
  }
}
