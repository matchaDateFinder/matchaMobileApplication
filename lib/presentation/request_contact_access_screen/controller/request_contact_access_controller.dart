import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/request_contact_access_screen/models/request_contact_access_model.dart';
import 'package:permission_handler/permission_handler.dart';

/// A controller class for the RequestContactAccessScreen.
///
/// This class manages the state of the RequestContactAccessScreen, including the
/// current requestContactAccessModelObj
class RequestContactAccessController extends GetxController {
  Rx<RequestContactAccessModel> requestContactAccessModelObj =
      RequestContactAccessModel().obs;

  late final PrefUtils _prefUtils;

  RequestContactAccessController(){
    _prefUtils = PrefUtils();
  }

  Future<bool> askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      if(_handleInvalidPermanentPermissions(permissionStatus) == "permanentDeny"){
        _prefUtils.setErrorType("contactAccess");
        Get.toNamed(
          AppRoutes.errorScreen,
        );
      }
      return false;
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  String _handleInvalidPermanentPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.permanentlyDenied) {
      return "permanentDeny";
    }
    return "granted";
  }

  Future<void> setOnboardingCheckpoint() async {
    _prefUtils.setOnboardingCheckpoint("afterContactAccess");
  }

}
