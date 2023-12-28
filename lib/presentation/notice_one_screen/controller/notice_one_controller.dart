import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/notice_one_screen/models/notice_one_model.dart';

/// A controller class for the NoticeOneScreen.
///
/// This class manages the state of the NoticeOneScreen, including the
/// current noticeOneModelObj
class NoticeOneController extends GetxController {
  Rx<NoticeOneModel> noticeOneModelObj = NoticeOneModel().obs;
}
