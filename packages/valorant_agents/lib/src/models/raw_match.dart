import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'raw_match.freezed.dart';

/// {@template raw_match}
/// Raw Match data.
///
/// Intermediate step between converting a rib.gg csv matches output to
/// [ValorantMatches] without requiring a agents string to [Agent] mapper.
/// {@endtemplate}
@freezed
class RawMatch with _$RawMatch {
  /// {@macro raw_match}
  const factory RawMatch({
    required String mapName,
    required String teamOneName,
    required String teamTwoName,
    required int teamOneScore,
    required int teamTwoScore,
    required int teamOneAttackScore,
    required int teamTwoAttackScore,
    required String teamOneAgents,
    required String teamTwoAgents,
  }) = _RawMatch;

  const RawMatch._();

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
}
