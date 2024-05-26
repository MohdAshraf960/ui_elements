// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_weights.dart';
import 'sizes.dart';

/// A custom text style class that extends [TextStyle] to provide predefined text styles.
class AppTextStyle extends TextStyle {
  /// The font weight to use when painting the text.
  final FontWeight fontWeight;

  /// The size of glyphs (in logical pixels) to use when painting the text.
  final double fontSize;

  /// The color to use when painting the text.
  final Color color;

  /// The name of the font to use when painting the text.
  final String? fontFamily;

  /// Private constructor for [AppTextStyle].
  const AppTextStyle._({
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    this.fontFamily = 'Sora',
  }) : super(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
        );

  /// Factory constructor to create a [regular400] text style.
  ///
  /// [fontSize] is the size of the text. Default is [AppSizes.size14].
  /// [color] is the color of the text. Default is [AppColor.primaryTextColor].
  /// [fontFamily] is the font family. Default is 'Sora'.
  factory AppTextStyle.regular({
    double fontSize = AppSizes.size14,
    Color color = AppColor.primaryTextColor,
    String? fontFamily,
  }) {
    return AppTextStyle._(
      fontWeight: AppFontWeights.regular,
      fontSize: fontSize,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// Factory constructor to create a [medium500] text style.
  ///
  /// [fontSize] is the size of the text. Default is [AppSizes.size14].
  /// [color] is the color of the text. Default is [AppColor.primaryTextColor].
  /// [fontFamily] is the font family. Default is 'Sora'.
  factory AppTextStyle.medium({
    double fontSize = AppSizes.size14,
    Color color = AppColor.primaryTextColor,
    String? fontFamily,
  }) {
    return AppTextStyle._(
      fontWeight: AppFontWeights.medium,
      fontSize: fontSize,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// Factory constructor to create a [semibold600] text style.
  ///
  /// [fontSize] is the size of the text. Default is [AppSizes.size14].
  /// [color] is the color of the text. Default is [AppColor.primaryTextColor].
  /// [fontFamily] is the font family. Default is 'Sora'.
  factory AppTextStyle.semiBold({
    double fontSize = AppSizes.size14,
    Color color = AppColor.primaryTextColor,
    String? fontFamily,
  }) {
    return AppTextStyle._(
      fontWeight: AppFontWeights.semiBold,
      fontSize: fontSize,
      color: color,
      fontFamily: fontFamily,
    );
  }

  /// Factory constructor to create a [bold700] text style.
  ///
  /// [fontSize] is the size of the text. Default is [AppSizes.size14].
  /// [color] is the color of the text. Default is [AppColor.primaryTextColor].
  /// [fontFamily] is the font family. Default is 'Sora'.
  factory AppTextStyle.bold({
    double fontSize = AppSizes.size14,
    Color color = AppColor.primaryTextColor,
    String? fontFamily,
  }) {
    return AppTextStyle._(
      fontWeight: AppFontWeights.bold,
      fontSize: fontSize,
      color: color,
      fontFamily: fontFamily,
    );
  }
}
