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


  Future<bool> askPermissions() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      _handleInvalidPermissions(permissionStatus);
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

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      print('Access to contact data denied');
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      print('Permanently Denied - Contact data not available on device');
    }
  }

}
