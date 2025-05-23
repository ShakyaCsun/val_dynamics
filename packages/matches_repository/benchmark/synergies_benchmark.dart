// Benchmark file, only using in console environment
// ignore_for_file: avoid_print

import 'package:collection/collection.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

import 'matches.dart';

class SynergiesBenchmark extends MatchesBenchmarkBase {
  SynergiesBenchmark({super.seed, super.matchesCount})
    : super('SynergiesBenchmark($seed, $matchesCount)');

  late final MatchesRepository matchesRepository;
  late final int numberOfMaps;

  @override
  void setup() {
    matchesRepository = generateMatchesRepository(random, matchesCount);
    numberOfMaps = matchesRepository.availableMaps.length;
  }

  @override
  void run() {
    for (var i = 0; i < numberOfMaps * 4; i++) {
      final criteria = random.nextBool()
          ? ComboCriteria.composite
          : ComboCriteria.solo;
      final maps = matchesRepository.availableMaps
          .sample(random.nextInt(numberOfMaps), random)
          .toSet();
      matchesRepository.getAllComboSynergies(criteria: criteria, maps: maps);
    }
  }

  @override
  void exercise() {
    run();
  }
}

class FirstLoadSynergiesBenchmark extends MatchesBenchmarkBase {
  FirstLoadSynergiesBenchmark({super.seed, super.matchesCount})
    : super('FirstLoadSynergiesBenchmark($seed, $matchesCount)');

  late final List<RawMatch> rawMatches;

  @override
  void setup() {
    rawMatches = generateRawMatches(random, matchesCount);
  }

  @override
  void run() {
    MatchesRepository(matches: rawMatches, agentRoster: Agents.defaultRoster)
      ..getAllComboSynergies()
      ..getAllComboSynergies(criteria: ComboCriteria.solo);
  }

  @override
  void exercise() {
    run();
  }
}
