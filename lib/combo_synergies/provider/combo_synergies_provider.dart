import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/matches/matches.dart' hide selectedMaps;
import 'package:vsdat_ui/vsdat_ui.dart';

part 'combo_synergies_provider.freezed.dart';
part 'combo_synergies_provider.g.dart';

@riverpod
Map<(Agent, Agent), ComboSynergyStat> comboSynergies(
  Ref ref, {
  required String collectionId,
}) {
  final matchRepository = ref.watch(
    matchesRepositoryProvider(collectionId: collectionId),
  );
  final SynergiesFilterState(
    :comboCriteria,
    :rolesCombo,
    :selectedMaps,
    :winLossFilter,
    :minRounds,
  ) = ref.watch(comboSynergyFilterProvider(collectionId: collectionId));
  return matchRepository.getAllComboSynergies(
    criteria: comboCriteria,
    maps: selectedMaps,
    rolesCombo: rolesCombo,
    winLossFilter: winLossFilter,
    minRounds: minRounds,
  );
}

class ComboSynergyTableData extends Equatable {
  const ComboSynergyTableData({required this.combo, required this.stats});

  final (Agent, Agent) combo;
  final ComboSynergyStat stats;

  String get comboNmrwr => stats.comboWR.winRatePercent;
  String get comboRounds => stats.comboWR.winRateFraction;
  String get agent1Nmrwr => stats.oneWR.roundPercentStat;
  String get agent2Nmrwr => stats.twoWR.roundPercentStat;
  String get agent1Synergy => stats.synergyOne.asPercent;
  String get agent2Synergy => stats.synergyTwo.asPercent;
  String get combinedSynergy => (stats.synergyOne + stats.synergyTwo).asPercent;

  @override
  List<Object> get props => [combo, stats];
}

@riverpod
List<ComboSynergyTableData> sortedComboSynergiesList(
  Ref ref, {
  required String collectionId,
}) {
  final sort = ref.watch(comboSynergySortProvider);
  final synergies = ref.watch(
    comboSynergiesProvider(collectionId: collectionId),
  );
  return sort
      .apply(synergies)
      .entries
      .map(
        (entry) => ComboSynergyTableData(combo: entry.key, stats: entry.value),
      )
      .toList();
}

@Riverpod(keepAlive: true)
class ComboSynergySort extends _$ComboSynergySort {
  @override
  SynergySort build() {
    return SynergySort.comboWR;
  }

  void changeSort(SynergySort sort) {
    if (state == sort) {
      return;
    }
    state = sort;
  }
}

@riverpod
class ComboSynergyFilter extends _$ComboSynergyFilter {
  @override
  SynergiesFilterState build({required String collectionId}) {
    return const SynergiesFilterState();
  }

  void changeComboCriteria(ComboCriteria criteria) {
    if (criteria != state.comboCriteria) {
      state = state.copyWith(comboCriteria: criteria);
    }
  }

  void toggleMap(String mapName) {
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

  void changeMinRounds(int minRounds) {
    state = state.copyWith(minRounds: minRounds);
  }

  void resetAll() {
    if (!state.defaultSettings) {
      state = const SynergiesFilterState();
    }
  }
}

@freezed
abstract class SynergiesFilterState with _$SynergiesFilterState {
  const factory SynergiesFilterState({
    @Default(WinLossFilter.all) WinLossFilter winLossFilter,
    @Default({}) Set<String> selectedMaps,
    @Default((Role.unknown, Role.unknown)) (Role, Role) rolesCombo,
    @Default(ComboCriteria.composite) ComboCriteria comboCriteria,
    @Default(0) int minRounds,
  }) = _SynergiesState;

  const SynergiesFilterState._();

  bool get defaultSettings {
    return this == const SynergiesFilterState();
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

extension ComboSynergyToPlotData on Map<(Agent, Agent), ComboSynergyStat> {
  Map<ComboData, TernaryPoint> get plotData {
    return {
      for (final MapEntry(key: (agentOne, agentTwo), value: synergyStat)
          in entries)
        ComboData(
              agentOne: agentOne,
              agentTwo: agentTwo,
              synergyStat: synergyStat,
            ):
            (agentOne.stylePoints + agentTwo.stylePoints).ternaryPoint,
    };
  }
}
