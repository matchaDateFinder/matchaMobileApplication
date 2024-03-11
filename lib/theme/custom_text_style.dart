import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body style
  static get bodyLargePoppins => theme.textTheme.bodyLarge!.poppins;
  static get bodyLargePoppinsGray100 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.gray100,
      );
  static get bodyLargePoppinsLightgreen50 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.lightGreen50,
      );
  static get bodyLargePoppinsLime50 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.lime50,
      );
  static get bodyLargePoppinsSecondaryContainer =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  static get bodyLargeSecondaryContainer => theme.textTheme.bodyLarge!.copyWith(
    color: theme.colorScheme.secondaryContainer,
  );
  static get bodyMediumPoppins => theme.textTheme.bodyMedium!.poppins;
  static get bodyMediumPoppinsOnPrimary =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumff000000 => theme.textTheme.bodyMedium!.copyWith(
    color: Color(0XFF000000),
  );
  // Title text style
  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith(
    fontWeight: FontWeight.w600,
  );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w700,
  );
  static get titleMediumDMSans => theme.textTheme.titleMedium!.dMSans.copyWith(
    fontWeight: FontWeight.w500,
  );
  static get titleMediumSecondaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallDMSansff000000 =>
      theme.textTheme.titleSmall!.dMSans.copyWith(
        color: Color(0XFF000000),
        fontWeight: FontWeight.w700,
      );
  static get signOutRed =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: Colors.redAccent,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get cormorantGaramond {
    return copyWith(
      fontFamily: 'Cormorant Garamond',
    );
  }
}
