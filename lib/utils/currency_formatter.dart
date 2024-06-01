import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      // Don't allow the user to delete the leading digits
      return newValue.copyWith(
        text: newValue.text,
        selection: TextSelection.collapsed(offset: newValue.text.length + 1),
      );
    }

    // Remove any non-numeric characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Add commas to format the number
    final formattedValue =
        NumberFormat("#,##0", "en_US").format(int.parse(newText));

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length + 1),
    );
  }

  static String getRawValue(String formattedValue) {
    return formattedValue.replaceAll(RegExp(r'[^\d]'), '');
  }

    // Function to format the number with commas
  static String numberWithCommas(String number) {
    if (number.isEmpty) {
      return "";
    }
    final numberFormatter = NumberFormat("#,###");
    final num parsedNumber = num.tryParse(number.replaceAll(',', '')) ?? 0;
    return numberFormatter.format(parsedNumber);
  }

}