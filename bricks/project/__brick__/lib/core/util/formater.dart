// Package imports:
import 'package:intl/intl.dart';

class Formatter {
  static String formatPhoneNumber(String phone) {
    if (phone.length == 10) {
      return "0 (${phone.substring(0, 3)}) ${phone.substring(3, 6)} ${phone.substring(6, 8)} ${phone.substring(8, 10)}";
    } else {
      return phone;
    }
  }

  static String money(double? value, {String suffix = "TL"}) {
    return "${NumberFormat("#,###,###.##", "tr_TR").format(value ?? 0.0)} $suffix";
  }

  static String dateTime(DateTime date) {
    return DateFormat("dd/MM/yyyy - kk:mm:ss").format(date);
  }

  static String storeDateTime(DateTime date) {
    return DateFormat("dd.MM.yyyy", "tr_TR").format(date);
  }
}
