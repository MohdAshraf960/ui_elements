
// ignore_for_file: annotate_overrides, overridden_fields

import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_weights.dart';
import 'sizes.dart';

class AppTextStyle extends TextStyle {
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final String? fontFamily;

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
