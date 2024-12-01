import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'team.freezed.dart';

/// {@template team}
/// Details of a team participating in a [ValorantMatch]
/// {@endtemplate}
@freezed
class Team with _$Team {
  /// {@macro team}
  const factory Team({
    required String name,
    required int score,
    required int attackScore,
    required AgentComp agents,
  }) = _Team;

  const Team._();

  int get defenseScore => score - attackScore;
  StylePoints get stylePoints => agents.stylePoints;
}
