import 'package:flutter/material.dart';
import 'package:ui_elements/ui_elements.dart';

class AppLoaderButton extends StatelessWidget {
  const AppLoaderButton._({
    required this.onPressed,
    required this.title,
    this.isDisabled = false,
    this.backgroundColor,
    this.isLoading = false,
    this.foregroundColor,
    this.loaderColor,
    this.shadowColor,
    this.textStyle,
  });

  final VoidCallback onPressed;
  final String title;
  final bool isDisabled;
  final Color? backgroundColor;
  final bool isLoading;
  final Color? foregroundColor;
  final Color? loaderColor;
  final Color? shadowColor;
  final TextStyle? textStyle;

  /// Private helper method to create an AppButton
  static AppLoaderButton _createButton({
    required VoidCallback onPressed,
    required String title,
    required Color backgroundColor,
    required Color shadowColor,
    bool isDisabled = false,
    bool isLoading = false,
    Color? foregroundColor,
    Color? loaderColor,
    AppTextStyle? textStyle,
  }) {
    return AppLoaderButton._(
      isLoading: isLoading,
      onPressed: onPressed,
      title: title,
      isDisabled: isDisabled,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      loaderColor: loaderColor,
      shadowColor: shadowColor,
      textStyle: textStyle ??
          AppTextStyle.medium(
            fontSize: AppSizes.size16,
            color: foregroundColor ?? AppColor.whiteColor,
          ),
    );
  }

  /// Factory constructor for primary button
  factory AppLoaderButton.primary({
    required VoidCallback onPressed,
    required String title,
    bool isDisabled = false,
    bool isLoading = false,
    Color? foregroundColor,
    Color? loaderColor,
    AppTextStyle? textStyle,
  }) {
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
    );
  }

  /// Factory constructor for secondary button
  factory AppLoaderButton.secondary({
    required VoidCallback onPressed,
    required String title,
    bool isDisabled = false,
    bool isLoading = false,
    Color? foregroundColor,
    Color? loaderColor,
    AppTextStyle? textStyle,
  }) {
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
    );
  }

  /// Factory constructor for error button
  factory AppLoaderButton.error({
    required VoidCallback onPressed,
    required String title,
    bool isDisabled = false,
    bool isLoading = false,
    Color? foregroundColor,
    Color? loaderColor,
    AppTextStyle? textStyle,
  }) {
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isDisabled || isLoading ? null : onPressed,
      icon: Visibility(
        visible: isLoading,
        replacement: const SizedBox.shrink(),
        child: SizedBox(
          height: 8,
          width: 8,
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation(loaderColor ?? AppColor.whiteColor),
          ),
        ),
      ),
      label: Text(title, style: textStyle),
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(AppDimensionsConstants.defaultPadding)),
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
    );
  }
}
