import 'package:flutter/material.dart';
import 'package:ui_elements/ui_elements.dart';

class AppButton extends StatelessWidget {
  const AppButton._({
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
  static AppButton _createButton({
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
    return AppButton._(
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
  factory AppButton.primary({
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
  factory AppButton.secondary({
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
  factory AppButton.error({
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
          height: 16,
          width: 16,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation(loaderColor ?? AppColor.whiteColor),
          ),
        ),
      ),
      label: Text(title, style: textStyle),
      style: ButtonStyle(
        
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical:  AppDimensionsConstants.defaultPadding,horizontal: AppDimensionsConstants.defaultPadding * 2)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.size50),
            side: BorderSide.none,
          ),
        ),
        shadowColor: MaterialStateProperty.all<Color>(shadowColor ?? const Color(0xCCE7E4E8)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return backgroundColor?.withOpacity(0.3) ?? AppColor.primaryColor.withOpacity(0.3);
            }
            return backgroundColor ?? AppColor.primaryColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return foregroundColor ?? AppColor.whiteColor;
            }
            return foregroundColor ?? AppColor.whiteColor;
          },
        ),
      ),
    );
  }
}
