import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/sizes.dart';
import 'package:ui_elements/text_styles.dart';

class AppTextField extends StatelessWidget{
  final String hint;

  const AppTextField({super.key,
    this.hint = "",
    this.controller,
    this.keyboardType,
    this.isPassword = false,
    this.prefix,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.focusNode,
    this.enableSuggestions = true,
    this.suffix,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.horizontalPadding
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isPassword,enableSuggestions;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final String? Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final Widget? suffix;
  final bool readOnly;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final double? horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding??6),
      child: TextFormField(
        onTap: onTap,
        readOnly: readOnly,
        enableInteractiveSelection: !readOnly,
        enableSuggestions: enableSuggestions,
        obscureText: isPassword,
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: AppColor.primaryColor,
        style: const TextStyle(
            decoration: TextDecoration.none, decorationThickness: 0),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.textFieldBackgroundColor,
            hintStyle: AppTextStyle.regular(
              fontSize: AppSizes.size16,
              color: AppColor.hintTextColor
            ),
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32),borderSide: BorderSide.none),
            prefixIcon: prefix,
            suffixIcon: suffix,
            contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16)
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