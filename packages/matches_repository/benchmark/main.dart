import 'package:benchmark_harness/benchmark_harness.dart';

import 'style_type_benchmark.dart';
import 'sum_score_benchmark.dart';
import 'synergies_benchmark.dart';

List<BenchmarkBase> _benchmarks({bool big = false}) {
  const seed = 42504;
  const count = 20000;
  return [
    SynergiesBenchmark(),
    if (big) SynergiesBenchmark(seed: seed, matchesCount: count),
    FirstLoadSynergiesBenchmark(),
    if (big) FirstLoadSynergiesBenchmark(seed: seed, matchesCount: count),
    SumScoreBenchmark(),
    if (big) SumScoreBenchmark(seed: seed, matchesCount: count),
    SumScoreTupleBenchmark(),
    if (big) SumScoreTupleBenchmark(seed: seed, matchesCount: count),
    StyleTypeBenchmark(),
    if (big) StyleTypeBenchmark(seed: seed, matchesCount: count),
  ];
}

void main() {
  for (final benchmark in _benchmarks(big: true)) {
    benchmark.report();
  }
}
