import 'dart:collection';

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
          .expand((match) => [match, match.reversed])
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
    final agentWRs = <String, Score>{};
    final comboSynergyStats = LinkedHashMap<(Agent, Agent), ComboSynergyStat>(
      equals: (key1, key2) => key1.comboName == key2.comboName,
      hashCode: (p0) => p0.comboName.hashCode,
    );
    for (final (agentOne, agentTwo) in _availableCombos) {
      final oneWR = agentWRs.putIfAbsent(
        agentOne.name,
        () => matches.getAgentNmrwr(agentOne),
      );
      final twoWR = agentWRs.putIfAbsent(
        agentTwo.name,
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

extension on Set<String> {
  String get cacheKey => ([...this]..sort()).join();
}

extension on (Agent, Agent) {
  (Role, Role) get roleCombo => ($1.role, $2.role);
}
