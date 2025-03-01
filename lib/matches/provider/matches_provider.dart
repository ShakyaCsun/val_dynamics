import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents/agents.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat/matches_overview/matches_overview.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

part 'matches_provider.freezed.dart';
part 'matches_provider.g.dart';

@riverpod
Set<String> availableMaps(Ref ref, {required String collectionName}) {
  return ref.watch(
    matchesProvider(
      collectionId: collectionName,
    ).select((state) => state.allMaps),
  );
}

@riverpod
Set<String> selectedMaps(Ref ref, {required String collectionName}) {
  return ref.watch(
    matchesProvider(collectionId: collectionName).select((state) => state.maps),
  );
}

@riverpod
class Matches extends _$Matches {
  @override
  MatchesState build({required String collectionId}) {
    final collection = ref.watch(
      matchesCollectionListProvider.select(
        (value) => value.firstWhereOrNull(
          (element) => element.collectionName == collectionId,
        ),
      ),
    );
    if (collection == null) {
      return MatchesState.empty();
    }
    final agents = ref.watch(agentsProvider(rosterName: collection.rosterName));
    final agentsMap = agents.nameMap;
    return MatchesState(
      matches: ValorantMatches.fromRawMatches(
        collection.rawMatches,
        agentsMap: agentsMap,
        ignoreTeamParserExceptions: true,
      ),
    );
  }

  void changeMatchUpFilter(MatchUpFilter filter) {
    state = state.copyWith(filter: filter);
  }

  void changeMaps(String mapName) {
    if (state.maps.contains(mapName)) {
      state = state.copyWith(maps: state.maps.difference({mapName}));
    } else {
      state = state.copyWith(maps: state.maps.union({mapName}));
    }
  }
}

enum MatchUpFilter {
  /// Exclude matches where both teams have same [StylePoints]
  styles,

  /// Only exclude matches if both teams have same [AgentComp]
  composition,

  /// Include all the matches
  none,
}

@freezed
abstract class MatchesState with _$MatchesState {
  const factory MatchesState({
    required ValorantMatches matches,
    @Default(MatchUpFilter.styles) MatchUpFilter filter,
    @Default({}) Set<String> maps,
  }) = _MatchesState;

  const MatchesState._();

  factory MatchesState.empty() => MatchesState(matches: ValorantMatches([]));

  Set<String> get allMaps => {for (final match in matches) match.mapName};

  bool get isEmpty => this == MatchesState.empty();

  ValorantMatches get filteredMatches {
    final matchList = [...matches.filterMaps(maps)]..removeWhere((match) {
      switch (filter) {
        case MatchUpFilter.styles:
          return match.isMirrorStyle;
        case MatchUpFilter.composition:
          return match.isMirrorComp;
        case MatchUpFilter.none:
          return false;
      }
    });
    return ValorantMatches(matchList);
  }

  Map<StylePoints, ValorantMatches> get matchesByStyle {
    return filteredMatches.fold(<StylePoints, ValorantMatches>{}, (
      matchesGroup,
      match,
    ) {
      final stylePoints1 = match.stylePoints1;
      final stylePoints2 = match.stylePoints2;
      matchesGroup
        ..update(
          stylePoints1,
          (value) => ValorantMatches([...value, match]),
          ifAbsent: () => ValorantMatches([match]),
        )
        ..update(
          stylePoints2,
          (value) => ValorantMatches([...value, match.switchTeams()]),
          ifAbsent: () => ValorantMatches([match.switchTeams()]),
        );
      return matchesGroup;
    });
  }

  Map<ValorantMatches, TernaryPoint> get plotData {
    final stylePointsMatches = matchesByStyle;
    return {
      for (final MapEntry(key: stylePoints, value: valMatches)
          in stylePointsMatches.entries)
        valMatches: stylePoints.ternaryPoint,
    };
  }
}

extension ValorantMatchesExtension on ValorantMatches {
  ValorantMatches filterMaps(Set<String> maps) {
    if (maps.isEmpty) {
      return this;
    }
    return ValorantMatches(
      [...this]..retainWhere((match) => maps.contains(match.mapName)),
    );
  }
}
