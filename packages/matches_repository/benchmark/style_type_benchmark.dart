import 'package:matches_repository/matches_repository.dart';

import 'matches.dart';

class StyleTypeBenchmark extends MatchesBenchmarkBase {
  StyleTypeBenchmark({super.seed, super.matchesCount})
    : super('StyleTypeBenchmark($seed, $matchesCount)');

  late final MatchesRepository matchesRepository;

  @override
  void setup() {
    matchesRepository = generateMatchesRepository(random, matchesCount);
  }

  @override
  void run() {
    matchesRepository.getStyleTypeStats();
  }
}
