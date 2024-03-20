import '../../../core/app_export.dart';

/// This class defines the variables used in the [edit_profile_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditProfileTwoModel {
  Rx<List<String>> educationRadioList = Rx([
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

  Rx<List<String>> smokingDrinkingRadioList = Rx(["lbl_yes", "lbl_socially", "lbl_no"]);

  Rx<List<SelectionPopupModel>> mbtiDropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "INTJ",
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

  Rx<List<SelectionPopupModel>> lookingForDropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Still figuring out",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Serious relationships",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Marriage",
    ),
  ]);

  Rx<List<SelectionPopupModel>> marriagePlanDropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "<1 years",
    ),
    SelectionPopupModel(
      id: 2,
      title: "1-3 years",
    ),
    SelectionPopupModel(
      id: 3,
      title: "3-5 years",
    ),
    SelectionPopupModel(
      id: 4,
      title: ">5 years",
    ),
  ]);
}
