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
                            text:"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
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
