import 'package:valorant_agents/valorant_agents.dart';

double parseDouble(String a) {
  try {
    return double.parse(a);
  } on FormatException {
    throw InvalidFormatException('$a is not a valid number');
  }
}

int parseInt(String a) {
  try {
    return int.parse(a);
  } on FormatException {
    throw InvalidFormatException('$a is not a valid Integer number');
  }
}
