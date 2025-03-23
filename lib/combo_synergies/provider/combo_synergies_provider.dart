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
class ComboSynergies extends _$ComboSynergies {
  @override
  Map<(Agent, Agent), ComboSynergyStat> build({required String collectionId}) {
    final matchRepository = ref.watch(
      matchesRepositoryProvider(collectionId: collectionId),
    );
    final SynergiesFilterState(
      :comboCriteria,
      :rolesCombo,
      :selectedMaps,
      :winLossFilter,
    ) = ref.watch(comboSynergyFilterProvider(collectionId: collectionId));
    return matchRepository.getAllComboSynergies(
      criteria: comboCriteria,
      maps: selectedMaps,
      rolesCombo: rolesCombo,
      winLossFilter: winLossFilter,
    );
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

@freezed
abstract class SynergiesFilterState with _$SynergiesFilterState {
  const factory SynergiesFilterState({
    @Default(WinLossFilter.all) WinLossFilter winLossFilter,
    @Default({}) Set<String> selectedMaps,
    @Default((Role.unknown, Role.unknown)) (Role, Role) rolesCombo,
    @Default(ComboCriteria.composite) ComboCriteria comboCriteria,
  }) = _SynergiesState;

  const SynergiesFilterState._();

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
