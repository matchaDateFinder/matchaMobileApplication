import 'package:matchaapplication/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Outline button style
  static ButtonStyle get outlineOnPrimary => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: theme.colorScheme.onPrimary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.h),
    ),
  );
  static ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
    backgroundColor: appTheme.lightGreen300,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(),
  );
  static ButtonStyle get outlinePrimaryTL12 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.lightGreen200,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  static ButtonStyle get outlinePrimaryTL121 => OutlinedButton.styleFrom(
    backgroundColor: appTheme.lightGreen300,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.h),
    ),
  );
  static ButtonStyle get outlinePrimaryTL15 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.h),
    ),
  );
  static ButtonStyle get outlinePrimaryTL20 => OutlinedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
  );
  static ButtonStyle get outlinePrimaryTL201 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.h),
    ),
  );
  static ButtonStyle get outlinePrimaryTL241 => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: theme.colorScheme.primary,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.h),
    ),
  );
  static ButtonStyle get outlineRedTransparentFilling => OutlinedButton.styleFrom(
    backgroundColor: Colors.transparent,
    side: BorderSide(
      color: Colors.redAccent,
      width: 1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.h),
    ),
  );

  // Filled button style
  static ButtonStyle get fillLightGreen => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightGreen50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.h),
        ),
      );
  static ButtonStyle get fillLightGreenTL24 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.lightGreen200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
  static ButtonStyle get fillBlack => ElevatedButton.styleFrom(
        backgroundColor: appTheme.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}
