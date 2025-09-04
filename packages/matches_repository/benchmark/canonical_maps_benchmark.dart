import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:collection/collection.dart';
import 'package:valorant_agents/valorant_agents.dart';

import 'matches.dart';

typedef CanonicalMap<T> = CanonicalizedMap<String, T, int>;

class MapCreationBenchmark<T> extends BenchmarkBase {
  MapCreationBenchmark({
    required this.mapType,
    required this.createEmptyMap,
    required this.getRandom,
    this.iterationCount = 100_000,
    int seed = 42,
  }) : random = Random(seed),
       super('$mapType MapCreationBenchmark($seed)'.lengthen());

  final String mapType;
  final Random random;
  final Map<T, int> Function() createEmptyMap;
  final T Function(Random random) getRandom;
  final int iterationCount;

  static void main() {
    // Agent Maps Comparison
    MapCreationBenchmark<Agent>(
      mapType: 'Normal Agent',
      createEmptyMap: () => <Agent, int>{},
      getRandom: _randomAgent,
    ).report();
    MapCreationBenchmark<Agent>(
      mapType: 'Canonicalized Agent',
      createEmptyMap: AgentMap<int>.new,
      getRandom: _randomAgent,
    ).report();

    // AgentCombo Maps Comparison
    MapCreationBenchmark<(Agent, Agent)>(
      mapType: 'Normal AgentCombo',
      createEmptyMap: () => <(Agent, Agent), int>{},
      getRandom: (random) => (_randomAgent(random), _randomAgent(random)),
    ).report();
    MapCreationBenchmark<(Agent, Agent)>(
      mapType: 'Canonicalized AgentCombo',
      createEmptyMap: () =>
          CanonicalMap<(Agent, Agent)>((key) => key.comboName),
      getRandom: (random) => (_randomAgent(random), _randomAgent(random)),
    ).report();

    // StylePoints Maps Comparison
    MapCreationBenchmark<StylePoints>(
      mapType: 'Normal StylePoints',
      createEmptyMap: () => <StylePoints, int>{},
      getRandom: _randomStylePoints,
    ).report();
    MapCreationBenchmark<StylePoints>(
      mapType: 'Canonicalized StylePoints',
      createEmptyMap: () => CanonicalMap<StylePoints>((key) => key.acm),
      getRandom: _randomStylePoints,
    ).report();

    // StylePointsCombo Maps Comparison
    MapCreationBenchmark<(StylePoints, StylePoints)>(
      mapType: 'Normal StylePointsCombo',
      createEmptyMap: () => <(StylePoints, StylePoints), int>{},
      getRandom: (random) =>
          (_randomStylePoints(random), _randomStylePoints(random)),
    ).report();
    MapCreationBenchmark<(StylePoints, StylePoints)>(
      mapType: 'Canonicalized StylePointsCombo',
      createEmptyMap: () =>
          CanonicalMap<(StylePoints, StylePoints)>((key) => key.compareKey),
      getRandom: (random) =>
          (_randomStylePoints(random), _randomStylePoints(random)),
    ).report();
  }

  Map<T, int> createRandomMap() {
    final map = createEmptyMap();
    for (var i = 0; i < iterationCount; i++) {
      map.update(getRandom(random), (value) => i, ifAbsent: () => i);
    }
    return map;
  }

  @override
  void run() {
    createRandomMap();
  }

  @override
  void exercise() {
    run();
  }
}

Agent _randomAgent(Random random) {
  final defaultRoster = Agents.defaultRoster;
  return defaultRoster[random.nextInt(defaultRoster.length)];
}

StylePoints _randomStylePoints(Random random, [int total = 50]) {
  final aggro = random.nextInt(2 * total ~/ 3);
  final control = random.nextInt(total - aggro);
  final midrange = total - aggro - control;
  return (
    aggro: aggro.toDouble(),
    control: control.toDouble(),
    midrange: midrange.toDouble(),
  );
}

extension on (StylePoints, StylePoints) {
  String get compareKey => '${$1.acm}>${$2.acm}';
}
