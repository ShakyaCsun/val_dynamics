import 'package:valorant_agents/valorant_agents.dart';

import 'comps_generation_benchmark.dart';

void main() {
  CompsGenerationBenchmark(generator: AgentComp.generateAllComps).report();
  CompsGenerationBenchmark(
    generator: generateAllComps,
    name: 'generateAllComps',
  ).report();
}

List<AgentComp> generateAllComps(Agents agents) {
  return <AgentComp>[
    for (final (one, agent1) in agents.indexed)
      for (final (two, agent2) in agents.skip(one + 1).indexed)
        for (final (three, agent3) in agents.skip(one + two + 2).indexed)
          for (final (four, agent4)
              in agents.skip(one + two + three + 3).indexed)
            for (final agent5 in agents.skip(one + two + three + four + 4))
              AgentComp(agent1, agent2, agent3, agent4, agent5),
  ];
}
