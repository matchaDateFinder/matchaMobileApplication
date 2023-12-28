import '../controller/request_contact_access_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RequestContactAccessScreen.
///
/// This class ensures that the RequestContactAccessController is created when the
/// RequestContactAccessScreen is first loaded.
class RequestContactAccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestContactAccessController());
  }
}
