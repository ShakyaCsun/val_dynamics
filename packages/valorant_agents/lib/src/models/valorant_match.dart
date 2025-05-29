import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

/// {@template match}
/// Valorant Match
/// {@endtemplate}
class ValorantMatch extends Equatable {
  /// {@macro match}
  ValorantMatch({
    required this.mapName,
    required this.teamOne,
    required this.teamTwo,
  }) : stylePoints1 = teamOne.stylePoints,
       stylePoints2 = teamTwo.stylePoints;

  final String mapName;
  final Team teamOne;
  final Team teamTwo;

  final StylePoints stylePoints1;
  final StylePoints stylePoints2;

  late final StyleType typeOne = StyleType.fromStylePoints(stylePoints1);
  late final StyleType typeTwo = StyleType.fromStylePoints(stylePoints2);

  /// A simplified match result for [teamOne].
  ///
  /// If the match was won by team one, then this will be Score(won: 1, lost: 0)
  /// else Score(won: 0, lost: 1).
  Score get resultOne => scoreOne.won > scoreOne.lost
      ? const Score(won: 1, lost: 0)
      : const Score(won: 0, lost: 1);

  late final Score scoreOne = Score(won: teamOne.score, lost: teamTwo.score);
  late final Score scoreTwo = scoreOne.reversed;

  Score get attackingScore1 =>
      Score(won: teamOne.attackScore, lost: teamTwo.defenseScore);
  Score get attackingScore2 =>
      Score(won: teamTwo.attackScore, lost: teamOne.defenseScore);
  Score get defendingScore1 => attackingScore2.reversed;
  Score get defendingScore2 => attackingScore1.reversed;

  late final bool isMirrorComp = teamOne.agents == teamTwo.agents;
  late final bool isMirrorStyle = stylePoints1 == stylePoints2;

  late final FastAgentMap<NonMirror> nonMirrorAgents = () {
    final agentMap = FastAgentMap<NonMirror>();
    if (isMirrorComp) {
      return agentMap;
    }
    final ValorantMatch(
      teamOne: Team(agents: agentsOne),
      teamTwo: Team(agents: agentsTwo),
    ) = this;
    final oneSet = LinkedHashSet<Agent>(
      equals: (p0, p1) => p0.name == p1.name,
      hashCode: (p0) => p0.name.hashCode,
    )..addAll(agentsOne.agents);
    final twoSet = LinkedHashSet<Agent>(
      equals: (p0, p1) => p0.name == p1.name,
      hashCode: (p0) => p0.name.hashCode,
    )..addAll(agentsTwo.agents);
    for (final agent in oneSet.difference(twoSet)) {
      agentMap[agent] = NonMirror.yes;
    }
    for (final agent in twoSet.difference(oneSet)) {
      agentMap[agent] = NonMirror.yesIfReversed;
    }
    return agentMap;
  }();

  NonMirror checkAgentNonMirror(Agent agent) {
    return nonMirrorAgents[agent] ?? NonMirror.no;
  }

  /// Switch Team One and Team Two
  late final ValorantMatch reversed = ValorantMatch(
    mapName: mapName,
    teamOne: teamTwo,
    teamTwo: teamOne,
  );

  /// Check if this is a non-mirror match for agents [agentOne] and [agentTwo]
  /// in given [criteria].
  ///
  /// Returns:
  /// - [NonMirror.yes] when team one satisfies the condition
  /// - [NonMirror.yesIfReversed] when team one satisfies the condition
  /// - [NonMirror.no] if otherwise
  NonMirror satisfiesComboNM(
    Agent agentOne,
    Agent agentTwo, {
    required ComboCriteria criteria,
  }) {
    final agentCombo = {agentOne.name, agentTwo.name};
    final ValorantMatch(
      teamOne: Team(agents: AgentComp(agentNames: agentsOne)),
      teamTwo: Team(agents: AgentComp(agentNames: agentsTwo)),
    ) = this;
    if (agentsOne.containsAll(agentCombo)) {
      switch (agentsTwo.intersection(agentCombo).length) {
        case 2:
          return NonMirror.no;
        case 1:
          return switch (criteria) {
            ComboCriteria.solo => NonMirror.no,
            ComboCriteria.composite => NonMirror.yes,
          };
        default:
          return NonMirror.yes;
      }
    }
    if (agentsTwo.containsAll(agentCombo)) {
      switch (agentsOne.intersection(agentCombo).length) {
        case 1:
          return switch (criteria) {
            ComboCriteria.solo => NonMirror.no,
            ComboCriteria.composite => NonMirror.yesIfReversed,
          };
        default:
          return NonMirror.yesIfReversed;
      }
    }
    return NonMirror.no;
  }

  @override
  List<Object?> get props => [mapName, teamOne, teamTwo];
}
