import "package:intl/intl.dart";

String durationToString(int minutes) {
  final d = Duration(minutes: minutes);
  final List<String> parts = d.toString().split(":");
  return '${parts[0].padLeft(2)}h ${parts[1].padLeft(2, '0')}m';
}

String dateToFormated(String dates) {
  final value = DateTime.parse(dates);
  final String date = DateFormat.yMMMd("en_US").format(value);
  return date;
}

String formatNumber(int number) {
  return NumberFormat.compact().format(number);
}
