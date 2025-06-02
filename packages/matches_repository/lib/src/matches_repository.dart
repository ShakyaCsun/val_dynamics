import 'package:collection/collection.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

/// {@template matches_repository}
/// A Repository for Valorant Matches and stats relating to it
/// {@endtemplate}
class MatchesRepository {
  /// {@macro matches_repository}
  MatchesRepository({
    required List<RawMatch> matches,
    required this.agentRoster,
    void Function(List<AgentsParserException> exceptions)?
    ignoredExceptionHandler,
  }) : matches = ValorantMatches.fromRawMatches(
         matches,
         agentsMap: agentRoster.nameMap,
         ignoreTeamParserExceptions: true,
         ignoredExceptionHandler: ignoredExceptionHandler,
       );

  final Agents agentRoster;
  final ValorantMatches matches;
  late final Set<String> availableMaps = Set<String>.unmodifiable(
    matches.map((match) => match.mapName).sorted(),
  );
  late final ValorantMatches nonMirrorMatches = matches.nonMirroredMatches;
  late final ValorantMatches nonMirrorStyledMatches =
      nonMirrorMatches.nonMirrorStyledMatches;

  final Map<String, ValorantMatches> _cachedMapMatches = {};
  final Map<String, FastAgentComboMap<ComboSynergyStat>>
  _cachedMapSynergiesSolo = {};
  final Map<String, FastAgentComboMap<ComboSynergyStat>>
  _cachedMapSynergiesComposite = {};

  ValorantMatches getMatches({
    Set<String> maps = const {},
    MatchUpFilter filter = MatchUpFilter.styles,
  }) {
    final cacheKey = maps.cacheKey;
    if (maps.isEmpty || cacheKey == availableMaps.cacheKey) {
      return switch (filter) {
        MatchUpFilter.styles => nonMirrorStyledMatches,
        MatchUpFilter.composition => nonMirrorMatches,
        MatchUpFilter.none => matches,
      };
    }
    if (_cachedMapMatches[cacheKey] case final mapMatches?) {
      return filter.apply(mapMatches);
    }
    final excludeMaps = availableMaps.difference(maps);
    final filterCondition = maps.length > excludeMaps.length
        ? (ValorantMatch match) => !excludeMaps.contains(match.mapName)
        : (ValorantMatch match) => maps.contains(match.mapName);
    final mapMatches = ValorantMatches(matches.where(filterCondition));
    _cachedMapMatches[cacheKey] = mapMatches;

    return filter.apply(mapMatches);
  }

  ValorantMatches getComboMatches({
    required (Agent, Agent) agentCombo,
    Set<String> maps = const {},
    ComboCriteria criteria = ComboCriteria.composite,
  }) {
    final matches = getMatches(maps: maps, filter: MatchUpFilter.composition);
    final (agentOne, agentTwo) = agentCombo;
    return ValorantMatches(
      matches.expand<ValorantMatch>(
        (match) => switch (match.satisfiesComboNM(
          agentOne,
          agentTwo,
          criteria: criteria,
        )) {
          NonMirror.yes => [match],
          NonMirror.yesIfReversed => [match.reversed],
          NonMirror.no => [],
        },
      ),
    );
  }

  Map<StyleType, StyleTypeStat> getStyleTypeStats({
    Set<String> maps = const {},
  }) {
    final matches = getMatches(maps: maps, filter: MatchUpFilter.none);
    final styleTypeMatches = <(StyleType, StyleType), List<ValorantMatch>>{};
    final totalCompPicks = matches.length * 2;
    final stylePicks = <StyleType, int>{};
    for (final match in matches) {
      final ValorantMatch(:typeOne, :typeTwo) = match;
      stylePicks
        ..update(typeOne, (value) => value + 1, ifAbsent: () => 1)
        ..update(typeTwo, (value) => value + 1, ifAbsent: () => 1);
      if (typeOne == typeTwo) {
        continue;
      }
      final key = (typeOne, typeTwo);
      final alternateKey = (typeTwo, typeOne);
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
    final styleTypeStats = <StyleType, StyleTypeStat>{};
    final styleTypeWinRates = <(StyleType, StyleType), Score>{
      for (final MapEntry(key: (typeOne, typeTwo), value: score)
          in styleTypeMatches.entries
              .map<MapEntry<(StyleType, StyleType), Score>>(
                (entry) => MapEntry(
                  entry.key,
                  ValorantMatches(entry.value).collectTeamOneScore(),
                ),
              )) ...{
        (typeOne, typeTwo): score,
        (typeTwo, typeOne): score.reversed,
      },
    };
    Score winRateOfStyleType(
      Map<(StyleType, StyleType), Score> typedMatchWR,
      StyleType styleType,
    ) {
      return typedMatchWR.entries.fold(Score.zero, (previousValue, element) {
        if (element.key.$1 == styleType) {
          return previousValue + element.value;
        }
        return previousValue;
      });
    }

    for (final MapEntry(key: styleType, value: picks) in stylePicks.entries) {
      styleTypeStats[styleType] = StyleTypeStat(
        type: styleType,
        picks: picks,
        pickRate: picks / totalCompPicks,
        nonMirrorWR: winRateOfStyleType(styleTypeWinRates, styleType),
        winRates: {
          for (final MapEntry(key: (_, typeTwo), value: winRate)
              in styleTypeWinRates.entries.where(
                (element) => element.key.$1 == styleType,
              ))
            typeTwo: winRate,
        },
      );
    }
    return styleTypeStats;
  }

  FastAgentComboMap<ComboSynergyStat> getAllComboSynergies({
    Set<String> maps = const {},
    ComboCriteria criteria = ComboCriteria.composite,
    WinLossFilter winLossFilter = WinLossFilter.all,
    (Role, Role) rolesCombo = (Role.unknown, Role.unknown),
    int minRounds = 0,
  }) {
    final cache = switch (criteria) {
      ComboCriteria.composite => _cachedMapSynergiesComposite,
      ComboCriteria.solo => _cachedMapSynergiesSolo,
    };
    final cacheKey = maps.isEmpty ? availableMaps.cacheKey : maps.cacheKey;
    if (cache[cacheKey] case final stats?) {
      return _filterSynergies(
        stats,
        winLossFilter: winLossFilter,
        rolesCombo: rolesCombo,
        minRounds: minRounds,
      );
    }
    final matches = getMatches(maps: maps, filter: MatchUpFilter.composition);
    final synergyStats = _getComboSynergies(
      matches: matches,
      criteria: criteria,
    );
    cache[cacheKey] = synergyStats;
    return _filterSynergies(
      synergyStats,
      winLossFilter: winLossFilter,
      rolesCombo: rolesCombo,
      minRounds: minRounds,
    );
  }

  FastAgentComboMap<ComboSynergyStat> _getComboSynergies({
    required ValorantMatches matches,
    ComboCriteria criteria = ComboCriteria.composite,
  }) {
    final agentWRs = FastAgentMap<Score>();
    final compositionsComboCache =
        <String, FastAgentComboMap<ComboNonMirror>>{};
    final comboWRs = FastAgentComboMap<Score>();

    for (final match in matches) {
      final ValorantMatch(:scoreOne, :scoreTwo, :nonMirrorAgents, :agentComps) =
          match;
      for (final MapEntry(key: agent, value: nonMirror)
          in nonMirrorAgents.entries) {
        switch (nonMirror) {
          case NonMirror.yes:
            agentWRs.update(
              agent,
              (value) => value + scoreOne,
              ifAbsent: () => scoreOne,
            );
          case NonMirror.yesIfReversed:
            agentWRs.update(
              agent,
              (value) => value + scoreTwo,
              ifAbsent: () => scoreTwo,
            );
          case NonMirror.no:
            break;
        }
      }

      final nonMirrorCombos = compositionsComboCache.putIfAbsent(
        agentComps.key,
        agentComps.calculateAvailableCombos,
      );
      final isCompositeCriteria = criteria == ComboCriteria.composite;
      for (final MapEntry(key: combo, value: comboNonMirror)
          in nonMirrorCombos.entries) {
        switch (comboNonMirror) {
          case ComboNonMirror.yes:
            comboWRs.update(
              combo,
              (score) => score + scoreOne,
              ifAbsent: () => scoreOne,
            );
          case ComboNonMirror.yesIfReversed:
            comboWRs.update(
              combo,
              (score) => score + scoreTwo,
              ifAbsent: () => scoreTwo,
            );
          case ComboNonMirror.composite:
            if (isCompositeCriteria) {
              comboWRs.update(
                combo,
                (score) => score + scoreOne,
                ifAbsent: () => scoreOne,
              );
            }
          case ComboNonMirror.compositeIfReversed:
            if (isCompositeCriteria) {
              comboWRs.update(
                combo,
                (score) => score + scoreTwo,
                ifAbsent: () => scoreTwo,
              );
            }
          case ComboNonMirror.no:
            break;
        }
      }
    }
    return FastAgentComboMap.fromEntries(
      comboWRs.entries.map((entry) {
        final MapEntry(key: combo, value: comboWR) = entry;
        final (one, two) = combo;
        return MapEntry(
          combo,
          ComboSynergyStat(
            oneWR: agentWRs[one] ?? Score.zero,
            twoWR: agentWRs[two] ?? Score.zero,
            comboWR: comboWR,
          ),
        );
      }),
    );
  }

  FastAgentComboMap<ComboSynergyStat> _filterSynergies(
    FastAgentComboMap<ComboSynergyStat> synergyStats, {
    WinLossFilter winLossFilter = WinLossFilter.all,
    (Role, Role) rolesCombo = (Role.unknown, Role.unknown),
    int minRounds = 0,
  }) {
    return FastAgentComboMap<ComboSynergyStat>.fromEntries(
      synergyStats.entries.where((entry) {
        final MapEntry(key: combo, value: ComboSynergyStat(:comboWR)) = entry;
        if (!winLossFilter.check(comboWR)) {
          return false;
        }
        if (comboWR.played < minRounds) {
          return false;
        }
        return switch (rolesCombo) {
          (Role.unknown, Role.unknown) => true,
          (final role, Role.unknown) || (Role.unknown, final role) =>
            combo.$1.role == role || combo.$2.role == role,
          (final roleOne, final roleTwo) =>
            (roleOne, roleTwo) == combo.roleCombo ||
                (roleTwo, roleOne) == combo.roleCombo,
        };
      }),
    );
  }
}

extension on Set<String> {
  String get cacheKey => ([...this]..sort()).join();
}

extension on (Agent, Agent) {
  (Role, Role) get roleCombo => ($1.role, $2.role);
}
