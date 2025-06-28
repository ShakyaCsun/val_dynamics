import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

void main() {
  group('RawMatch', () {
    group('.toValorantMatch', () {
      test('generates single AgentComp instance for same agents string', () {
        const agents = 'Jett,Sova,KAY/O,Killjoy,Omen';
        const rawMatch = RawMatch(
          mapName: 'Ascent',
          teamOneName: 'One',
          teamTwoName: 'Two',
          teamOneScore: 13,
          teamTwoScore: 9,
          teamOneAttackScore: 8,
          teamTwoAttackScore: 5,
          teamOneAgents: agents,
          teamTwoAgents: agents,
        );
        final ValorantMatch(
          teamOne: Team(agents: agentsOne),
          teamTwo: Team(agents: agentsTwo),
        ) = rawMatch.toValorantMatch(
          agentsMap: Agents.defaultRoster.nameMap,
          compsCache: {},
        );
        expect(identical(agentsOne, agentsTwo), equals(true));
      });
      test(
        'generates different but equal AgentComp instance for different agents'
        ' string with same agents',
        () {
          const agents = 'Jett,Sova,KAY/O,Killjoy,Omen';
          const otherAgents = 'Jett,KAY/O,Killjoy,Sova,Omen';
          const rawMatch = RawMatch(
            mapName: 'Ascent',
            teamOneName: 'One',
            teamTwoName: 'Two',
            teamOneScore: 13,
            teamTwoScore: 9,
            teamOneAttackScore: 8,
            teamTwoAttackScore: 5,
            teamOneAgents: agents,
            teamTwoAgents: otherAgents,
          );
          final ValorantMatch(
            teamOne: Team(agents: agentsOne),
            teamTwo: Team(agents: agentsTwo),
          ) = rawMatch.toValorantMatch(
            agentsMap: Agents.defaultRoster.nameMap,
            compsCache: {},
          );
          expect(identical(agentsOne, agentsTwo), equals(false));
          expect(agentsOne, equals(agentsTwo));
        },
      );
    });
  });
}
