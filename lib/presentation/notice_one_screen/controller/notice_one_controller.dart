import 'dart:async';

import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/notice_one_screen/models/notice_one_model.dart';

/// A controller class for the NoticeOneScreen.
///
/// This class manages the state of the NoticeOneScreen, including the
/// current noticeOneModelObj
class NoticeOneController extends GetxController {
  Rx<NoticeOneModel> noticeOneModelObj = NoticeOneModel().obs;
  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;

  Timer? _timer;
  final textToShow = "msg_next_profile_in".tr.obs;
  RxString notificationText = ''.obs;
  RxInt sizedBox = 0.obs;
  int remainingSeconds = 1;

  var user;
  var phoneNumber;
  var timeToNextCandidateInSeconds;
  var timeHour = 0;
  var timeMinutes = 0;

  final source = Get.arguments;

  NoticeOneController() {
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
  }

  @override
  void onInit() async {
    phoneNumber = _prefUtils.getUserPhoneNumber();
    user = await _firestore.getUserFromFireStoreByPhoneNumber(phoneNumber);
    if(user != null){
      if(source == "noMatchInDB"){
        textToShow.value = "please come back tomorrow";
        notificationText.value = "msg_no_match".tr;
        sizedBox.value = 50;
      }else if(source == "lastMatchLessThanADay"){
        DateTime lastRecomDate = user!.lastRecommendationIsGiven.toDate();
        int lastRecomDateInMiliSeconds = lastRecomDate.millisecondsSinceEpoch;
        timeToNextCandidateInSeconds = (3600*24)-((DateTime.now().millisecondsSinceEpoch-lastRecomDateInMiliSeconds)~/1000);
        _startTimer(timeToNextCandidateInSeconds);
        notificationText.value = "msg_that_s_it_for_today".tr;
        sizedBox.value = 93;
      }
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
