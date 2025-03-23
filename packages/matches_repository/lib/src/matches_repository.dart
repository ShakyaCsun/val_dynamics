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
    matches.map((match) => match.mapName),
  );
  late final ValorantMatches nonMirrorMatches = matches.nonMirroredMatches;
  late final ValorantMatches nonMirrorStyledMatches =
      nonMirrorMatches.nonMirrorStyledMatches;

  late final List<(Agent, Agent)> _availableCombos = List.unmodifiable([
    for (final (i, one) in agentRoster.indexed)
      for (final two in agentRoster.skip(i + 1)) (one, two).normalized,
  ]);
  final Map<String, ValorantMatches> _cachedMapMatches = {};
  final Map<String, Map<(Agent, Agent), ComboSynergyStat>>
  _cachedMapSynergiesSolo = {};
  final Map<String, Map<(Agent, Agent), ComboSynergyStat>>
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
    final filterCondition =
        maps.length > excludeMaps.length
            ? (ValorantMatch match) => !excludeMaps.contains(match.mapName)
            : (ValorantMatch match) => maps.contains(match.mapName);
    final mapMatches = ValorantMatches(matches.where(filterCondition).toList());
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
      matches
          .expand((match) => [match, match.switchTeams()])
          .where(
            (match) =>
                match.satisfiesComboNM(agentOne, agentTwo, criteria: criteria),
          )
          .toList(),
    );
  }

  Map<(Agent, Agent), ComboSynergyStat> getAllComboSynergies({
    Set<String> maps = const {},
    ComboCriteria criteria = ComboCriteria.composite,
    WinLossFilter winLossFilter = WinLossFilter.all,
    (Role, Role) rolesCombo = (Role.unknown, Role.unknown),
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
    );
  }

  Map<(Agent, Agent), ComboSynergyStat> _getComboSynergies({
    required ValorantMatches matches,
    ComboCriteria criteria = ComboCriteria.composite,
  }) {
    final agentWRs = <Agent, Score>{};
    final comboSynergyStats = <(Agent, Agent), ComboSynergyStat>{};
    for (final (agentOne, agentTwo) in _availableCombos) {
      final oneWR = agentWRs.putIfAbsent(
        agentOne,
        () => matches.getAgentNmrwr(agentOne),
      );
      final twoWR = agentWRs.putIfAbsent(
        agentTwo,
        () => matches.getAgentNmrwr(agentTwo),
      );
      final comboWR = matches.getComboNmrwr(
        agentOne,
        agentTwo,
        criteria: criteria,
      );
      if (comboWR.played > 0) {
        comboSynergyStats[(agentOne, agentTwo)] = ComboSynergyStat(
          oneWR: oneWR,
          twoWR: twoWR,
          comboWR: comboWR,
        );
      }
    }
    return Map.unmodifiable(comboSynergyStats);
  }

  Map<(Agent, Agent), ComboSynergyStat> _filterSynergies(
    Map<(Agent, Agent), ComboSynergyStat> synergyStats, {
    WinLossFilter winLossFilter = WinLossFilter.all,
    (Role, Role) rolesCombo = (Role.unknown, Role.unknown),
  }) {
    final winLossStats = winLossFilter.apply(synergyStats);
    return {
      for (final MapEntry(key: combo, value: stat) in winLossStats.entries)
        if (switch (rolesCombo) {
          (Role.unknown, Role.unknown) => true,
          (final role, Role.unknown) || (Role.unknown, final role) =>
            combo.$1.role == role || combo.$2.role == role,
          (final roleOne, final roleTwo) =>
            (roleOne, roleTwo) == combo.roleCombo ||
                (roleTwo, roleOne) == combo.roleCombo,
        })
          combo: stat,
    };
  }
}

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

enum WinLossFilter {
  /// Filter Agent Combos that have 50% or higher win rate.
  winning,

  /// Filter Agent Combos that have less than 50% win rate.
  losing,

  /// Show all Agent Combos regardless of win rate.
  all;

  Map<(Agent, Agent), ComboSynergyStat> apply(
    Map<(Agent, Agent), ComboSynergyStat> synergyStats,
  ) {
    return {
      for (final MapEntry(key: combo, value: stat) in synergyStats.entries)
        if (switch (this) {
          WinLossFilter.winning => stat.comboWR.winRate >= 0.5,
          WinLossFilter.losing => stat.comboWR.winRate < 0.5,
          WinLossFilter.all => true,
        })
          combo: stat,
    };
  }
}

enum SynergySort {
  rounds,
  comboWR,
  combinedSynergy,
  synergy;

  Map<(Agent, Agent), ComboSynergyStat> apply(
    Map<(Agent, Agent), ComboSynergyStat> stats,
  ) {
    if (this == SynergySort.synergy) {
      final sortedSynergyStats =
          stats.entries.expand((entry) {
              final MapEntry(key: combo, value: stat) = entry;
              final reversedEntry = MapEntry((
                combo.$2,
                combo.$1,
              ), stat.reversed);
              return [entry, reversedEntry];
            }).toList()
            ..sort((a, b) {
              return b.value.synergyOne.compareTo(a.value.synergyOne);
            });
      return {
        for (final MapEntry(:key, :value) in sortedSynergyStats) key: value,
      };
    }
    final sortedStats =
        stats.entries.toList()..sort((a, b) {
          return switch (this) {
            SynergySort.rounds => b.value.comboWR.played.compareTo(
              a.value.comboWR.played,
            ),
            SynergySort.comboWR => b.value.comboWR.compareTo(a.value.comboWR),
            SynergySort.combinedSynergy => b.value.compareTo(a.value),
            SynergySort.synergy => throw StateError('Synergy cannot be sorted'),
          };
        });
    return {for (final MapEntry(:key, :value) in sortedStats) key: value};
  }
}

extension on Set<String> {
  String get cacheKey => ([...this]..sort()).join();
}

extension on (Agent, Agent) {
  (Role, Role) get roleCombo => ($1.role, $2.role);
}
