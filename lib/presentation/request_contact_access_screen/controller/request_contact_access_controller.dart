import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/request_contact_access_screen/models/request_contact_access_model.dart';

/// A controller class for the RequestContactAccessScreen.
///
/// This class manages the state of the RequestContactAccessScreen, including the
/// current requestContactAccessModelObj
class RequestContactAccessController extends GetxController {
  Rx<RequestContactAccessModel> requestContactAccessModelObj =
      RequestContactAccessModel().obs;
}
