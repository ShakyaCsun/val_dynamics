import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

class StyleTypeMatches extends Equatable {
  StyleTypeMatches({required this.styleTypePair, required this.matches});

  final StyleTypePair styleTypePair;
  final ValorantMatches matches;

  late final MatchesSummary scoreData = MatchesSummary.calculate(
    matches,
    isMirror: styleTypePair.isMirror,
  );

  late final List<(StylePair, MatchesSummary)> styleMatchUpData =
      matches.stylePairData;

  @override
  List<Object> get props => [styleTypePair, matches];
}

extension on ValorantMatches {
  List<(StylePair, MatchesSummary)> get stylePairData {
    final stylePairMatches = fold(<StylePair, ValorantMatches>{}, (
      previousValue,
      match,
    ) {
      final key = (match.stylePoints1, match.stylePoints2);
      previousValue.update(
        key,
        (value) => ValorantMatches([...value, match]),
        ifAbsent: () => ValorantMatches([match]),
      );
      return previousValue;
    });
    return stylePairMatches.entries
        .map<(StylePair, MatchesSummary)>((e) {
          final MapEntry(key: stylePair, value: matches) = e;
          final scoreData = MatchesSummary.calculate(
            matches,
            isMirror: stylePair.isMirror,
          );
          return (stylePair, scoreData);
        })
        .sortedByCompare((element) => element.$2, (a, b) => b.compareTo(a));
  }
}
