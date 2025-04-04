import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/combo_synergies/provider/combo_synergies_provider.dart';
import 'package:vsdat/matches/matches.dart';

part 'agent_combo_matches_provider.g.dart';

final _logger = Logger('AgentComboMatchesProvider');

@riverpod
ValorantMatches agentComboMatches(
  Ref ref, {
  required String collectionId,
  required String comboName,
}) {
  final matchesRepository = ref.watch(
    matchesRepositoryProvider(collectionId: collectionId),
  );
  final filters = ref.watch(
    comboSynergyFilterProvider(collectionId: collectionId),
  );
  if (comboName.split('-') case [final nameOne, final nameTwo]) {
    final agentOne = matchesRepository.agentRoster.nameMap[nameOne];
    final agentTwo = matchesRepository.agentRoster.nameMap[nameTwo];
    if ((agentOne, agentTwo) case (final Agent agent1, final Agent agent2)) {
      return matchesRepository.getComboMatches(
        agentCombo: (agent1, agent2),
        criteria: filters.comboCriteria,
        maps: filters.selectedMaps,
      );
    }
    _logger.warning(
      '$collectionId does not have agents named $nameOne and/or $nameTwo in its roster.',
    );
  }
  _logger.warning('$comboName is not of correct format');
  return ValorantMatches([]);
}
