import 'package:valorant_agents/valorant_agents.dart';

import 'matches.dart';

class SumScoreBenchmark extends MatchesBenchmarkBase {
  SumScoreBenchmark({super.seed, super.matchesCount})
    : super('SumScoreBenchmark($seed, $matchesCount)');

  late final ValorantMatches matches;

  @override
  void setup() {
    matches = generateMatchesRepository(random, matchesCount).matches;
  }

  @override
  void run() {
    matches.fold(Score.zero, (score, match) {
      return score + match.scoreOne;
    });
  }
}

class SumScoreTupleBenchmark extends MatchesBenchmarkBase {
  SumScoreTupleBenchmark({super.seed, super.matchesCount})
    : super('SumScoreTupleBenchmark($seed, $matchesCount)');

  late final ValorantMatches matches;

  @override
  void setup() {
    matches = generateMatchesRepository(random, matchesCount).matches;
  }

  @override
  void run() {
    matches.fold((0, 0), (score, match) {
      return score + match.scoreOne.tuple;
    }).toScore;
  }
}
