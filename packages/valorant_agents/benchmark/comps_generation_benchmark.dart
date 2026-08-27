import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:valorant_agents/valorant_agents.dart';

class CompsGenerationBenchmark extends BenchmarkBase {
  CompsGenerationBenchmark({
    required this.generator,
    String name = 'CompsGenerationBenchmark',
  }) : super(name);

  final List<AgentComp> Function(Agents agents) generator;

  @override
  void run() {
    generator(Agents.defaultRoster);
    generator(Agents.champs24Roster);
  }
}
