import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents/agents.dart';
import 'package:vsdat/matches/matches.dart' hide selectedMaps;
import 'package:vsdat/matches_overview/matches_overview.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

part 'combo_synergies_provider.freezed.dart';
part 'combo_synergies_provider.g.dart';

@riverpod
Set<String> availableMaps(Ref ref, {required String collectionId}) {
  return ref.watch(
    comboSynergiesProvider(collectionId: collectionId).select<Set<String>>(
      (state) => {for (final match in state.matches) match.mapName},
    ),
  );
}

@riverpod
class ComboSynergies extends _$ComboSynergies {
  @override
  SynergiesState build({required String collectionId}) {
    final rosterName = ref.watch(
      matchesCollectionListProvider.select((value) {
        return value
            .firstWhereOrNull(
              (element) => element.collectionName == collectionId,
            )
            ?.rosterName;
      }),
    );
    if (rosterName == null) {
      return SynergiesState(
        agentRoster: Agents([]),
        matches: ValorantMatches([]),
      );
    }
    final agentRoster = ref.watch(agentsProvider(rosterName: rosterName));
    final matches = ref.watch(
      matchesProvider(
        collectionId: collectionId,
      ).select((state) => state.matches.nonMirroredMatches),
    );
    return SynergiesState(agentRoster: agentRoster, matches: matches);
  }

  void changeComboCriteria(ComboCriteria criteria) {
    if (criteria != state.comboCriteria) {
      state = state.copyWith(comboCriteria: criteria);
    }
  }

  void changeMaps(String mapName) {
    if (state.selectedMaps.contains(mapName)) {
      state = state.copyWith(
        selectedMaps: state.selectedMaps.difference({mapName}),
      );
    } else {
      state = state.copyWith(selectedMaps: state.selectedMaps.union({mapName}));
    }
  }

  void changeRoleCombo((Role, Role) roleCombo) {
    if (roleCombo != state.rolesCombo) {
      state = state.copyWith(rolesCombo: roleCombo);
    }
  }

  void changeWinLossFilter(WinLossFilter filter) {
    if (filter != state.winLossFilter) {
      state = state.copyWith(winLossFilter: filter);
    }
  }

  void resetAll() {
    if (!state.defaultSettings) {
      state = state.copyWith(
        comboCriteria: ComboCriteria.composite,
        selectedMaps: {},
        rolesCombo: (Role.unknown, Role.unknown),
        winLossFilter: WinLossFilter.all,
      );
    }
  }
}

enum WinLossFilter {
  /// Filter Agent Combos that have 50% or higher win rate.
  winning,

  /// Filter Agent Combos that have less than 50% win rate.
  losing,

  /// Show all Agent Combos regardless of win rate.
  all,
}

@freezed
abstract class SynergiesState with _$SynergiesState {
  const factory SynergiesState({
    required ValorantMatches matches,
    required Agents agentRoster,
    @Default(WinLossFilter.all) WinLossFilter winLossFilter,
    @Default({}) Set<String> selectedMaps,
    @Default((Role.unknown, Role.unknown)) (Role, Role) rolesCombo,
    @Default(ComboCriteria.composite) ComboCriteria comboCriteria,
  }) = _SynergiesState;

  const SynergiesState._();

  Map<(Agent, Agent), ComboSynergyStat> get comboSynergies {
    final mapComboSynergies = matches
        .filterMaps(selectedMaps)
        .getAllComboSynergies(agentRoster, criteria: comboCriteria);
    final filteredSynergies = mapComboSynergies.entries.where((entry) {
      final MapEntry(key: (agentOne, agentTwo), value: synergyStat) = entry;
      if (synergyStat.comboWR.played <= 0) {
        return false;
      }
      final winRate = synergyStat.comboWR.winRate;
      switch (winLossFilter) {
        case WinLossFilter.winning:
          if (winRate < 0.5) return false;
        case WinLossFilter.losing:
          if (winRate >= 0.5) return false;
        case WinLossFilter.all:
          break;
      }
      final currentRoles = (agentOne.role, agentTwo.role);
      switch (rolesCombo) {
        case (Role.unknown, Role.unknown):
          return true;
        case (final role, Role.unknown) || (Role.unknown, final role):
          return currentRoles.$1 == role || currentRoles.$2 == role;
        case (final role1, final role2):
          return (role1, role2) == currentRoles ||
              (role2, role1) == currentRoles;
      }
    });
    return {for (final MapEntry(:key, :value) in filteredSynergies) key: value};
  }

  Map<ComboData, TernaryPoint> get plotData {
    return {
      for (final MapEntry(key: (agentOne, agentTwo), value: synergyStat)
          in comboSynergies.entries)
        ComboData(
              agentOne: agentOne,
              agentTwo: agentTwo,
              synergyStat: synergyStat,
            ):
            (agentOne.stylePoints + agentTwo.stylePoints).ternaryPoint,
    };
  }

  bool get defaultSettings {
    return selectedMaps.isEmpty &&
        comboCriteria == ComboCriteria.composite &&
        rolesCombo == (Role.unknown, Role.unknown) &&
        winLossFilter == WinLossFilter.all;
  }
}

@freezed
abstract class ComboData with _$ComboData {
  const factory ComboData({
    required Agent agentOne,
    required Agent agentTwo,
    required ComboSynergyStat synergyStat,
  }) = _ComboData;

  const ComboData._();
}
