import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'matches_ternary_data.freezed.dart';

@freezed
abstract class MatchesTernaryData with _$MatchesTernaryData {
  const factory MatchesTernaryData({
    required StylePoints stylePoints,
    required int matchesCount,
    required Score score,
    required Score attackScore,
    required Score defenseScore,
    required Set<AgentComp> compositions,
    required Set<AgentComp> oppositionCompositions,
  }) = _MatchesTernaryData;

  factory MatchesTernaryData.from(ValorantMatch match) {
    return MatchesTernaryData(
      stylePoints: match.stylePoints1,
      matchesCount: 1,
      score: match.scoreOne,
      attackScore: match.attackingScore1,
      defenseScore: match.defendingScore1,
      compositions: {match.teamOne.agents},
      oppositionCompositions: {match.teamTwo.agents},
    );
  }

  factory MatchesTernaryData.fromMatches(ValorantMatches matches) {
    final (
      score,
      attackScore,
      defenseScore,
      compositions,
      oppositionCompositions,
    ) = matches.fold(
      (Score.zero, Score.zero, Score.zero, <AgentComp>{}, <AgentComp>{}),
      (previousValue, element) {
        final (
          score,
          attackScore,
          defenseScore,
          compositions,
          oppositionCompositions,
        ) = previousValue;
        return (
          score + element.scoreOne,
          attackScore + element.attackingScore1,
          defenseScore + element.defendingScore1,
          {...compositions, element.teamOne.agents},
          {...oppositionCompositions, element.teamTwo.agents},
        );
      },
    );
    return MatchesTernaryData(
      stylePoints: matches.first.stylePoints1,
      matchesCount: matches.length,
      score: score,
      attackScore: attackScore,
      defenseScore: defenseScore,
      compositions: compositions,
      oppositionCompositions: oppositionCompositions,
    );
  }
  const MatchesTernaryData._();

  // final StylePoints stylePoints;
  // final int matchesCount;
  // final Score score;
  // final Score attackScore;
  // final Score defenseScore;
  // final Set<AgentComp> compositions;
  // final Set<AgentComp> oppositionCompositions;

  MatchesTernaryData addMatch(ValorantMatch match) {
    return MatchesTernaryData(
      stylePoints: stylePoints,
      matchesCount: matchesCount + 1,
      score: score + match.scoreOne,
      attackScore: attackScore + match.attackingScore1,
      defenseScore: defenseScore + match.defendingScore1,
      compositions: {...compositions, match.teamOne.agents},
      oppositionCompositions: {...oppositionCompositions, match.teamTwo.agents},
    );
  }

  // @override
  // List<Object> get props {
  //   return [
  //     stylePoints,
  //     matchesCount,
  //     score,
  //     attackScore,
  //     defenseScore,
  //     compositions,
  //     oppositionCompositions,
  //   ];
  // }
}
