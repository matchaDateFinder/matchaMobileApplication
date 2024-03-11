import '../../../core/app_export.dart';
import '../models/explanation_of_mutual_model.dart';

/// A controller class for the ExplanationOfMutualScreen.
///
/// This class manages the state of the ExplanationOfMutualScreen, including the
/// current explanationOfMutualModelObj
class ExplanationOfMutualController extends GetxController {
  Rx<ExplanationOfMutualModel> explanationOfMutualModelObj =
      ExplanationOfMutualModel().obs;
}
