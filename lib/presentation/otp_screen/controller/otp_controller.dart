import 'package:matchaapplication/data/models/fireStoreModel/userFireStoreModel/userFireStore.dart';

import '../../../core/app_export.dart';
import '../models/otp_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_contacts/flutter_contacts.dart';

/// A controller class for the OtpScreen.
///
/// This class manages the state of the OtpScreen, including the
/// current otpModelObj
class OtpController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<OtpModel> otpModelObj = OtpModel().obs;
  late final FirestoreService _firestore;
  late final PrefUtils _prefUtils;
  Timer? _timer;
  final otpResendTimer = "msg_resend_otp_in_00_00".tr.obs;
  RxBool buttonState = false.obs;
  String fullPhoneNumber = '';
  String fullPhoneNumberWithCode = '';
  String otpCode = '';
  int initialTimerValue = 0;
  int remainingSeconds = 1;

  OtpController() {
    _firestore = FirestoreService();
    _prefUtils = PrefUtils();
    fullPhoneNumber = Get.arguments;
    fullPhoneNumberWithCode = "+"+fullPhoneNumber;
    otpCode = '';
    initialTimerValue = 60;
  }

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() async {
    super.onInit();
    listenForCode();
    _startTimer(initialTimerValue);
    sendOTPCodeToPhone("+"+fullPhoneNumber);
  }

  @override
  void onClose() {
    super.onClose();
    otpController.value.dispose();
  }

  void validateOTP() async {
    if(otpController.value.text == "" || otpController.value.text.length < 4){
      Get.defaultDialog(
          title: "OTP Code is Missing",
          content: Text("Please OTP Code")
      );
    }else{
      await verifyOTP(otpController.value.text);
    }
  }

  Future<void> manuallyKillConstructor() async {
    if(_timer!=null){
      _timer!.cancel();
    }
    Get.delete<OtpController>();
  }

  _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds==0){
        timer.cancel();
        buttonState.value = true;
      }else{
        remainingSeconds--;
        otpResendTimer.value = "msg_resend_otp_in_00_00".tr +
            " " + remainingSeconds.toString().padLeft(2, "0");
      }
    });
  }

  resendOTPCode() async {
    buttonState.value = false;
    remainingSeconds = 60;
    _startTimer(remainingSeconds);
    sendOTPCodeToPhone("+"+fullPhoneNumber);
  }

  Future<bool> checkForExistingUser() async {
    final userFromFiresToreDB = await _firestore.getUserFromFireStoreByPhoneNumber(fullPhoneNumber);
    if (userFromFiresToreDB.userName != "userName" && userFromFiresToreDB.userPhoneNumber != "") { // user exists
      _prefUtils.setLoginStatus(true);
      _prefUtils.setLocalUser(convertMapPreferences(userFromFiresToreDB));
      List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
      Set<String?> newListOfContact = new Set<String?>();
      contacts.forEach((element) {
        element.phones.forEach((elementA) {
          newListOfContact.add(elementA.number);
        });
      });
      userFromFiresToreDB.userContactList!.forEach((element) {
        newListOfContact.add(element);
      });
      await _firestore.updateUserContactList(userFromFiresToreDB.userId, newListOfContact.toList());
      await _firestore.updateDeviceToken(userFromFiresToreDB.userId, _prefUtils.getDeviceToken());
      return true;
    }else{ // user does not exist
      return false;
    }
  }

  Map<String,dynamic> convertMapPreferences(UserFireStoreModel userFromFireStore){
    Map<String, dynamic> userMap = {};
    userMap["userPhoneNumber"] = userFromFireStore.userPhoneNumber;
    userMap["photoLink"] = userFromFireStore.userPhotoLink;
    userMap["userName"] = userFromFireStore.userName;
    return userMap;
  }

  Future<void> setOnboardingCheckpoint() async {
    _prefUtils.setUserPhoneNumber(fullPhoneNumber);
    _prefUtils.setOnboardingCheckpoint("afterOTP");
  }

  Future<void> verifyOTP(String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: otpCode, smsCode: smsCode);
    try {
      await _auth.signInWithCredential(credential).then((UserCredential userCredential) async{
        if(await checkForExistingUser()){ // existing user means login
          await manuallyKillConstructor();
          Get.toNamed(
            AppRoutes.userProfileScreen,
            arguments: fullPhoneNumber
          );
        }else{
          await setOnboardingCheckpoint();
          await manuallyKillConstructor();
          Get.toNamed(
            AppRoutes.explanationOfMatchaScreen,
            arguments: fullPhoneNumber
          );
        }
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to verify OTP");
    }
  }

  Future<void> sendOTPCodeToPhone(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        return;
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar("Error", e.message!);
      },
      codeSent: (String verificationId, int? resendToken) {
        otpCode = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: Duration(seconds:60),
    );
  }

}
