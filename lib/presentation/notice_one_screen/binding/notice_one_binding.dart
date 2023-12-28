import '../controller/notice_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the NoticeOneScreen.
///
/// This class ensures that the NoticeOneController is created when the
/// NoticeOneScreen is first loaded.
class NoticeOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoticeOneController());
  }
}
