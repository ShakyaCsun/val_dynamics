import 'package:valorant_agents/valorant_agents.dart';

/// {@template raw_match}
/// Raw Match data.
///
/// Intermediate step between converting a rib.gg csv matches output to
/// [ValorantMatches] without requiring a agents string to [Agent] mapper.
/// {@endtemplate}
class RawMatch {
  /// {@macro raw_match}
  const RawMatch({
    required this.mapName,
    required this.teamOneName,
    required this.teamTwoName,
    required this.teamOneScore,
    required this.teamTwoScore,
    required this.teamOneAttackScore,
    required this.teamTwoAttackScore,
    required this.teamOneAgents,
    required this.teamTwoAgents,
  });

  final String mapName;
  final String teamOneName;
  final String teamTwoName;
  final int teamOneScore;
  final int teamTwoScore;
  final int teamOneAttackScore;
  final int teamTwoAttackScore;
  final String teamOneAgents;
  final String teamTwoAgents;

  ValorantMatch toValorantMatch({required Map<String, Agent> agentsMap}) {
    return ValorantMatch(
      mapName: mapName,
      teamOne: Team(
        name: teamOneName,
        score: teamOneScore,
        attackScore: teamOneAttackScore,
        agents: AgentComp.fromAgentNames(teamOneAgents, agentsMap: agentsMap),
      ),
      teamTwo: Team(
        name: teamTwoName,
        score: teamTwoScore,
        attackScore: teamTwoAttackScore,
        agents: AgentComp.fromAgentNames(teamTwoAgents, agentsMap: agentsMap),
      ),
    );
  }

  @override
  String toString() {
    return 'RawMatch(mapName: $mapName, teamOneName: $teamOneName, '
        'teamTwoName: $teamTwoName, teamOneScore: $teamOneScore, '
        'teamTwoScore: $teamTwoScore, teamOneAttackScore: $teamOneAttackScore, '
        'teamTwoAttackScore: $teamTwoAttackScore, '
        'teamOneAgents: $teamOneAgents, teamTwoAgents: $teamTwoAgents)';
  }
}
