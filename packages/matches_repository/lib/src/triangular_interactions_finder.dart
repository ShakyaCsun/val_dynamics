import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:valorant_agents/valorant_agents.dart';

extension TriangularInteractionsFinder on ValorantMatches {
  Map<StyleTriplet, (Score aVsB, Score bVsC, Score cVsA)>
  getTriangularInteractions({
    double winRate = 0.5,
    int minRounds = 0,
    Map<(StylePoints, StylePoints), ValorantMatches>? clashMap,
  }) {
    assert(
      winRate >= 0.5 && winRate <= 1,
      'Win rate should be in range 0.5 to 1 inclusively',
    );

    @pragma('vm:prefer-inline')
    bool isValidScore(ScoreData scoreData) {
      final (stylePoints: _, :score) = scoreData;
      return score.winRate >= winRate && score.played >= minRounds;
    }

    final styleClashMatches = clashMap ?? groupMatchesByStylisticClash();
    final winsGraph = WinsGraph();
    for (final MapEntry(key: (styleOne, styleTwo), value: matches)
        in styleClashMatches.entries) {
      final score = matches.collectTeamOneScore();
      switch (score.scoreType) {
        case ScoreType.veryPositive || ScoreType.positive:
          final scoreData = (stylePoints: styleTwo, score: score);
          if (isValidScore(scoreData)) {
            winsGraph.update(
              styleOne,
              (value) => [...value, scoreData],
              ifAbsent: () => [scoreData],
            );
          }
        case ScoreType.negative || ScoreType.veryNegative:
          final scoreData = (stylePoints: styleOne, score: score.reversed);
          if (isValidScore(scoreData)) {
            winsGraph.update(
              styleTwo,
              (value) => [...value, scoreData],
              ifAbsent: () => [scoreData],
            );
          }
        case ScoreType.tied:
          break;
      }
    }
    final triplets = HashSet<StyleTriplet>(
      equals: (a, b) => a.equivalentTo(b),
      hashCode: (triplet) => triplet.equivalentHash(),
    );
    final interactionsMap =
        <StyleTriplet, (Score aVsB, Score bVsC, Score cVsA)>{};
    for (final MapEntry(key: a, value: aScoreData) in winsGraph.entries) {
      for (final (stylePoints: b, score: aVsB) in aScoreData) {
        for (final (stylePoints: c, score: bVsC) in winsGraph.getScores(b)) {
          if (winsGraph
                  .getScores(c)
                  .firstWhereOrNull((element) => element.stylePoints == a)
              case final cVsAScore?) {
            final styleTriplet = StyleTriplet(a, b, c);
            if (triplets.add(styleTriplet)) {
              interactionsMap[styleTriplet] = (aVsB, bVsC, cVsAScore.score);
            }
          }
        }
      }
    }
    return interactionsMap;
  }
}

typedef ScoreData = ({StylePoints stylePoints, Score score});
typedef WinsGraph = Map<StylePoints, List<ScoreData>>;

extension on WinsGraph {
  List<ScoreData> getScores(StylePoints style) {
    return this[style] ?? const <ScoreData>[];
  }
}
