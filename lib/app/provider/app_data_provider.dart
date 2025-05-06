import 'package:agents_repository/agents_repository.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/gen/gen.dart';

part 'app_data_provider.freezed.dart';
part 'app_data_provider.g.dart';

final _logger = Logger('AppDataLogger');

@riverpod
Map<String, Agents> bundledAgents(Ref ref) {
  return ref.watch(
    appDataNotifierProvider.select((state) => state.bundledAgents),
  );
}

@riverpod
Map<String, List<RawMatch>> bundledMatches(Ref ref) {
  return ref.watch(
    appDataNotifierProvider.select((state) => state.bundledMatches),
  );
}

@riverpod
(String message, bool isInitialized) appDataInitializationStatus(Ref ref) {
  return ref.watch(
    appDataNotifierProvider.select(
      (state) => (state.message, state.isInitialized),
    ),
  );
}

@riverpod
class AppDataNotifier extends _$AppDataNotifier {
  @override
  AppData build() {
    state = const AppData();
    initialize();
    return state;
  }

  Future<void> initialize() async {
    if (state.status == AppDataStatus.initial) {
      state = state.copyWith(
        status: AppDataStatus.loading,
        message: 'Loading assets',
      );
      final agentsCount = Assets.csv.agents.values.length;
      final bundledAgents = <String, Agents>{};
      final matchesCount = Assets.csv.matches.values.length;
      final bundledMatches = <String, List<RawMatch>>{};
      String loadingMessage(int loadedAgents, int loadedMatches) {
        if (loadedAgents + 1 < agentsCount) {
          return 'Loading ${loadedAgents + 1} of $agentsCount Agent Rosters';
        }
        if (loadedMatches + 1 < matchesCount) {
          return 'Loading ${loadedMatches + 1} of $matchesCount Matches';
        }
        return 'Loaded Successfully';
      }

      final erroredAgents = <String>[];
      final erroredMatches = <String>[];

      for (final (index, agentCsv) in Assets.csv.agents.values.indexed) {
        try {
          var keyName = agentCsv.split('/').last;
          if (agentCsv == Assets.csv.agents.agentRatings2023) {
            keyName = AgentsRepository.sd2_2023;
          }
          bundledAgents[keyName] = Agents.fromCsv(
            await rootBundle.loadString(agentCsv),
          );
        } on Exception catch (e, st) {
          _logger.severe('Failed to load agents from $agentCsv', e, st);
          erroredAgents.add(agentCsv);
        }
        state = state.copyWith(message: loadingMessage(index, 0));
      }
      for (final (index, matchesCsv) in Assets.csv.matches.values.indexed) {
        final matchesKey = matchesCsv.split('/').last;
        try {
          bundledMatches[matchesKey] = ValorantMatches.rawMatchesFrom(
            csv: await rootBundle.loadString(matchesCsv),
          );
        } on Exception catch (e, st) {
          _logger.severe('Failed to load matches from $matchesCsv', e, st);
          erroredMatches.add(matchesCsv);
        }
        state = state.copyWith(message: loadingMessage(agentsCount, index));
      }
      final (AppDataStatus status, String message) = switch ((
        erroredAgents.isEmpty,
        erroredMatches.isEmpty,
      )) {
        (true, true) => (
          AppDataStatus.completed,
          'App Data Loaded Successfully',
        ),
        (false, true) => (
          AppDataStatus.completedWithError,
          'Completed with error loading Agents(${erroredAgents.join(', ')})',
        ),
        (true, false) => (
          AppDataStatus.completedWithError,
          'Completed with error loading Matches(${erroredMatches.join(', ')})',
        ),
        (false, false) => (
          AppDataStatus.completedWithError,
          'Completed with error loading Agents(${erroredAgents.join(', ')}) '
              'and Matches(${erroredMatches.join(', ')})',
        ),
      };
      state = AppData(
        bundledAgents: bundledAgents,
        bundledMatches: bundledMatches,
        message: message,
        status: status,
      );
    }
  }
}

@freezed
abstract class AppData with _$AppData {
  const factory AppData({
    @Default({}) Map<String, Agents> bundledAgents,
    @Default({}) Map<String, List<RawMatch>> bundledMatches,
    @Default('Initializing') String message,
    @Default(AppDataStatus.initial) AppDataStatus status,
  }) = _AppData;
}

extension AppDataExtension on AppData {
  bool get isInitialized =>
      status == AppDataStatus.completed ||
      status == AppDataStatus.completedWithError;
}

enum AppDataStatus { initial, loading, completed, completedWithError }
