import 'dart:convert';

import 'package:csv/csv.dart';

const _converter = CsvToListConverter(shouldParseNumbers: false);

List<List<String>> readCsv(String csv) {
  return _converter.convert<String>(csv);
}

(List<String> headers, List<List<String>> rows) readCsvWithHeaders(String csv) {
  final lines = const LineSplitter().convert(csv);
  final headers = readCsv(lines.first);
  final rows = readCsv(
    lines.skip(1).join('\r\n'),
  );
  return (headers[0], rows);
}

String writeCsv(List<List<String>> rows) {
  return const ListToCsvConverter().convert(rows);
}
