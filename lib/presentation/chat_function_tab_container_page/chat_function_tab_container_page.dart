import '../chat_function_tab_container_page/widgets/tabviewlist_item_widget.dart';
import 'controller/chat_function_tab_container_controller.dart';
import 'models/chat_function_tab_container_model.dart';
import 'models/tabviewlist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

class ChatFunctionTabContainerPage extends StatelessWidget {
  ChatFunctionTabContainerPage({Key? key})
      : super(
          key: key,
        );

  ChatFunctionTabContainerController controller = Get.put(
      ChatFunctionTabContainerController(ChatFunctionTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: _buildTabViewList(),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabViewList() {
    return Container(
      decoration: AppDecoration.fillOnPrimary,
      child: Obx(
        () => ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: controller.chatFunctionTabContainerModelObj.value
              .tabviewlistItemList.value.length,
          itemBuilder: (context, index) {
            TabviewlistItemModel model = controller
                .chatFunctionTabContainerModelObj
                .value
                .tabviewlistItemList
                .value[index];
            return TabviewlistItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }
}
