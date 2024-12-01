import 'package:intl/intl.dart';

extension DoubleFormatX on double {
  String get formatted => NumberFormat.decimalPattern().format(this);
  String get asPercent => NumberFormat('##0.##%').format(this);
}
