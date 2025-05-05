import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

part 'styled_matches_provider.freezed.dart';
part 'styled_matches_provider.g.dart';

@riverpod
class StyledMatches extends _$StyledMatches {
  @override
  StyledMatchesState build({
    required String collectionId,
    required StylePoints acm,
  }) {
    final styledMatches = ref.watch(
      matchesProvider(
        collectionId: collectionId,
      ).select((value) => value.groupedByStylePoints()[acm]),
    );
    if (styledMatches == null) {
      return StyledMatchesState.empty(acm: acm);
    }
    return StyledMatchesState(matches: styledMatches, acm: acm);
  }
}

@freezed
abstract class StyledMatchesState with _$StyledMatchesState {
  const factory StyledMatchesState({
    required ValorantMatches matches,
    required StylePoints acm,
  }) = _StyledMatchesState;

  const StyledMatchesState._();

  factory StyledMatchesState.empty({required StylePoints acm}) {
    return StyledMatchesState(matches: ValorantMatches([]), acm: acm);
  }

  Set<AgentComp> get comps {
    return {
      ...matches
          .map((e) => e.teamOne.agents)
          .sortedBy((element) => element.groupedAgentNames),
    };
  }

  Map<ValorantMatches, TernaryPoint> get plotData {
    final collectStyleMatchUps = matches.fold(
      <StylePoints, List<ValorantMatch>>{},
      (previousValue, match) {
        previousValue.update(
          match.stylePoints2,
          (value) => [...value, match],
          ifAbsent: () => [match],
        );
        return previousValue;
      },
    );

    return {
      for (final MapEntry(key: stylePoints, value: matchList)
          in collectStyleMatchUps.entries)
        ValorantMatches(matchList): stylePoints.ternaryPoint,
      if (!collectStyleMatchUps.containsKey(acm))
        ValorantMatches([]): acm.ternaryPoint,
    };
  }
}
