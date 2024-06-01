import 'package:flutter/material.dart';
import 'package:ui_elements/ui_elements.dart';

class AppButton extends StatelessWidget {
  const AppButton._(
      {required this.onPressed,
      required this.title,
      this.isDisabled = false,
      this.backgroundColor,
      this.isLoading = false,
      this.foregroundColor,
      this.loaderColor,
      this.shadowColor,
      this.textStyle,
      this.minimumSize});

  final VoidCallback onPressed;
  final String title;
  final bool isDisabled;
  final Color? backgroundColor;
  final bool isLoading;
  final Color? foregroundColor;
  final Color? loaderColor;
  final Color? shadowColor;
  final TextStyle? textStyle;
  final WidgetStateProperty<Size>? minimumSize;

  /// Private helper method to create an AppButton
  static AppButton _createButton(
      {required VoidCallback onPressed,
      required String title,
      required Color backgroundColor,
      required Color shadowColor,
      bool isDisabled = false,
      bool isLoading = false,
      Color? foregroundColor,
      Color? loaderColor,
      AppTextStyle? textStyle,
      WidgetStateProperty<Size>? minimumSize}) {
    return AppButton._(
      isLoading: isLoading,
      onPressed: onPressed,
      title: title,
      isDisabled: isDisabled,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      loaderColor: loaderColor,
      shadowColor: shadowColor,
      minimumSize: minimumSize,
      textStyle: textStyle ??
          AppTextStyle.medium(
            fontSize: AppSizes.size16,
            color: foregroundColor ?? AppColor.whiteColor,
          ),
    );
  }

  /// Factory constructor for primary button
  factory AppButton.primary(
      {required VoidCallback onPressed,
      required String title,
      bool isDisabled = false,
      bool isLoading = false,
      Color? foregroundColor,
      Color? loaderColor,
      AppTextStyle? textStyle,
      WidgetStateProperty<Size>? minimumSize}) {
    return _createButton(
        onPressed: onPressed,
        title: title,
        backgroundColor: AppColor.primaryColor,
        shadowColor: AppColor.primaryButtonShadow,
        isDisabled: isDisabled,
        isLoading: isLoading,
        foregroundColor: foregroundColor,
        loaderColor: loaderColor,
        textStyle: textStyle,
        minimumSize: minimumSize);
  }

  /// Factory constructor for secondary button
  factory AppButton.secondary(
      {required VoidCallback onPressed,
      required String title,
      bool isDisabled = false,
      bool isLoading = false,
      Color? foregroundColor,
      Color? loaderColor,
      AppTextStyle? textStyle,
      WidgetStateProperty<Size>? minimumSize}) {
    return _createButton(
        onPressed: onPressed,
        title: title,
        backgroundColor: AppColor.secondaryButtonColor,
        shadowColor: AppColor.secondaryButtonShadow,
        isDisabled: isDisabled,
        isLoading: isLoading,
        foregroundColor: foregroundColor,
        loaderColor: loaderColor,
        textStyle: textStyle,
        minimumSize: minimumSize);
  }

  /// Factory constructor for error button
  factory AppButton.error(
      {required VoidCallback onPressed,
      required String title,
      bool isDisabled = false,
      bool isLoading = false,
      Color? foregroundColor,
      Color? loaderColor,
      AppTextStyle? textStyle,
      WidgetStateProperty<Size>? minimumSize}) {
    return _createButton(
        onPressed: onPressed,
        title: title,
        backgroundColor: AppColor.errorColor,
        shadowColor: AppColor.secondaryButtonShadow,
        isDisabled: isDisabled,
        isLoading: isLoading,
        foregroundColor: foregroundColor,
        loaderColor: loaderColor,
        textStyle: textStyle,
        minimumSize: minimumSize);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: ButtonStyle(
        minimumSize: minimumSize,
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
              vertical: AppDimensionsConstants.defaultPadding, horizontal: AppDimensionsConstants.defaultPadding * 2),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.size50),
            side: BorderSide.none,
          ),
        ),
        shadowColor: WidgetStateProperty.all<Color>(shadowColor ?? const Color(0xCCE7E4E8)),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return backgroundColor?.withOpacity(0.3) ?? AppColor.primaryColor.withOpacity(0.3);
            }
            return backgroundColor ?? AppColor.primaryColor;
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return foregroundColor ?? AppColor.whiteColor;
            }
            return foregroundColor ?? AppColor.whiteColor;
          },
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isLoading) ...{
            SizedBox.square(
              dimension: AppSizes.size16,
              child: CircularProgressIndicator.adaptive(
                strokeWidth: AppSizes.size2,
                valueColor: AlwaysStoppedAnimation(loaderColor ?? AppColor.whiteColor),
              ),
            ),
            const SizedBox(width: AppSizes.size8), // Add space between the icon and the label
          },
          Text(title, style: textStyle),
        ],
      ),
    );
  }
}
