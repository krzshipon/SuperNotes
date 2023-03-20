import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String formatCustom(String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }
}
