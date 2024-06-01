import 'package:flutter/material.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/sizes.dart';
import 'package:ui_elements/text_styles.dart';
import 'package:ui_elements/utils/utils.dart';

class NumButton extends StatelessWidget {
  const NumButton({
    Key? key,
    required this.number,
    required this.controller,
    this.icon,
  }) : super(key: key);

  final String number;
  final TextEditingController controller;
  final IconData? icon;


 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.size16),
      child: ClipOval(
        child: Material(
          color: AppColor.textFieldBackgroundColor, // Button color
          child: InkWell(
            splashColor: Colors.grey, // Splash color
            onTap: () {
              if (icon != null) {
                if (controller.text.isNotEmpty) {
                  controller.text = controller.text.substring(0, controller.text.length - 1);
                }
              } else if (controller.text.length > 7) {
                return;
              } else if (number == ".") {
                if (controller.text.isEmpty) {
                  controller.text = "0.";
                } else if (double.tryParse("${controller.text}.") != null) {
                  controller.text = "${controller.text}.";
                }
              } else if (number == "0") {
                if (controller.text.isEmpty) {
                  controller.text = "0";
                } else if (controller.text.isNotEmpty && double.tryParse(controller.text) != null && double.tryParse(controller.text)! > 0) {
                  controller.text = "${controller.text}0";
                }
              } else {
                controller.text = "${controller.text}$number";
              }

              // Format the text with commas
              controller.text = CurrencyInputFormatter.numberWithCommas(controller.text);
            },
            child: Container(
              width: 64, // Adjust the size as needed
              height: 64, // Adjust the size as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.textFieldBackgroundColor,
              ),
              child: Center(
                child: icon == null
                    ? Text(
                        number,
                        style: AppTextStyle.regular(fontSize: AppSizes.size22),
                      )
                    : Icon(icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
