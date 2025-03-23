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

  /// A simplified match result for [teamOne].
  ///
  /// If the match was won by team one, then this will be Score(won: 1, lost: 0)
  /// else Score(won: 0, lost: 1).
  Score get resultOne =>
      scoreOne.won > scoreOne.lost
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

  /// Switch Team One and Team Two
  ValorantMatch switchTeams() {
    return ValorantMatch(mapName: mapName, teamOne: teamTwo, teamTwo: teamOne);
  }

  /// Returns `true` if team one has the combo of agents and team two satisfies
  /// the criteria for this being a non-mirror combo matchup.
  bool satisfiesComboNM(
    Agent agentOne,
    Agent agentTwo, {
    required ComboCriteria criteria,
  }) {
    final ValorantMatch(
      teamOne: Team(agents: agentsOne),
      teamTwo: Team(agents: agentsTwo),
    ) = this;
    return switch ((
      agentsOne.hasAgent(agentOne),
      agentsOne.hasAgent(agentTwo),
    )) {
      (true, true) => switch ((
        agentsTwo.hasAgent(agentOne),
        agentsTwo.hasAgent(agentTwo),
      )) {
        (true, true) => false,
        (false, false) => true,
        _ => switch (criteria) {
          ComboCriteria.solo => false,
          ComboCriteria.composite => true,
        },
      },
      _ => false,
    };
  }

  @override
  List<Object?> get props => [mapName, teamOne, teamTwo];
}
