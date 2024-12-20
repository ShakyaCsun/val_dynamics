import 'package:equatable/equatable.dart';
import 'package:valorant_agents/src/helpers/match_indices.dart';
import 'package:valorant_agents/valorant_agents.dart';

extension type ValorantMatches._(List<ValorantMatch> matches)
    implements List<ValorantMatch> {
  /// [ValorantMatches] is just a [List<ValorantMatch>] but forces
  /// unmodifiable/immutable list along with helpful extension methods.
  ValorantMatches(List<ValorantMatch> matches)
    : matches = List.unmodifiable(matches);

  factory ValorantMatches.fromCsv(
    String csv, {
    required Map<String, Agent> agentsMap,
    bool ignoreTeamParserExceptions = false,
    void Function(List<AgentsParserException> exception)?
    ignoredExceptionHandler,
  }) {
    final (headers, rows) = readCsvWithHeaders(csv);

    final indices = MatchIndices.populate(headersRow: headers);

    if (ignoreTeamParserExceptions) {
      final exceptions = <AgentsParserException>[];
      final matches =
          rows
              .map<ValorantMatch?>((e) {
                try {
                  return indices.parseMatch(e, agentsMap: agentsMap);
                } on AgentsParserException catch (e) {
                  exceptions.add(e);
                  return null;
                }
              })
              .nonNulls
              .toList();
      ignoredExceptionHandler?.call(exceptions);
      return ValorantMatches(matches);
    }
    return ValorantMatches(
      rows.map<ValorantMatch>((row) {
        return indices.parseMatch(row, agentsMap: agentsMap);
      }).toList(),
    );
  }

  factory ValorantMatches.fromRawMatches(
    List<RawMatch> rawMatches, {
    required Map<String, Agent> agentsMap,
    bool ignoreTeamParserExceptions = false,
    void Function(List<AgentsParserException> exception)?
    ignoredExceptionHandler,
  }) {
    if (ignoreTeamParserExceptions) {
      final exceptions = <AgentsParserException>[];
      final matches =
          rawMatches
              .map<ValorantMatch?>((match) {
                try {
                  return match.toValorantMatch(agentsMap: agentsMap);
                } on AgentsParserException catch (e) {
                  exceptions.add(e);
                  return null;
                }
              })
              .nonNulls
              .toList();
      ignoredExceptionHandler?.call(exceptions);
      return ValorantMatches(matches);
    }
    return ValorantMatches(
      rawMatches.map<ValorantMatch>((match) {
        return match.toValorantMatch(agentsMap: agentsMap);
      }).toList(),
    );
  }

  /// Removes unnecessary columns from csv string
  static List<RawMatch> rawMatchesFrom({required String csv}) {
    final (headers, rows) = readCsvWithHeaders(csv);
    final indices = MatchIndices.populate(headersRow: headers);
    return rows.map(indices.parseRawMatch).toList();
  }

  static Future<ValorantMatches> fromCsvFile(
    String path, {
    required Map<String, Agent> agentsMap,
    bool ignoreTeamParserExceptions = false,
    void Function(List<AgentsParserException> exception)?
    ignoredExceptionHandler,
  }) async {
    final csv = await readFile(path);
    return ValorantMatches.fromCsv(
      csv,
      agentsMap: agentsMap,
      ignoreTeamParserExceptions: ignoreTeamParserExceptions,
      ignoredExceptionHandler: ignoredExceptionHandler,
    );
  }

  (int score1, int score2) sumScores() {
    return fold((0, 0), (previousValue, match) {
      final (score1, score2) = previousValue;
      return (score1 + match.teamOne.score, score2 + match.teamTwo.score);
    });
  }

  Score collectTeamOneScore() {
    return fold(Score.zero, (previousValue, element) {
      return previousValue + element.scoreOne;
    });
  }

  Score collectScore({
    required Score Function(ValorantMatch match) matchScore,
  }) {
    return fold(Score.zero, (previousValue, element) {
      return previousValue + matchScore(element);
    });
  }

  T foldWinRate<T>({required T win, required T draw, required T loss}) {
    final (wins, losses) = sumScores();
    if (wins > losses) {
      return win;
    }
    if (wins < losses) {
      return loss;
    }
    return draw;
  }

  Map<(StylePoints, StylePoints), ValorantMatches>
  groupMatchesByStylisticClash({bool includeMirrorMatchup = false}) {
    return fold(<(StylePoints, StylePoints), ValorantMatches>{}, (
      matchesGroup,
      match,
    ) {
      final isMirror = match.stylePoints1 == match.stylePoints2;
      if (isMirror) {
        if (includeMirrorMatchup) {
          matchesGroup.update(
            (match.stylePoints1, match.stylePoints2),
            (value) {
              return ValorantMatches([...value, match, match.switchTeams()]);
            },
            ifAbsent: () => ValorantMatches([match, match.switchTeams()]),
          );
          return matchesGroup;
        }
        return matchesGroup;
      }
      final key = (match.stylePoints1, match.stylePoints2);
      final alternateKey = (match.stylePoints2, match.stylePoints1);
      if (matchesGroup.containsKey(key)) {
        matchesGroup.update(key, (value) => ValorantMatches([...value, match]));
        return matchesGroup;
      }
      if (matchesGroup.containsKey(alternateKey)) {
        matchesGroup.update(
          alternateKey,
          (value) => ValorantMatches([...value, match.switchTeams()]),
        );
        return matchesGroup;
      }
      matchesGroup[key] = ValorantMatches([match]);
      return matchesGroup;
    });
  }

  Map<StylePoints, ValorantMatches> groupByStylisticDifference({
    bool includeMirrorMatchup = false,
  }) {
    return fold(<StylePoints, ValorantMatches>{}, (matchesGroup, match) {
      if (match.stylePoints1 == match.stylePoints2 && !includeMirrorMatchup) {
        return matchesGroup;
      }
      final stylePoints1 = match.stylePoints1;
      final stylePoints2 = match.stylePoints2;
      final key = stylePoints1 - stylePoints2;
      final alternateKey = stylePoints2 - stylePoints1;
      if (matchesGroup.containsKey(key)) {
        matchesGroup.update(key, (value) => ValorantMatches([...value, match]));
        return matchesGroup;
      }
      if (matchesGroup.containsKey(alternateKey)) {
        matchesGroup.update(
          alternateKey,
          (value) => ValorantMatches([...value, match.switchTeams()]),
        );
        return matchesGroup;
      }
      matchesGroup[key] = ValorantMatches([match]);
      return matchesGroup;
    });
  }

  Map<MatchupType, ValorantMatches> groupByMatchupType({
    bool includeMirrorMatchup = false,
  }) {
    return fold(<MatchupType, ValorantMatches>{}, (matchesGroup, match) {
      if (match.stylePoints1 == match.stylePoints2 && !includeMirrorMatchup) {
        return matchesGroup;
      }
      final stylePoints1 = match.stylePoints1;
      final stylePoints2 = match.stylePoints2;
      final matchupType = MatchupType.fromStylesGeometry(
        one: stylePoints1,
        two: stylePoints2,
      );
      if (matchupType.inverse) {
        final newKey = switch (matchupType) {
          AggroVsControl() => const AggroVsControl(),
          ControlVsMidrange() => const ControlVsMidrange(),
          MidrangeVsAggro() => const MidrangeVsAggro(),
          NonHybridVsHybrid() => const NonHybridVsHybrid(),
          StylisticallySimilar() => const StylisticallySimilar(),
        };
        matchesGroup.update(
          newKey,
          (value) => ValorantMatches([...value, match.switchTeams()]),
          ifAbsent: () => ValorantMatches([match.switchTeams()]),
        );
        return matchesGroup;
      }
      matchesGroup.update(
        matchupType,
        (value) => ValorantMatches([...value, match]),
        ifAbsent: () => ValorantMatches([match]),
      );
      return matchesGroup;
    });
  }

  Map<StylePoints, ValorantMatches> groupMatchesByStylePoints({
    bool includeMirrorMatchup = false,
  }) {
    return fold(<StylePoints, ValorantMatches>{}, (matchesGroup, match) {
      if (match.stylePoints1 == match.stylePoints2 && !includeMirrorMatchup) {
        return matchesGroup;
      }
      final stylePoints1 = match.stylePoints1;
      final stylePoints2 = match.stylePoints2;
      matchesGroup
        ..update(
          stylePoints1,
          (value) => ValorantMatches([...value, match]),
          ifAbsent: () => ValorantMatches([match]),
        )
        ..update(
          stylePoints2,
          (value) => ValorantMatches([...value, match.switchTeams()]),
          ifAbsent: () => ValorantMatches([match.switchTeams()]),
        );
      return matchesGroup;
    });
  }

  MatchesComparator get compareKey =>
      MatchesComparator(count: length, score: collectTeamOneScore());
}

class MatchesComparator extends Equatable
    implements Comparable<MatchesComparator> {
  const MatchesComparator({required this.count, required this.score});

  final int count;
  final Score score;

  @override
  int compareTo(MatchesComparator other) {
    if (count != other.count) {
      return count.compareTo(other.count);
    }
    return score.compareTo(other.score);
  }

  @override
  List<Object?> get props => [count, score];
}
