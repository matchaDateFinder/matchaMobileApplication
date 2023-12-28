import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/notice_two_screen/models/notice_two_model.dart';

/// A controller class for the NoticeTwoScreen.
///
/// This class manages the state of the NoticeTwoScreen, including the
/// current noticeTwoModelObj
class NoticeTwoController extends GetxController {
  Rx<NoticeTwoModel> noticeTwoModelObj = NoticeTwoModel().obs;
}
