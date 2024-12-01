import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';

part 'valorant_match.freezed.dart';

/// {@template match}
/// Valorant Match
/// {@endtemplate}
@freezed
class ValorantMatch with _$ValorantMatch {
  /// {@macro match}
  const factory ValorantMatch({
    required String mapName,
    required Team teamOne,
    required Team teamTwo,
  }) = _ValorantMatch;

  const ValorantMatch._();

  StylePoints get stylePoints1 => teamOne.stylePoints;
  StylePoints get stylePoints2 => teamTwo.stylePoints;

  Score get scoreOne => Score(won: teamOne.score, lost: teamTwo.score);
  Score get scoreTwo => scoreOne.reverse();

  Score get attackingScore1 => Score(
        won: teamOne.attackScore,
        lost: teamTwo.defenseScore,
      );
  Score get attackingScore2 => Score(
        won: teamTwo.attackScore,
        lost: teamOne.defenseScore,
      );
  Score get defendingScore1 => attackingScore2.reverse();
  Score get defendingScore2 => attackingScore1.reverse();

  bool get isMirrorComp => teamOne.agents == teamTwo.agents;
  bool get isMirrorStyle => stylePoints1 == stylePoints2;

  /// Switch Team One and Team Two
  ValorantMatch switchTeams() {
    return ValorantMatch(
      mapName: mapName,
      teamOne: teamTwo,
      teamTwo: teamOne,
    );
  }
}
