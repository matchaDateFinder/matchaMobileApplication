import 'package:matchaapplication/presentation/edit_profile_two_screen/edit_profile_two_screen.dart';
import 'package:matchaapplication/presentation/edit_profile_two_screen/binding/edit_profile_two_binding.dart';
import 'package:matchaapplication/presentation/error_screen/error_screen.dart';
import 'package:matchaapplication/presentation/explanation_of_mutual_screen/binding/explanation_of_mutual_binding.dart';
import 'package:matchaapplication/presentation/match_profile_screen/match_profile_screen.dart';
import 'package:matchaapplication/presentation/match_profile_screen/binding/match_profile_binding.dart';
import 'package:matchaapplication/presentation/chat_function_container_screen/chat_function_container_screen.dart';
import 'package:matchaapplication/presentation/chat_function_container_screen/binding/chat_function_container_binding.dart';
import 'package:matchaapplication/presentation/input_name_screen/input_name_screen.dart';
import 'package:matchaapplication/presentation/input_name_screen/binding/input_name_binding.dart';
import 'package:matchaapplication/presentation/notice_one_screen/notice_one_screen.dart';
import 'package:matchaapplication/presentation/notice_one_screen/binding/notice_one_binding.dart';
import 'package:matchaapplication/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:matchaapplication/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:matchaapplication/presentation/user_profile_screen/user_profile_screen.dart';
import 'package:matchaapplication/presentation/user_profile_screen/binding/user_profile_binding.dart';
import 'package:matchaapplication/presentation/input_phone_number_screen/input_phone_number_screen.dart';
import 'package:matchaapplication/presentation/input_phone_number_screen/binding/input_phone_number_binding.dart';
import 'package:matchaapplication/presentation/candidate_profile_screen/candidate_profile_screen.dart';
import 'package:matchaapplication/presentation/candidate_profile_screen/binding/candidate_profile_binding.dart';
import 'package:matchaapplication/presentation/complete_profile_screen/complete_profile_screen.dart';
import 'package:matchaapplication/presentation/complete_profile_screen/binding/complete_profile_binding.dart';
import 'package:matchaapplication/presentation/notice_two_screen/notice_two_screen.dart';
import 'package:matchaapplication/presentation/notice_two_screen/binding/notice_two_binding.dart';
import 'package:matchaapplication/presentation/input_gender_screen/input_gender_screen.dart';
import 'package:matchaapplication/presentation/input_gender_screen/binding/input_gender_binding.dart';
import 'package:matchaapplication/presentation/request_contact_access_screen/request_contact_access_screen.dart';
import 'package:matchaapplication/presentation/request_contact_access_screen/binding/request_contact_access_binding.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/chat_room_one_screen.dart';
import 'package:matchaapplication/presentation/chat_room_one_screen/binding/chat_room_one_binding.dart';
import 'package:matchaapplication/presentation/upload_profile_picture_screen/upload_profile_picture_screen.dart';
import 'package:matchaapplication/presentation/upload_profile_picture_screen/binding/upload_profile_picture_binding.dart';
import 'package:matchaapplication/presentation/input_age_screen/input_age_screen.dart';
import 'package:matchaapplication/presentation/input_age_screen/binding/input_age_binding.dart';
import 'package:matchaapplication/presentation/explanation_of_matcha_screen/explanation_of_matcha_screen.dart';
import 'package:matchaapplication/presentation/explanation_of_matcha_screen/binding/explanation_of_matcha_binding.dart';
import 'package:matchaapplication/presentation/login_signup_screen/login_signup_screen.dart';
import 'package:matchaapplication/presentation/login_signup_screen/binding/login_signup_binding.dart';
import 'package:matchaapplication/presentation/otp_screen/otp_screen.dart';
import 'package:matchaapplication/presentation/otp_screen/binding/otp_binding.dart';
import 'package:matchaapplication/presentation/explanation_of_mutual_screen/explanation_of_mutual_screen.dart';
import 'package:matchaapplication/presentation/error_screen/error_screen.dart';
import 'package:matchaapplication/presentation/error_screen/binding/error_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String editProfileTwoScreen = '/edit_profile_two_screen';

  static const String matchProfileScreen = '/match_profile_screen';

  static const String chatFunctionPage = '/chat_function_page';

  static const String chatFunctionTabContainerPage =
      '/chat_function_tab_container_page';

  static const String chatFunctionContainerScreen =
      '/chat_function_container_screen';

  static const String inputNameScreen = '/input_name_screen';

  static const String noticeOneScreen = '/notice_one_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String userProfileScreen = '/user_profile_screen';

  static const String inputPhoneNumberScreen = '/input_phone_number_screen';

  static const String candidateProfileScreen = '/candidate_profile_screen';

  static const String completeProfileScreen = '/complete_profile_screen';

  static const String noticeTwoScreen = '/notice_two_screen';

  static const String chatRoomTwoScreen = '/chat_room_two_screen';

  static const String inputGenderScreen = '/input_gender_screen';

  static const String requestContactAccessScreen =
      '/request_contact_access_screen';

  static const String chatRoomOneScreen = '/chat_room_one_screen';

  static const String uploadProfilePictureScreen =
      '/upload_profile_picture_screen';

  static const String inputAgeScreen = '/input_age_screen';

  static const String explanationOfMatchaScreen =
      '/explanation_of_matcha_screen';

  static const String loginSignupScreen = '/login_signup_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String otpVerifyScreen = '/otp_screen';

  static const String explanationOfMutualScreen = '/explanation_of_mutual_screen';

  static const String errorScreen = '/error_screen';

  static List<GetPage> pages = [
    GetPage(
      name: editProfileTwoScreen,
      page: () => EditProfileTwoScreen(),
      bindings: [
        EditProfileTwoBinding(),
      ],
    ),
    GetPage(
      name: matchProfileScreen,
      page: () => MatchProfileScreen(),
      bindings: [
        MatchProfileBinding(),
      ],
    ),
    GetPage(
      name: chatFunctionContainerScreen,
      page: () => ChatFunctionContainerScreen(),
      bindings: [
        ChatFunctionContainerBinding(),
      ],
    ),
    GetPage(
      name: inputNameScreen,
      page: () => InputNameScreen(),
      bindings: [
        InputNameBinding(),
      ],
    ),
    GetPage(
      name: noticeOneScreen,
      page: () => NoticeOneScreen(),
      bindings: [
        NoticeOneBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: userProfileScreen,
      page: () => UserProfileScreen(),
      bindings: [
        UserProfileBinding(),
      ],
    ),
    GetPage(
      name: inputPhoneNumberScreen,
      page: () => InputPhoneNumberScreen(),
      bindings: [
        InputPhoneNumberBinding(),
      ],
    ),
    GetPage(
      name: candidateProfileScreen,
      page: () => CandidateProfileScreen(),
      bindings: [
        CandidateProfileBinding(),
      ],
    ),
    GetPage(
      name: completeProfileScreen,
      page: () => CompleteProfileScreen(),
      bindings: [
        CompleteProfileBinding(),
      ],
    ),
    GetPage(
      name: noticeTwoScreen,
      page: () => NoticeTwoScreen(),
      bindings: [
        NoticeTwoBinding(),
      ],
    ),
    GetPage(
      name: inputGenderScreen,
      page: () => InputGenderScreen(),
      bindings: [
        InputGenderBinding(),
      ],
    ),
    GetPage(
      name: requestContactAccessScreen,
      page: () => RequestContactAccessScreen(),
      bindings: [
        RequestContactAccessBinding(),
      ],
    ),
    GetPage(
      name: chatRoomOneScreen,
      page: () => ChatRoomOneScreen(),
      bindings: [
        ChatRoomOneBinding(),
      ],
    ),
    GetPage(
      name: uploadProfilePictureScreen,
      page: () => UploadProfilePictureScreen(),
      bindings: [
        UploadProfilePictureBinding(),
      ],
    ),
    GetPage(
      name: inputAgeScreen,
      page: () => InputAgeScreen(),
      bindings: [
        InputAgeBinding(),
      ],
    ),
    GetPage(
      name: explanationOfMatchaScreen,
      page: () => ExplanationOfMatchaScreen(),
      bindings: [
        ExplanationOfMatchaBinding(),
      ],
    ),
    GetPage(
      name: loginSignupScreen,
      page: () => LoginSignupScreen(),
      bindings: [
        LoginSignupBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => LoginSignupScreen(),
      bindings: [
        LoginSignupBinding(),
      ],
    ),
    GetPage(
      name: otpVerifyScreen,
      page: () => OtpScreen(),
      bindings: [
        OtpBinding()
      ]
    ),
    GetPage(
        name: explanationOfMutualScreen,
        page: () => ExplanationOfMutualScreen(),
        bindings: [
          ExplanationOfMutualBinding()
        ]
    ),
    GetPage(
        name: errorScreen,
        page: () => ErrorScreen(),
        bindings: [
          ErrorBinding()
        ]
    )
  ];
}
