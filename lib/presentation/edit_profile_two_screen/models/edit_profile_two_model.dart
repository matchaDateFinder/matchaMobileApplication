import 'package:matchaapplication/data/models/selectionPopupModel/selection_popup_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [edit_profile_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditProfileTwoModel {
  Rx<List<String>> radioList = Rx([
    "lbl_highschools",
    "lbl_associates",
    "lbl_bachelors",
    "lbl_masters",
    "lbl_doctorates"
  ]);

  Rx<List<SelectionPopupModel>> religionDropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Islam",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Kristen",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Katholik",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Hindu",
    ),
    SelectionPopupModel(
      id: 5,
      title: "Buddha",
    ),
    SelectionPopupModel(
      id: 6,
      title: "Kong Hu Cu",
    )
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([ // should be a text numeric field
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);

  Rx<List<String>> radioList1 = Rx(["lbl_yes", "lbl_socially", "lbl_no"]);

  Rx<List<String>> radioList2 = Rx(["lbl_yes", "lbl_socially", "lbl_no"]);

  Rx<List<SelectionPopupModel>> mbtiDropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "INTJ",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "INTP",
    ),
    SelectionPopupModel(
      id: 3,
      title: "ENTJ",
    ),
    SelectionPopupModel(
      id: 4,
      title: "ENTP",
    ),
    SelectionPopupModel(
      id: 5,
      title: "INFJ",
    ),
    SelectionPopupModel(
      id: 6,
      title: "INFP",
    ),
    SelectionPopupModel(
      id: 7,
      title: "ENFJ",
    ),
    SelectionPopupModel(
      id: 8,
      title: "ENFP",
    ),
    SelectionPopupModel(
      id: 9,
      title: "ISTJ",
    ),
    SelectionPopupModel(
      id: 10,
      title: "ISFJ",
    ),
    SelectionPopupModel(
      id: 11,
      title: "ESTJ",
    ),
    SelectionPopupModel(
      id: 12,
      title: "ESFJ",
    ),
    SelectionPopupModel(
      id: 13,
      title: "ISTP",
    ),
    SelectionPopupModel(
      id: 14,
      title: "ISFP",
    ),
    SelectionPopupModel(
      id: 15,
      title: "ESTP",
    ),
    SelectionPopupModel(
      id: 16,
      title: "ESFP",
    )
  ]);
}
