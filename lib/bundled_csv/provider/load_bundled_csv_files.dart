import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'load_bundled_csv_files.g.dart';

@riverpod
Map<String, Agents> bundledAgentsCsvs(Ref ref) {
  throw UnimplementedError();
}

@riverpod
Map<String, List<RawMatch>> bundledMatchesCsvs(Ref ref) {
  throw UnimplementedError();
}
