import '../models/tag_item_model.dart';
import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

// ignore: must_be_immutable
class TagItemWidget extends StatelessWidget {
  TagItemWidget(
    this.tagItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TagItemModel tagItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.only(
          top: 2.v,
          right: 8.h,
          bottom: 2.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          tagItemModelObj.attributevalue!.value,
          style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: 14.fSize,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
          ),
        ),
        avatar: CustomImageView(
          imagePath: tagItemModelObj.attributeIcon!.value,
          height: 15.v,
          width: 16.h,
          margin: EdgeInsets.only(right: 8.h),
        ),
        selected: (tagItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.lightGreen200,
        selectedColor: appTheme.lightGreen200,
        shape: (tagItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.primary.withOpacity(0.6),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  12.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  12.h,
                ),
              ),
      ),
    );
  }
}
