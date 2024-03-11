import 'package:flutter/material.dart';
import 'package:matchaapplication/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillLightGreen => BoxDecoration(
        color: appTheme.lightGreen50,
      );
  static BoxDecoration get fillLightgreen200 => BoxDecoration(
        color: appTheme.lightGreen200,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray100,
  );
  static BoxDecoration get fillLime => BoxDecoration(
    color: appTheme.lime50,
  );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );

  // Outline decorations
  static BoxDecoration get outlinePrimary => BoxDecoration(
    color: appTheme.lightGreen300,
    border: Border.all(
      color: theme.colorScheme.primary,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
    border: Border.all(
      color: theme.colorScheme.primary,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlinePrimary2 => BoxDecoration(
    color: appTheme.lightGreen300,
    border: Border.all(
      color: theme.colorScheme.primary,
      width: 1.h,
    ),
    borderRadius: BorderRadiusStyle.roundedBorder10
  );
  static BoxDecoration get outlineFillPrimary => BoxDecoration(
    color: theme.colorScheme.onPrimary,
    border: Border.all(
      color: appTheme.black,
      width: 1.h,
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder108 => BorderRadius.circular(
    108.h,
  );
  static BorderRadius get circleBorder32 => BorderRadius.circular(
        32.h,
      );
  static BorderRadius get circleBorder48 => BorderRadius.circular(
        48.h,
      );
  static BorderRadius get circleBorder64 => BorderRadius.circular(
        64.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
