import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

class MatchesSummary extends Equatable implements Comparable<MatchesSummary> {
  MatchesSummary._({
    required this.count,
    required this.mapScore,
    required this.score,
    required this.attackScore,
    required AgentCompMap<int> oneComps,
    required AgentCompMap<int> twoComps,
    this.isMirroredData = false,
  }) : defenseScore = score - attackScore,
       compPicksOne = oneComps.sorted,
       compPicksTwo = twoComps.sorted;

  factory MatchesSummary.fromMatches(Iterable<ValorantMatch> matches) {
    var mapScore = (0, 0);
    var score = (0, 0);
    var attackScore = (0, 0);
    final oneComps = AgentCompMap<int>();
    final twoComps = AgentCompMap<int>();
    for (final ValorantMatch(
          :attackingScore1,
          :scoreOne,
          :resultOne,
          agentComps: (:compOne, :compTwo),
        )
        in matches) {
      mapScore += resultOne.tuple;
      score += scoreOne.tuple;
      attackScore += attackingScore1.tuple;
      oneComps.update(compOne, (count) => count + 1, ifAbsent: () => 1);
      twoComps.update(compTwo, (count) => count + 1, ifAbsent: () => 1);
    }
    return MatchesSummary._(
      count: matches.length,
      mapScore: mapScore.toScore,
      score: score.toScore,
      attackScore: attackScore.toScore,
      oneComps: oneComps,
      twoComps: twoComps,
    );
  }

  factory MatchesSummary.fromMirrorMatches(Iterable<ValorantMatch> matches) {
    final oneComps = AgentCompMap<int>();
    for (final ValorantMatch(agentComps: (:compOne, :compTwo)) in matches) {
      oneComps
        ..update(compOne, (count) => count + 1, ifAbsent: () => 1)
        ..update(compTwo, (count) => count + 1, ifAbsent: () => 1);
    }
    return MatchesSummary._(
      count: matches.length,
      mapScore: Score.zero,
      score: Score.zero,
      attackScore: Score.zero,
      oneComps: oneComps,
      twoComps: oneComps,
      isMirroredData: true,
    );
  }

  factory MatchesSummary.calculate(
    Iterable<ValorantMatch> matches, {
    bool isMirror = false,
  }) {
    return isMirror
        ? MatchesSummary.fromMirrorMatches(matches)
        : MatchesSummary.fromMatches(matches);
  }

  final int count;
  final Score mapScore;
  final Score score;
  final Score attackScore;
  final Score defenseScore;
  final AgentCompMap<int> compPicksOne;
  final AgentCompMap<int> compPicksTwo;
  final bool isMirroredData;

  AgentComp get compOne => compPicksOne.mostPlayed;
  AgentComp get compTwo => compPicksTwo.mostPlayed;

  MatchesSummary get reversed {
    return MatchesSummary._(
      count: count,
      mapScore: mapScore.reversed,
      score: score.reversed,
      attackScore: defenseScore.reversed,
      oneComps: compPicksTwo,
      twoComps: compPicksOne,
    );
  }

  @override
  List<Object> get props => [
    count,
    score,
    mapScore,
    attackScore,
    compPicksOne,
    compPicksTwo,
    isMirroredData,
  ];

  @override
  int compareTo(MatchesSummary other) {
    final MatchesSummary(
      count: otherCount,
      score: otherScore,
      mapScore: otherMapScore,
    ) = other;
    if (count != otherCount) {
      return count.compareTo(otherCount);
    }
    if (mapScore != otherMapScore) {
      return mapScore.compareTo(otherMapScore);
    }
    return score.compareTo(otherScore);
  }
}

extension on AgentCompMap<int> {
  AgentCompMap<int> get sorted => AgentCompMap.fromEntries(
    entries.sortedByCompare(
      (element) => element.value,
      (a, b) => b.compareTo(a),
    ),
  );

  AgentComp get mostPlayed {
    assert(
      sorted.keys.first == keys.first,
      'AgentCompMap should have previously been sorted to call mostPlayed',
    );
    return keys.first;
  }
}
