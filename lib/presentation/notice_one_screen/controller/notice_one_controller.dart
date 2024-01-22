import 'dart:async';

import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/notice_one_screen/models/notice_one_model.dart';

/// A controller class for the NoticeOneScreen.
///
/// This class manages the state of the NoticeOneScreen, including the
/// current noticeOneModelObj
class NoticeOneController extends GetxController {
  Rx<NoticeOneModel> noticeOneModelObj = NoticeOneModel().obs;
  late final IsarService _isar;
  late final FirestoreService _firestore;

  Timer? _timer;
  final textToShow = "msg_next_profile_in".tr.obs;
  int remainingSeconds = 1;

  var user;
  var phoneNumber;
  var timeToNextCandidateInSeconds;
  var timeHour = 0;
  var timeMinutes = 0;

  NoticeOneController() {
    _isar = IsarService();
    _firestore = FirestoreService();
  }

  @override
  void onInit() async {
    phoneNumber = await _isar.getPhoneNumberInIsarDB();
    user = await _firestore.getUserFromFireStoreByPhoneNumber(phoneNumber);
    if(user != null){
      DateTime lastRecomDate = user!.lastRecommendationIsGiven.toDate();
      int lastRecomDateInMiliSeconds = lastRecomDate.millisecondsSinceEpoch;
      timeToNextCandidateInSeconds = (3600*24)-((DateTime.now().millisecondsSinceEpoch-lastRecomDateInMiliSeconds)~/1000);
      _startTimer(timeToNextCandidateInSeconds);
    }
    super.onInit();
  }

  Future<void> manuallyKillConstructor() async {
    if(_timer!=null){
      _timer!.cancel();
    }
    Get.delete<NoticeOneController>();
  }

  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds==0){
        timer.cancel();
      }else{
        timeHour = remainingSeconds~/3600;
        timeMinutes = ((remainingSeconds - timeHour * 3600)) ~/ 60;
        remainingSeconds--;
        textToShow.value = "msg_next_profile_in".tr +
            " " + timeHour.toString().padLeft(2, "0") + ":" +
            timeMinutes.toString().padLeft(2, "0");
      }
    });
  }

}
