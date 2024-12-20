import 'package:valorant_agents/valorant_agents.dart';

extension type AcmString._(String value) implements String {
  factory AcmString(String value) {
    final errorMessage =
        '$value is not a valid AcmString. '
        'The valid format for AcmString is A-C-M '
        'where A, C, and M are positive doubles';
    switch (value.split('-')) {
      case [final a, final c, final m]:
        try {
          parseDouble(a);
          parseDouble(c);
          parseDouble(m);
        } on InvalidFormatException {
          throw InvalidFormatException(errorMessage);
        }
      default:
        throw InvalidFormatException(errorMessage);
    }
    return AcmString._(value);
  }

  factory AcmString.fromStyles(StylePoints points) {
    return AcmString('${points.A}-${points.C}-${points.M}');
  }

  StylePoints get stylePoints {
    final [a, c, m] = value.split('-');
    return (
      aggro: parseDouble(a),
      control: parseDouble(c),
      midrange: parseDouble(m),
    );
  }
}
