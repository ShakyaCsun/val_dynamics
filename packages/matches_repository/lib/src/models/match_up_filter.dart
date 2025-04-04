import 'package:valorant_agents/valorant_agents.dart';

enum MatchUpFilter {
  /// Exclude matches where both teams have same [StylePoints]
  styles,

  /// Only exclude matches if both teams have same [AgentComp]
  composition,

  /// Include all the matches
  none;

  ValorantMatches apply(ValorantMatches matches) {
    return switch (this) {
      MatchUpFilter.styles => matches.nonMirrorStyledMatches,
      MatchUpFilter.composition => matches.nonMirroredMatches,
      MatchUpFilter.none => matches,
    };
  }
}
