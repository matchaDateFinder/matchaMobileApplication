import '../controller/upload_profile_picture_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UploadProfilePictureScreen.
///
/// This class ensures that the UploadProfilePictureController is created when the
/// UploadProfilePictureScreen is first loaded.
class UploadProfilePictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UploadProfilePictureController());
  }
}
