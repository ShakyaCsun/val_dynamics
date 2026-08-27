import 'dart:math';

import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

void main() {
  final agentsMap = Agents.defaultRoster.nameMap;
  group('AgentComp', () {
    group('.fromAgentNames', () {
      test('generates Correct comp', () {
        final comp = AgentComp(
          Agent.raze,
          Agent.fade,
          Agent.killjoy,
          Agent.viper,
          Agent.omen,
        );
        expect(
          AgentComp.fromAgentNames(
            'Raze,Fade,Killjoy,Omen,Viper',
            agentsMap: agentsMap,
          ),
          equals(comp),
        );
      });
      test('throws InvalidTeamSizeException', () {
        expect(
          () => AgentComp.fromAgentNames(
            'Raze,Fade,Killjoy,Omen',
            agentsMap: agentsMap,
          ),
          throwsA(isA<InvalidTeamSizeException>()),
        );
      });
      test('throws AgentNotFoundException', () {
        expect(
          () => AgentComp.fromAgentNames(
            'Raze,Fade,Killjoy,Omen,Viber',
            agentsMap: agentsMap,
          ),
          throwsA(isA<AgentNotFoundException>()),
        );
      });
      test('saves instance to compsCache', () {
        final cache = <String, AgentComp>{};
        const agents = 'Raze,Fade,Killjoy,Omen,Viper';
        final comp = AgentComp.fromAgentNames(
          agents,
          agentsMap: agentsMap,
          compsCache: cache,
        );
        expect(identical(cache[agents], comp), equals(true));
        expect(cache, equals({agents: comp}));
      });
      test('returns instance from compsCache', () {
        const agents = 'Raze,Fade,Killjoy,Omen,Viper';
        final agentComp = AgentComp(
          Agent.raze,
          Agent.fade,
          Agent.killjoy,
          Agent.viper,
          Agent.omen,
        );
        final cache = <String, AgentComp>{
          'Raze,Fade,Killjoy,Omen,Viper': agentComp,
        };
        final comp = AgentComp.fromAgentNames(
          agents,
          agentsMap: agentsMap,
          compsCache: cache,
        );
        expect(identical(agentComp, comp), equals(true));
        expect(cache, equals({agents: comp}));
      });
    });

    group('double trouble StylePoints', () {
      // Reproduction sample for trouble with double/floating point addition
      // using randomized double values for aggro, control, midrange.
      const breach = Agent(
        name: 'Breach',
        aggro: 6.1,
        control: 2.9,
        midrange: 1,
        role: Role.initiator,
      );
      const jett = Agent(
        name: 'Jett',
        aggro: 8,
        control: 2,
        midrange: 0,
        role: Role.duelist,
      );
      const killjoy = Agent(
        name: 'Killjoy',
        aggro: 3,
        control: 6.3,
        midrange: 0.7,
        role: Role.sentinel,
      );
      const omen = Agent(
        name: 'Omen',
        aggro: 3,
        control: 5.1,
        midrange: 1.9,
        role: Role.controller,
      );
      const sova = Agent(
        name: 'Sova',
        aggro: 1,
        control: 6,
        midrange: 3,
        role: Role.initiator,
      );
      test('handles double addition errors', () {
        final agentComp = AgentComp(breach, jett, killjoy, omen, sova);
        const expectedStylePoints = (aggro: 21.1, control: 22.3, midrange: 6.6);
        expect(agentComp.stylePoints, equals(expectedStylePoints));
        final addedStylePoints =
            breach.stylePoints +
            jett.stylePoints +
            killjoy.stylePoints +
            omen.stylePoints +
            sova.stylePoints;
        // addedStylePoints has control: 22.299999999999997 so will not be equal
        expect(addedStylePoints, isNot(equals(expectedStylePoints)));
      });
    });

    group('.generateAllComps', () {
      /// Standard implementation of generating all comps with unique agents
      List<AgentComp> generateAllComps(Agents agents) {
        return <AgentComp>[
          for (final (one, agent1) in agents.indexed)
            for (final (two, agent2) in agents.skip(one + 1).indexed)
              for (final (three, agent3) in agents.skip(one + two + 2).indexed)
                for (final (four, agent4)
                    in agents.skip(one + two + three + 3).indexed)
                  for (final agent5 in agents.skip(
                    one + two + three + four + 4,
                  ))
                    AgentComp(agent1, agent2, agent3, agent4, agent5),
        ];
      }

      test('accurately generates all comps with unique agents', () {
        final agents = Agents.champs24Roster;
        final allComps = AgentComp.generateAllComps(agents);
        final expectedAllComps = generateAllComps(agents);
        expect(allComps.length, expectedAllComps.length);

        /// Test a small number of comps to ensure the generated comps and style
        /// points match as expected while keeping test duration reasonable.
        expect(
          allComps,
          containsAll(expectedAllComps.shuffled(Random(42)).take(250)),
        );
      });

      test('generated stylePoints are correct for experimental double/float stylePoints', () {
        final agents = Agents([
          const Agent(
            name: 'A',
            aggro: 7.7,
            control: 1.9,
            midrange: 0.4,
            role: Role.duelist,
          ),
          const Agent(
            name: 'B',
            aggro: 2.5,
            control: 4.7,
            midrange: 2.8,
            role: Role.duelist,
          ),
          const Agent(
            name: 'C',
            aggro: 3.1,
            control: 3.3,
            midrange: 3.6,
            role: Role.initiator,
          ),
          const Agent(
            name: 'D',
            aggro: 2.7,
            control: 4.5,
            midrange: 2.8,
            role: Role.initiator,
          ),
          const Agent(
            name: 'E',
            aggro: 2.5,
            control: 5.7,
            midrange: 1.8,
            role: Role.sentinel,
          ),
          const Agent(
            name: 'F',
            aggro: 3,
            control: 6.3,
            midrange: 0.7,
            role: Role.sentinel,
          ),
          const Agent(
            name: 'G',
            aggro: 3,
            control: 5.1,
            midrange: 1.9,
            role: Role.controller,
          ),
          const Agent(
            name: 'H',
            aggro: 1,
            control: 6,
            midrange: 3,
            role: Role.controller,
          ),
        ]);
        final allComps = AgentComp.generateAllComps(agents);
        final expectedAllComps = generateAllComps(agents);
        expect(allComps.length, expectedAllComps.length);

        /// Test a small number of comps to ensure the generated comps and style
        /// points match as expected while keeping test duration reasonable.
        expect(
          allComps,
          containsAll(expectedAllComps.shuffled(Random(42)).take(250)),
        );
      });
    });
  });
}
