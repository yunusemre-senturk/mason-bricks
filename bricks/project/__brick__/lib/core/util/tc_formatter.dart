import 'package:flutter/services.dart';

class TCNoFormater extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (double.tryParse(newValue.text) != null) {
      if (newValue.text.length == 1 && newValue.text.split("").first != "0") {
        return newValue;
      } else if (newValue.text.length > 1 &&
          newValue.text.length < 11 &&
          newValue.text.split("").first != "0") {
        return newValue;
      } else if (newValue.text.length == 11 &&
          ["0", "2", "4", "6", "8"].contains(newValue.text.split("").last) &&
          newValue.text.split("").first != "0") {
        return newValue;
      } else {
        return oldValue;
      }
    }
    if (newValue.text == "") {
      return newValue;
    }
    return oldValue;
  }
}
