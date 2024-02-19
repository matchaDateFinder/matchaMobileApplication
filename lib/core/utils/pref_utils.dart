//ignore: unused_import
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
    _sharedPreferences?.setBool("isLogin", false);
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }

  bool? getLogInStatus() {
    return _sharedPreferences?.getBool("isLogin");
  }

  void setLoginStatus(bool value){
    _sharedPreferences?.setBool("isLogin", value);
  }

  String? getUserPhoneNumber() {
    return _sharedPreferences?.getString("userPhoneNumber");
  }

  void setLocalUser(Map<String,dynamic> userMap){
   // TODO set key value for user map
    _sharedPreferences?.setString("userPhoneNumber", userMap['userPhoneNumber']);
    _sharedPreferences?.setString("photoLink", userMap['photoLink']);
    _sharedPreferences?.setString("userName", userMap['userName']);
  }

  String? getUserName() {
    return _sharedPreferences?.getString("userName");
  }

}
