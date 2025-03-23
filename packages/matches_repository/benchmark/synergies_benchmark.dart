// Benchmark file, only using in console environment
// ignore_for_file: avoid_print

import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:collection/collection.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

import 'matches.dart';

class SynergiesBenchmark extends BenchmarkBase {
  SynergiesBenchmark([int seed = 65780])
    : random = Random(seed),
      super('SynergiesBenchmark($seed)');

  final Random random;

  static void main() {
    SynergiesBenchmark().report();
    SynergiesBenchmark(42504).report();
  }

  late final MatchesRepository matchesRepository;
  late final int numberOfMaps;

  @override
  void setup() {
    matchesRepository = generateMatchesRepository(random);
    numberOfMaps = matchesRepository.availableMaps.length;
  }

  @override
  void run() {
    for (var i = 0; i < 10; i++) {
      final criteria =
          random.nextBool() ? ComboCriteria.composite : ComboCriteria.solo;
      final maps =
          matchesRepository.availableMaps
              .sample(random.nextInt(numberOfMaps), random)
              .toSet();
      matchesRepository.getAllComboSynergies(criteria: criteria, maps: maps);
    }
  }
}

class FirstLoadSynergiesBenchmark extends BenchmarkBase {
  FirstLoadSynergiesBenchmark({int seed = 65780, this.matchesCount = 1000})
    : random = Random(seed),
      super('FirstLoadSynergiesBenchmark($seed, $matchesCount)');

  final Random random;
  final int matchesCount;

  static void main() {
    FirstLoadSynergiesBenchmark().report();
    FirstLoadSynergiesBenchmark(seed: 42504, matchesCount: 20000).report();
  }

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
