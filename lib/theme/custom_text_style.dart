import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeDMSans => theme.textTheme.bodyLarge!.dMSans;
  static get bodyLargeDMSansTnC => theme.textTheme.bodyLarge!.dMSans.copyWith(
      fontWeight: FontWeight.w800);
  static get bodyLargeDMSansBlack900 =>
      theme.textTheme.bodyLarge!.dMSans.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeDMSansLightgreen200 =>
      theme.textTheme.bodyLarge!.dMSans.copyWith(
        color: appTheme.lightGreen200,
      );
  static get bodyLargeGray700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyLargeLightgreen50 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.lightGreen50,
      );
  static get bodyLargeOnPrimaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get bodyMediumPoppins => theme.textTheme.bodyMedium!.poppins;
  static get bodyMediumPoppinsLightgreen50 =>
      theme.textTheme.bodyMedium!.poppins.copyWith(
        color: appTheme.lightGreen50,
      );
  // Headline text style
  static get headlineSmallSemiBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Title text style
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimarySemiBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
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
}
