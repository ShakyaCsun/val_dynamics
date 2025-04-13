import 'dart:collection';

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

  Score collectTeamOneScore() {
    return fold((0, 0), (previousValue, element) {
      return previousValue + element.scoreOne.tuple;
    }).toScore;
  }

  Map<(StylePoints, StylePoints), ValorantMatches>
  groupMatchesByStylisticClash() {
    return fold(<(StylePoints, StylePoints), ValorantMatches>{}, (
      matchesGroup,
      match,
    ) {
      final key = (match.stylePoints1, match.stylePoints2);
      final alternateKey = (match.stylePoints2, match.stylePoints1);
      if (match.isMirrorStyle) {
        matchesGroup.update(
          key,
          (value) => ValorantMatches([...value, match, match.reversed]),
          ifAbsent: () => ValorantMatches([match, match.reversed]),
        );
        return matchesGroup;
      }

      if (matchesGroup.containsKey(alternateKey)) {
        matchesGroup.update(
          alternateKey,
          (value) => ValorantMatches([...value, match.reversed]),
        );
        return matchesGroup;
      }
      matchesGroup.update(
        key,
        (value) => ValorantMatches([...value, match]),
        ifAbsent: () => ValorantMatches([match]),
      );
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
          (value) => ValorantMatches([...value, match.reversed]),
          ifAbsent: () => ValorantMatches([match.reversed]),
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

  /// Groups the current matches by [StylePoints].
  ///
  /// The corresponding [ValorantMatches] for given [StylePoints] key is
  /// guaranteed to have matches with teamOne having the said StylePoints.
  Map<StylePoints, ValorantMatches> groupedByStylePoints() {
    final matchesGroup = <StylePoints, ValorantMatches>{};
    for (final match in this) {
      final ValorantMatch(:stylePoints1, :stylePoints2) = match;
      matchesGroup
        ..update(
          stylePoints1,
          (value) => ValorantMatches([...value, match]),
          ifAbsent: () => ValorantMatches([match]),
        )
        ..update(
          stylePoints2,
          (value) => ValorantMatches([...value, match.reversed]),
          ifAbsent: () => ValorantMatches([match.reversed]),
        );
    }
    return matchesGroup;
  }

  ValorantMatches get nonMirroredMatches {
    return ValorantMatches(
      [...matches]..removeWhere((match) => match.isMirrorComp),
    );
  }

  ValorantMatches get nonMirrorStyledMatches {
    return ValorantMatches(
      [...matches]..removeWhere((match) => match.isMirrorStyle),
    );
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

extension SynergyInMatchesCalculator on ValorantMatches {
  /// Get the given [Agent]'s Non-Mirror Win Rate using this [ValorantMatches].
  Score getAgentNmwr(Agent agent) {
    final name = agent.name;
    return fold(Score.zero, (score, valMatch) {
      final ValorantMatch(
        :resultOne,
        teamOne: Team(agents: agentsOne),
        teamTwo: Team(agents: agentsTwo),
      ) = valMatch;
      return switch ((
        agentsOne.hasAgentName(name),
        agentsTwo.hasAgentName(name),
      )) {
        (true, false) => score + resultOne,
        (false, true) => score + resultOne.reversed,
        _ => score,
      };
    });
  }

  /// Get the given [Agent]'s Non-Mirror Round Win Rate using
  /// this [ValorantMatches].
  Score getAgentNmrwr(Agent agent) {
    final name = agent.name;
    return fold((0, 0), (tuple, valMatch) {
      final ValorantMatch(
        scoreOne: Score(tuple: tupleOne),
        scoreTwo: Score(tuple: tupleTwo),
        teamOne: Team(agents: agentsOne),
        teamTwo: Team(agents: agentsTwo),
      ) = valMatch;
      return switch ((
        agentsOne.hasAgentName(name),
        agentsTwo.hasAgentName(name),
      )) {
        (true, false) => tuple + tupleOne,
        (false, true) => tuple + tupleTwo,
        _ => tuple,
      };
    }).toScore;
  }

  Score getComboNmwr(
    Agent agentOne,
    Agent agentTwo, {
    ComboCriteria criteria = ComboCriteria.composite,
  }) {
    return fold(Score.zero, (score, valMatch) {
      if (valMatch.satisfiesComboNM(agentOne, agentTwo, criteria: criteria)) {
        return score + valMatch.resultOne;
      }
      if (valMatch.reversed.satisfiesComboNM(
        agentOne,
        agentTwo,
        criteria: criteria,
      )) {
        return score + valMatch.resultOne.reversed;
      }
      return score;
    });
  }

  Score getComboNmrwr(
    Agent agentOne,
    Agent agentTwo, {
    ComboCriteria criteria = ComboCriteria.composite,
  }) {
    return fold((0, 0), (score, valMatch) {
      if (valMatch.satisfiesComboNM(agentOne, agentTwo, criteria: criteria)) {
        return score + valMatch.scoreOne.tuple;
      }
      if (valMatch.reversed.satisfiesComboNM(
        agentOne,
        agentTwo,
        criteria: criteria,
      )) {
        return score + valMatch.scoreTwo.tuple;
      }
      return score;
    }).toScore;
  }

  /// Generates [ComboSynergyStat] for all agent combos of given [agentRoster].
  ///
  /// The key [(Agent, Agent)] tuple is normalized/sorted for consistency.
  /// ```dart
  /// // Remember to use .normalized when querying the returned Map.
  /// final synergies = matches.getAllComboSynergies(agentRoster);
  /// print(synergies[(agent1, agent2).normalized]);
  /// ```
  Map<(Agent, Agent), ComboSynergyStat> getAllComboSynergies(
    Agents agentRoster, {
    ComboCriteria criteria = ComboCriteria.composite,
  }) {
    final agentWRs = <Agent, Score>{};
    final comboSynergyStats = <(Agent, Agent), ComboSynergyStat>{};
    for (final (i, one) in agentRoster.indexed) {
      for (final two in agentRoster.skip(i + 1)) {
        final (agentOne, agentTwo) = (one, two).normalized;
        final oneWR = agentWRs.putIfAbsent(
          agentOne,
          () => getAgentNmrwr(agentOne),
        );
        final twoWR = agentWRs.putIfAbsent(
          agentTwo,
          () => getAgentNmrwr(agentTwo),
        );
        final comboWR = getComboNmrwr(agentOne, agentTwo, criteria: criteria);
        comboSynergyStats[(agentOne, agentTwo)] = ComboSynergyStat(
          oneWR: oneWR,
          twoWR: twoWR,
          comboWR: comboWR,
        );
      }
    }
    return Map.unmodifiable(comboSynergyStats);
  }
}

class ComboSynergyStat extends Equatable
    implements Comparable<ComboSynergyStat> {
  const ComboSynergyStat({
    required this.oneWR,
    required this.twoWR,
    required this.comboWR,
  });

  final Score oneWR;
  final Score twoWR;
  final Score comboWR;

  double get synergyOne => comboWR.winRate - oneWR.winRate;
  double get synergyTwo => comboWR.winRate - twoWR.winRate;

  ComboSynergyStat get reversed =>
      ComboSynergyStat(oneWR: twoWR, twoWR: oneWR, comboWR: comboWR);

  @override
  List<Object> get props => [oneWR, twoWR, comboWR];

  @override
  /// Compare the [ComboSynergyStat]s based on their combined synergy values.
  int compareTo(ComboSynergyStat other) {
    return (synergyOne + synergyTwo).compareTo(
      other.synergyOne + other.synergyTwo,
    );
  }
}

enum ComboCriteria {
  /// Ignore games where either agent in a combo appears on opposing team.
  solo,

  /// Only ignores games where both agents of a combo appears on opposing team.
  composite,
}

extension ComboAgentExtension on (Agent, Agent) {
  (Agent, Agent) get normalized {
    final (agentOne, agentTwo) = this;
    final (
      Agent(name: nameOne, role: roleOne),
      Agent(name: nameTwo, role: roleTwo),
    ) = this;
    return switch (roleOne.index.compareTo(roleTwo.index)) {
      0 => (nameOne.compareTo(nameTwo) < 0) ? this : (agentTwo, agentOne),
      < 0 => this,
      > 0 => (agentTwo, agentOne),
      // https://github.com/dart-lang/language/issues/3083
      _ => this,
    };
  }

  /// Agent one's name and agent two's name separated by '-' in their normalized
  /// form.
  String get comboName {
    final (Agent(name: nameOne), Agent(name: nameTwo)) = this;
    return '$nameOne-$nameTwo';
  }
}
