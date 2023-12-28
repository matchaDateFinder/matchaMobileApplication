import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/match_profile_screen/models/match_profile_model.dart';

/// A controller class for the MatchProfileScreen.
///
/// This class manages the state of the MatchProfileScreen, including the
/// current matchProfileModelObj
class MatchProfileController extends GetxController {
  Rx<MatchProfileModel> matchProfileModelObj = MatchProfileModel().obs;
}
