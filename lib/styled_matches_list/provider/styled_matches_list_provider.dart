import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';

part 'styled_matches_list_provider.freezed.dart';
part 'styled_matches_list_provider.g.dart';

@riverpod
ValorantMatches styledMatchesList(
  Ref ref, {
  required String collectionId,
  required StylePoints acm,
}) {
  return ref.watch(
    matchesProvider(
      collectionId: collectionId,
    ).select((value) => value.matchesByStyle[acm] ?? ValorantMatches([])),
  );
}

@riverpod
List<(StyledMatchesSummaryData, ValorantMatches)> styledMatchesDataList(
  Ref ref, {
  required String collectionId,
  required StylePoints acm,
}) {
  final matches = ref.watch(
    styledMatchesListProvider(acm: acm, collectionId: collectionId),
  );
  final groupedMatches = matches.fold(<StylePoints, List<ValorantMatch>>{}, (
    resultMap,
    match,
  ) {
    resultMap.update(
      match.stylePoints2,
      (value) => [...value, match],
      ifAbsent: () => [match],
    );
    return resultMap;
  });
  return groupedMatches.entries
      .map<(StyledMatchesSummaryData, ValorantMatches)>((entry) {
        final MapEntry(key: opponentAcm, value: matchList) = entry;
        final valMatches = ValorantMatches(matchList);
        final summary = MatchesSummary.fromMatches(valMatches);
        return (
          StyledMatchesSummaryData(
            acm: acm,
            opponentAcm: opponentAcm,
            summary: summary,
          ),
          valMatches,
        );
      })
      .sorted((a, b) {
        final (
          StyledMatchesSummaryData(
            acm: _,
            opponentAcm: _,
            summary: MatchesSummary(
              matchesCount: matchesCount,
              scoreOne: score,
            ),
          ),
          _,
        ) = a;
        final (
          StyledMatchesSummaryData(
            acm: _,
            opponentAcm: _,
            summary: MatchesSummary(
              matchesCount: otherMatchesCount,
              scoreOne: otherScore,
            ),
          ),
          _,
        ) = b;
        if (matchesCount == otherMatchesCount) {
          return otherScore.compareTo(score);
        }
        return otherMatchesCount.compareTo(matchesCount);
      });
}

@freezed
sealed class StyledMatchesSummaryData with _$StyledMatchesSummaryData {
  const factory StyledMatchesSummaryData({
    required StylePoints acm,
    required StylePoints opponentAcm,
    required MatchesSummary summary,
  }) = _StyledMatchesSummaryData;
}
