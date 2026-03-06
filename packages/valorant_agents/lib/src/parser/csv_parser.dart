import 'package:csv/csv.dart';

const _decoder = StringCsvDecoder();
const _encoder = CsvEncoder();

List<List<String>> readCsv(String csv) {
  return _decoder.convert(csv);
}

(List<String> headers, List<List<String>> rows) readCsvWithHeaders(String csv) {
  final [headers, ...rows] = readCsv(csv);
  return (headers, rows);
}

String writeCsv(List<List<String>> rows) {
  return _encoder.convert(rows);
}
