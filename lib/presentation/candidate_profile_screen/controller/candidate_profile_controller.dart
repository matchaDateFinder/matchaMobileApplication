import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/candidate_profile_screen/models/candidate_profile_model.dart';

/// A controller class for the CandidateProfileScreen.
///
/// This class manages the state of the CandidateProfileScreen, including the
/// current candidateProfileModelObj
class CandidateProfileController extends GetxController {
  Rx<CandidateProfileModel> candidateProfileModelObj =
      CandidateProfileModel().obs;
}
