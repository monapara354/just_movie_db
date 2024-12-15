import "package:intl/intl.dart";

extension DateExtension on DateTime {
  String dateToString(String pattern) {
    try {
      return DateFormat(pattern).format(this);
    } catch (e) {
      return "";
    }
  }
}
