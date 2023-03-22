
import 'package:super_ui_kit/super_ui_kit.dart';

extension DateTimeFormatting on DateTime {
  String formatCustom(String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }
}
