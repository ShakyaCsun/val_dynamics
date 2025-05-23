import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents/agents.dart';
import 'package:vsdat/team_comps/team_comps.dart';

part 'comp_filters_provider.freezed.dart';
part 'comp_filters_provider.g.dart';

@riverpod
class CompFilters extends _$CompFilters {
  @override
  CompFiltersState build({required String rosterName}) {
    final agents = ref.watch(agentsProvider(rosterName: rosterName));
    return CompFiltersState.fromAgents(agents);
  }

  void toggleAgent(Agent agent) {
    final agentFilters = {...state.agentFilters}
      ..update(agent, (currentStatus) => currentStatus.next);
    state = state.copyWith(agentFilters: agentFilters);
  }

  void changeRoleRange(Role role, RoleRange range) {
    final roleFilters = {...state.roleFilters}..update(role, (_) => range);
    state = state.copyWith(roleFilters: roleFilters);
  }

  void resetFilters() {
    if (state.hasDefaultFilters) {
      return;
    }
    state = state.reset();
  }
}

@freezed
abstract class CompFiltersState with _$CompFiltersState {
  const factory CompFiltersState({
    required Map<Agent, AgentStatus> agentFilters,
    required Map<Role, RoleRange> roleFilters,
  }) = _CompFiltersState;

  factory CompFiltersState.fromAgents(Agents agents) {
    return CompFiltersState(
      agentFilters: _agentFilters(agents),
      roleFilters: _roleFilters(agents),
    );
  }

  const CompFiltersState._();

  List<(Agent, AgentStatus)> get agentsWithStatus {
    return [
      for (final MapEntry(key: agent, value: status) in agentFilters.entries)
        (agent, status),
    ];
  }

  bool get hasDefaultFilters {
    return agentFilters.values.every(
          (element) => element == AgentStatus.normal,
        ) &&
        roleFilters.values.every((element) => element == RoleRange.all);
  }

  /// Returns new list of compositions after applying current filter.
  List<AgentComp> apply(List<AgentComp> compositions) {
    if (hasDefaultFilters) {
      return compositions;
    }
    final coreAgentNames = agentFilters.entries
        .where((element) => element.value == AgentStatus.core)
        .map((e) => e.key.name)
        .toSet();
    final excludeAgentNames = agentFilters.entries
        .where((element) => element.value == AgentStatus.exclude)
        .map((e) => e.key.name)
        .toSet();
    final changedRoleFilters = {...roleFilters}
      ..removeWhere((_, range) => range == RoleRange.all);
    return compositions.where((composition) {
      final agentNames = composition.agentNames;
      final coreAgentSatisfied = coreAgentNames.difference(agentNames).isEmpty;
      if (coreAgentSatisfied) {
        final excludeAgentSatisfied = excludeAgentNames
            .intersection(agentNames)
            .isEmpty;
        if (excludeAgentSatisfied) {
          return changedRoleFilters.entries.every((entry) {
            final MapEntry(key: role, value: range) = entry;
            final roleAgentCount = composition.roleCounts[role] ?? 0;
            return range.isInRange(roleAgentCount);
          });
        }
      }
      return false;
    }).toList();
  }

  CompFiltersState reset() {
    return CompFiltersState(
      agentFilters: {...agentFilters}..updateAll((_, __) => AgentStatus.normal),
      roleFilters: {...roleFilters}..updateAll((_, __) => RoleRange.all),
    );
  }

  static Map<Agent, AgentStatus> _agentFilters(Agents agents) {
    return {for (final agent in agents) agent: AgentStatus.normal};
  }

  static Map<Role, RoleRange> _roleFilters(Agents agents) {
    return {
      for (final role in agents.map((e) => e.role).toSet()) role: RoleRange.all,
    };
  }
}
