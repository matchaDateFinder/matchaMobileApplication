import '../../../core/app_export.dart';

/// This class defines the variables used in the [input_gender_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class InputGenderModel {
  Rx<List<String>> radioList = Rx(["lbl_woman", "lbl_man"]);
}
