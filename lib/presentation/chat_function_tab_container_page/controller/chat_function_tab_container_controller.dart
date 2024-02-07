import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';
import 'package:matchaapplication/presentation/chat_function_tab_container_page/models/chat_function_tab_container_model.dart';

/// A controller class for the ChatFunctionTabContainerPage.
///
/// This class manages the state of the ChatFunctionTabContainerPage, including the
/// current chatFunctionTabContainerModelObj
class ChatFunctionTabContainerController extends GetxController with GetSingleTickerProviderStateMixin{
  ChatFunctionTabContainerController(this.chatFunctionTabContainerModelObj);

  Rx<ChatFunctionTabContainerModel> chatFunctionTabContainerModelObj;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

}
