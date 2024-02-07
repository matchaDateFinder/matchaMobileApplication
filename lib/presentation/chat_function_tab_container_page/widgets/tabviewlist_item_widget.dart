import '../controller/chat_function_tab_container_controller.dart';
import '../models/tabviewlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

// ignore: must_be_immutable
class TabviewlistItemWidget extends StatelessWidget {
  TabviewlistItemWidget(
    this.tabviewlistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TabviewlistItemModel tabviewlistItemModelObj;

  var controller = Get.find<ChatFunctionTabContainerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: appTheme.blueGray100,
      ),
      child: TabBar(
        controller: controller.controller,
        isScrollable: true,
        labelColor: theme.colorScheme.primary,
        labelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.black900,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        indicator: BoxDecoration(
          color: appTheme.lightGreen50,
        ),
        tabs: [
          Tab(
            child: Text(
              "lbl_chats".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_chats".tr,
            ),
          ),
        ],
      ),
    );
  }
}
