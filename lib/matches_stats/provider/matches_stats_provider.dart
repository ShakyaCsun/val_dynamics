import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/matches/matches.dart';

part 'matches_stats_provider.freezed.dart';
part 'matches_stats_provider.g.dart';

@riverpod
class MatchesStats extends _$MatchesStats {
  @override
  List<StyledMatchesStat> build({required String collectionId}) {
    final groupedMatches = ref.watch(
      matchesProvider(
        collectionId: collectionId,
      ).select((state) => state.filteredMatches.groupMatchesByStylisticClash()),
    );
    return groupedMatches.entries
        .map<StyledMatchesStat>((entry) {
          final MapEntry(key: (styleOne, styleTwo), value: matches) = entry;
          final summary = MatchesSummary.fromMatches(matches);
          if (summary.scoreOne.won < summary.scoreOne.lost) {
            return (
              styleOne: styleTwo,
              styleTwo: styleOne,
              summary: summary.swap(),
            );
          }
          return (styleOne: styleOne, styleTwo: styleTwo, summary: summary);
        })
        .sorted((a, b) {
          final (
            styleOne: _,
            styleTwo: _,
            summary: MatchesSummary(scoreOne: scoreA, matchesCount: aMatches),
          ) = a;
          final (
            styleOne: _,
            styleTwo: _,
            summary: MatchesSummary(scoreOne: scoreB, matchesCount: bMatches),
          ) = b;
          if (aMatches == bMatches) {
            return scoreB.compareTo(scoreA);
          }
          return bMatches.compareTo(aMatches);
        });
  }
}

typedef StyledMatchesStat =
    ({StylePoints styleOne, StylePoints styleTwo, MatchesSummary summary});

@freezed
abstract class MatchesSummary with _$MatchesSummary {
  const factory MatchesSummary({
    required int matchesCount,
    required Score scoreOne,
    required Score attackScoreOne,
    required Set<AgentComp> compsOne,
    required Set<AgentComp> compsTwo,
  }) = _MatchesSummary;

  const MatchesSummary._();

  factory MatchesSummary.fromMatches(ValorantMatches matches) {
    var scoreOne = Score.zero;
    var attackScoreOne = Score.zero;
    final compsOne = <AgentComp>{};
    final compsTwo = <AgentComp>{};
    for (final match in matches) {
      scoreOne += match.scoreOne;
      attackScoreOne += match.attackingScore1;
      compsOne.add(match.teamOne.agents);
      compsTwo.add(match.teamTwo.agents);
    }
    return MatchesSummary(
      matchesCount: matches.length,
      scoreOne: scoreOne,
      attackScoreOne: attackScoreOne,
      compsOne: compsOne,
      compsTwo: compsTwo,
    );
  }

  MatchesSummary swap() {
    return MatchesSummary(
      matchesCount: matchesCount,
      scoreOne: scoreTwo,
      attackScoreOne: defenseScoreOne.reverse(),
      compsOne: compsTwo,
      compsTwo: compsOne,
    );
  }

  String get description {
    final score = '${scoreOne.winLoss} ${scoreOne.winRatePercent}';
    final compsCount = compsOne.length;
    final opponentCompsCount = compsTwo.length;
    return 'Style 1 with $compsCount comps has a win rate of $score over Style '
        '2 with $opponentCompsCount different comps over $matchesCount matches';
  }

  Score get defenseScoreOne => scoreOne - attackScoreOne;
  Score get scoreTwo => scoreOne.reverse();
}
