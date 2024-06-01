import 'package:flutter/material.dart';
import 'package:ui_elements/amount/num_button.dart';
import 'package:ui_elements/colors.dart';
import 'package:ui_elements/constants.dart';
import 'package:ui_elements/utils/utils.dart';

import '../button/button.dart';
import '../sizes.dart';
import '../text_styles.dart';

/// A screen that allows users to input and edit an amount.
///
/// This widget is customizable with various parameters such as [title], [name], [uuid],
/// [popOnProceed], [scaffoldBackgroundColor], and [proceedButtonTitle].
/// The [controller] is used to manage the input text, and the [onProceed] callback is called
/// when the proceed button is pressed.
class EditAmountScreen extends StatefulWidget {
  final String title;
  final String? name, uuid;
  final bool popOnProceed;
  final TextEditingController controller = TextEditingController();
  final void Function(double?) onProceed;
  final Color? scaffoldBackgroundColor;
  final String proceedButtonTitle;

  /// Creates an [EditAmountScreen].
  ///
  /// [title] is the screen title, [name] and [uuid] are optional parameters to display additional
  /// information, [popOnProceed] determines if the screen should pop on proceed, [onProceed] is the
  /// callback when the proceed button is pressed, [scaffoldBackgroundColor] sets the background color
  /// of the scaffold, and [proceedButtonTitle] sets the title of the proceed button.
  EditAmountScreen({
    super.key,
    this.title = "Enter Amount",
    this.name,
    this.uuid,
    this.popOnProceed = false,
    required this.onProceed,
    this.scaffoldBackgroundColor = AppColor.whiteColor,
    this.proceedButtonTitle = "Proceed"
  });

  @override
  State<StatefulWidget> createState() {
    return _EditAmountState();
  }
}

class _EditAmountState extends State<EditAmountScreen> {
  // List of numbers and symbols for the numeric keypad
  List<String> numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryTextColor),
        ),
        title: Text(widget.title, style: AppTextStyle.semiBold(fontSize: AppSizes.size20, color: AppColor.primaryTextColor)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.size20, vertical: AppSizes.size24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.name != null)
              Text(
                widget.name!,
                style: AppTextStyle.regular(fontSize: AppSizes.size16, color: AppColor.subtitleTextColor),
              ),
            if (widget.uuid != null)
              Text(
                "UUID: ${widget.uuid}",
                style: AppTextStyle.regular(fontSize: AppSizes.size16, color: AppColor.subtitleTextColor),
              ),
            const SizedBox(height: AppSizes.size8),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: AppSizes.size8, horizontal: AppSizes.size10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppDimensionsConstants.deafultBorderRadius)),
                color: AppColor.textFieldBackgroundColor,
              ),
              child: TextFormField(
                controller: widget.controller,
                readOnly: true,
                textAlign: TextAlign.center,
                style: AppTextStyle.semiBold(fontSize: AppSizes.size38),
                decoration: const InputDecoration(hintText: "0", border: InputBorder.none),
              ),
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              children: numbers.map((String number) {
                return NumButton(
                  controller: widget.controller,
                  number: number,
                );
              }).toList()
                ..add(
                  NumButton(
                    controller: widget.controller,
                    icon: Icons.backspace_outlined,
                    number: "",
                  ),
                ),
            ),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: widget.controller,
              builder: (context, value,child) {
                return AppButton.primary(
                  isDisabled: value.text == "0" || value.text.isEmpty,
                  onPressed: () {
                    widget.onProceed.call(double.tryParse(CurrencyInputFormatter.getRawValue(widget.controller.text)));
                    if (widget.popOnProceed) {
                      Navigator.of(context).pop();
                    }
                  },
                  title: widget.proceedButtonTitle,
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
