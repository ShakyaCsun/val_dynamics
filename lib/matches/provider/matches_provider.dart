import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents/agents.dart';
import 'package:vsdat/matches_overview/matches_overview.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

part 'matches_provider.freezed.dart';
part 'matches_provider.g.dart';

@riverpod
MatchesRepository matchesRepository(Ref ref, {required String collectionId}) {
  final collection = ref.watch(
    matchesCollectionListProvider.select(
      (value) => value.firstWhereOrNull(
        (element) => element.collectionName == collectionId,
      ),
    ),
  );
  if (collection == null) {
    return MatchesRepository(matches: [], agentRoster: Agents([]));
  }
  final agentRoster = ref.watch(
    agentsProvider(rosterName: collection.rosterName),
  );
  return MatchesRepository(
    matches: collection.rawMatches,
    agentRoster: agentRoster,
    ignoredExceptionHandler: (exceptions) {
      final log = Logger('MatchesIgnoredExceptions($collectionId)');
      final teamSizeExceptionCount =
          exceptions.whereType<InvalidTeamSizeException>().length;
      if (teamSizeExceptionCount > 0) {
        log.warning(
          'Matches contain $teamSizeExceptionCount comps '
          'that do not have 5 agents.',
        );
      }
      for (final exception in exceptions.toSet()) {
        if (exception case InvalidTeamSizeException()) {
          log.info(exception.message);
          continue;
        }
        log.warning(exception.message, exception);
      }
    },
  );
}

@riverpod
Set<String> availableMaps(Ref ref, {required String collectionName}) {
  return ref.watch(
    matchesRepositoryProvider(
      collectionId: collectionName,
    ).select((state) => state.availableMaps),
  );
}

@riverpod
Set<String> selectedMaps(Ref ref, {required String collectionName}) {
  return ref.watch(
    matchesFilterProvider(
      collectionId: collectionName,
    ).select((state) => state.maps),
  );
}

@riverpod
class Matches extends _$Matches {
  @override
  ValorantMatches build({required String collectionId}) {
    final matchRepository = ref.watch(
      matchesRepositoryProvider(collectionId: collectionId),
    );
    final filters = ref.watch(
      matchesFilterProvider(collectionId: collectionId),
    );
    return matchRepository.getMatches(
      filter: filters.filter,
      maps: filters.maps,
    );
  }
}

@riverpod
class MatchesFilter extends _$MatchesFilter {
  @override
  MatchesFilterState build({required String collectionId}) {
    return const MatchesFilterState();
  }

  void changeMatchUpFilter(MatchUpFilter filter) {
    state = state.copyWith(filter: filter);
  }

  void toggleMap(String mapName) {
    if (state.maps.contains(mapName)) {
      state = state.copyWith(maps: state.maps.difference({mapName}));
    } else {
      state = state.copyWith(maps: state.maps.union({mapName}));
    }
  }
}

@freezed
abstract class MatchesFilterState with _$MatchesFilterState {
  const factory MatchesFilterState({
    @Default(MatchUpFilter.styles) MatchUpFilter filter,
    @Default({}) Set<String> maps,
  }) = _MatchesState;
}

extension ValorantMatchesExtension on ValorantMatches {
  Map<ValorantMatches, TernaryPoint> get plotData {
    final stylePointsMatches = groupedByStylePoints();
    return {
      for (final MapEntry(key: stylePoints, value: valMatches)
          in stylePointsMatches.entries)
        valMatches: stylePoints.ternaryPoint,
    };
  }
}
