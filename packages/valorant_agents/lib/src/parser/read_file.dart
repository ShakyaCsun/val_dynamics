import 'dart:io';

import 'package:valorant_agents/valorant_agents.dart';

/// Reads the contents of a [File] at [path] as [String].
///
/// Throws [IncorrectFilePathException]
Future<String> readFile(String path) async {
  late final String csv;
  try {
    csv = await File(path).readAsString();
  } on Exception {
    throw IncorrectFilePathException(path);
  }
  return csv;
}
