import 'package:intl/intl.dart';

final _decimalFormatter = NumberFormat.decimalPattern();
final _percentFormatter = NumberFormat('##0.##%');

extension DoubleFormatX on double {
  String get formatted => _decimalFormatter.format(this);

  String get asPercent => _percentFormatter.format(this);
}
