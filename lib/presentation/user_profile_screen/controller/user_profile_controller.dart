import "dart:core";
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/user_profile_screen/models/user_profile_model.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
/// A controller class for the UserProfileScreen.
///
/// This class manages the state of the UserProfileScreen, including the
/// current userProfileModelObj
class UserProfileController extends GetxController {
  var user;

  late final IsarService _isar;
  Rx<UserProfileModel> userProfileModelObj = UserProfileModel().obs;

  var phoneNumber;
  var userName;
  var userAge;

  var photoPathFromDB;
  var userPhotoPath = ''.obs;
  var nameAge = ''.obs;

  var userProfession = ''.obs;

  UserProfileController() {
    _isar = IsarService();
  }

  // List<Contact> _getContacts =
  //     await ContactsService.getContacts(withThumbnails:false);

  @override
  void onInit() async {
    // TODO
    // change to fetch from local db instead of get from param
    phoneNumber = Get.arguments;
    user = await _isar.getUserByPhoneNumber(phoneNumber);
    if (user != null) {
      userName = user?.name;
      photoPathFromDB = user?.photoLink;
      userAge = calculateAge(DateTime.now(), user!.age);
      nameAge.value = userName + ' - ' + userAge.toString();
      userPhotoPath.value = photoPathFromDB;
      await userProfileModelObj.value.setItemTag(user);
      userProfileModelObj.refresh();
    }
    List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
    print(contacts);
  }

  int calculateAge(DateTime today, DateTime dob) {
    final year = today.year - dob.year;
    final mth = today.month - dob.month;
    if(mth < 0){
      return year-1;
    }
    else {
      return year;
    }
  }

}
