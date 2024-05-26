import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/sizes.dart';
import 'package:ui_elements/text_styles.dart';

/// Custom text field widget with customizable features like hint, prefix, suffix, etc.
class AppTextField extends StatelessWidget {
  /// The hint text displayed when the text field is empty.
  final String hint;

  /// Controller for controlling the text field's text and selection.
  final TextEditingController? controller;

  /// The type of keyboard to display for this text field.
  final TextInputType? keyboardType;

  /// Whether the text should be obscured, such as for passwords.
  final bool obscureText;

  /// Widget to display before the text field's input area.
  final Widget? prefix;

  /// Validator function to validate the input text.
  final String? Function(String?)? validator;

  /// Callback function triggered when the user submits the text field's value.
  final String? Function(String?)? onFieldSubmitted;

  /// List of input formatters to apply to the text field.
  final List<TextInputFormatter>? inputFormatter;

  /// Focus node to control the keyboard focus of this text field.
  final FocusNode? focusNode;

  /// Widget to display after the text field's input area.
  final Widget? suffix;

  /// Whether the text field is read-only or editable.
  final bool readOnly;

  /// Callback function triggered when the text field's value changes.
  final void Function(String)? onChanged;

  /// Callback function triggered when the text field is tapped.
  final VoidCallback? onTap;

  /// Horizontal padding to apply around the text field.
  final double? horizontalPadding;

  /// Whether to enable suggestions like autocorrect and autocomplete.
  final bool enableSuggestions;

  /// Action button to display on the keyboard.
  final TextInputAction? textInputAction;

  /// Creates a custom text field widget.
  const AppTextField({
    Key? key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefix,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.focusNode,
    this.suffix,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.horizontalPadding,
    this.enableSuggestions = true,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? AppSizes.size6),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        textInputAction: textInputAction,
        enableInteractiveSelection: !readOnly,
        enableSuggestions: enableSuggestions,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: AppColor.primaryColor,
        style: const TextStyle(
          decoration: TextDecoration.none,
          decorationThickness: 0,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.textFieldBackgroundColor,
          hintStyle: AppTextStyle.regular(
            fontSize: AppSizes.size16,
            color: AppColor.hintTextColor,
          ),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.size32),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.size32),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.size32),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.size32),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.size32),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.size32),
            borderSide: BorderSide.none,
          ),
          prefix: prefix,
          suffixIcon: suffix,
          contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.size24, vertical: AppSizes.size16),
        ),
        validator: validator,
        inputFormatters: inputFormatter,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        focusNode: focusNode,
      ),
    );
  }
}
