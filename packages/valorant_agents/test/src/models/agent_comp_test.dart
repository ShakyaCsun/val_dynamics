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
  });
}
