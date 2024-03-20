import 'controller/request_contact_access_controller.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/widgets/custom_elevated_button.dart';

class RequestContactAccessScreen
    extends GetWidget<RequestContactAccessController> {
  const RequestContactAccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 24.h, top: 64.v, right: 24.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.v),
                      Container(
                          width: 250.h,
                          margin: EdgeInsets.only(left: 22.h, right: 39.h),
                          child: Text("msg_request_contact_title".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleLarge)),
                      Container(
                          width: 250.h,
                          margin: EdgeInsets.only(left: 22.h, right: 39.h),
                          child: Text("msg_to_find_these_mutual".tr,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodyLarge)),
                      SizedBox(height: 44.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgRequestAccessMatcha,
                          height: 145.v,
                          width: 168.h,
                          alignment: Alignment.center),
                      SizedBox(height: 40.v),
                      Padding(
                          padding: EdgeInsets.only(left: 22.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgButton,
                                height: 24.adaptSize,
                                width: 24.adaptSize),
                            InkWell(
                              onTap: (){
                                _showSimpleModalDialog(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 16.h, top: 2.v),
                                  child: Text("msg_terms_and_conditions".tr,
                                      style: theme.textTheme.labelLarge!.copyWith(
                                        decoration: TextDecoration.underline,
                                      ))),
                            )
                          ])),
                      SizedBox(height: 60.adaptSize),
                      CustomElevatedButton(
                          text: "msg_i_agree_find_my".tr,
                          margin: EdgeInsets.only(left: 22.h, right: 26.h),
                          onPressed: () {
                            onTapIAgreefindMyMatcha();
                          },
                          alignment: Alignment.center,
                          buttonStyle: CustomButtonStyles.fillBlack),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the inputNameScreen when the action is triggered.
  onTapIAgreefindMyMatcha() async {
    if (await controller.askPermissions()){
      controller.setOnboardingCheckpoint();
      Get.toNamed(
        AppRoutes.inputNameScreen,
        arguments: Get.arguments,
      );
    }else{
      print('permission denied');
    }
  }

  _showSimpleModalDialog(context){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20.0)),
            child: Container(
              constraints: BoxConstraints(maxHeight: 350),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Terms and Conditions"),
                      SizedBox(height: 5.v),
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text:"""Matcha App User Contact Data Privacy Terms

                            1. Introduction
                        Welcome to Matcha! We are committed to protecting your privacy and handling your contact data with transparency and care.

                        2. Collection of Contact Data
                        When you use Matcha, we may require access to your contact data. This includes, but is not limited to, your contact list on your mobile device. We collect this data solely for the purpose of enhancing your experience on our platform.

                        3. Use of Contact Data
                        The contact data we collect will be used exclusively for finding mutual connections to provide potential matches within the Matcha app. We believe this creates a more meaningful and secure matching experience for you.

                        4. Consent
                        By accepting these terms, you provide explicit consent for Matcha to access, collect, and use your contact data for the aforementioned purpose. You can withdraw this consent at any time through the app settings, but please be aware that this may impact the functionality and your experience on the Matcha app.

                        5. Data Sharing and Disclosure
                        Matcha does not sell or rent your contact data to third parties. We will only share your contact data with third parties when it is necessary to provide our service or when legally required.

                        6. Data Security
                        We implement robust security measures to protect your contact data against unauthorized access, alteration, disclosure, or destruction. However, please be aware that no digital platform can guarantee 100% security.

                        7. Changes to Privacy Terms
                        Matcha reserves the right to modify these privacy terms at any time. We will notify you of any significant changes and seek your consent where applicable.

                        8. Contact Us
                        If you have any questions or concerns about our use of your contact data, please contact us through our app support or at [support email].

                            By using Matcha, you acknowledge that you have read, understood, and agreed to these terms.
                        """,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                                wordSpacing: 1
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          );
        });
  }

}
