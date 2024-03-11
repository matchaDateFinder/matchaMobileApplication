import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/explanation_of_matcha_screen/models/explanation_of_matcha_model.dart';

/// A controller class for the ExplanationOfMatchaScreen.
///
/// This class manages the state of the ExplanationOfMatchaScreen, including the
/// current explanationOfMatchaModelObj
class ExplanationOfMatchaController extends GetxController {
  Rx<ExplanationOfMatchaModel> explanationOfMatchaModelObj =
      ExplanationOfMatchaModel().obs;

}
