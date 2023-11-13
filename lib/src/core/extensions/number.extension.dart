import 'package:intl/intl.dart';

extension NumberExtension on int {
  String format() {
    NumberFormat numberFormat = NumberFormat('#,##0', 'en_US');
    return numberFormat.format(this);
  }
}