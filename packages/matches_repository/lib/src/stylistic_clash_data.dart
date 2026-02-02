import 'package:collection/collection.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

extension StylisticClashDataExtension on ValorantMatches {
  List<StyleTypeMatches> get styleTypeClashes {
    final styleTypeMatches = <(StyleType, StyleType), List<ValorantMatch>>{};
    for (final match in matches) {
      final ValorantMatch(:typeOne, :typeTwo) = match;

      final key = (typeOne, typeTwo);
      final alternateKey = key.reversed;
      if (styleTypeMatches.containsKey(alternateKey)) {
        styleTypeMatches.update(
          alternateKey,
          (value) => [...value, match.reversed],
        );
      } else {
        styleTypeMatches.update(
          key,
          (value) => [...value, match],
          ifAbsent: () => [match],
        );
      }
    }
    return styleTypeMatches.entries
        .map<StyleTypeMatches>((entry) {
          final MapEntry(key: styleTypePair, value: matches) = entry;
          final valorantMatches = ValorantMatches(matches);
          if (valorantMatches.collectTeamOneScore().tiedOrPositive) {
            return StyleTypeMatches(
              styleTypePair: styleTypePair,
              matches: valorantMatches,
            );
          }
          return StyleTypeMatches(
            styleTypePair: styleTypePair.reversed,
            matches: ValorantMatches(matches).swappedTeams,
          );
        })
        .sorted((a, b) => b.scoreData.compareTo(a.scoreData));
  }
}
