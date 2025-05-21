import 'package:intl/intl.dart';

extension StringExt on String {
  String formatDateTime() {
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(this);
    return DateFormat("d MMMM yyyy").format(tempDate);
  }
}
