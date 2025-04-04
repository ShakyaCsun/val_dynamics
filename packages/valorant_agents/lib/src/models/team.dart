import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

/// {@template team}
/// Details of a team participating in a [ValorantMatch]
/// {@endtemplate}
class Team extends Equatable {
  /// {@macro team}
  Team({
    required this.name,
    required this.score,
    required this.attackScore,
    required this.agents,
  }) : defenseScore = score - attackScore,
       stylePoints = agents.stylePoints;

  final String name;
  final int score;
  final int attackScore;
  final AgentComp agents;

  final int defenseScore;
  final StylePoints stylePoints;

  @override
  List<Object> get props => [name, score, attackScore, agents];
}
