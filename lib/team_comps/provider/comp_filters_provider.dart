import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents/agents.dart';
import 'package:vsdat/team_comps/team_comps.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

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
    required List<Role> roles,
  }) = _CompFiltersState;

  factory CompFiltersState.fromAgents(Agents agents) {
    return CompFiltersState(
      agentFilters: _agentFilters(agents),
      roleFilters: _roleFilters(agents),
      roles: _roles(agents),
    );
  }

  const CompFiltersState._();

  @pragma('vm:prefer-inline')
  bool get hasDefaultFilters {
    return agentFilters.values.every(
          (element) => element == AgentStatus.normal,
        ) &&
        roleFilters.values.every((element) => element == RoleRange.all);
  }

  /// Returns new list of compositions after applying current filter.
  Iterable<AgentComp> apply(List<AgentComp> compositions) {
    final coreAgentNames = <String>{};
    final excludeAgentNames = <String>{};
    for (final MapEntry(key: Agent(:name), value: status)
        in agentFilters.entries) {
      switch (status) {
        case AgentStatus.core:
          coreAgentNames.add(name);
        case AgentStatus.exclude:
          excludeAgentNames.add(name);
        case AgentStatus.normal:
          break;
      }
    }
    final changedRoleFilters = <Role, RoleRange>{
      for (final MapEntry(key: role, value: range) in roleFilters.entries)
        if (range != RoleRange.all) role: range,
    };
    return compositions.where((composition) {
      final AgentComp(:agentNames, :roleCounts) = composition;
      final coreAgentSatisfied = coreAgentNames.difference(agentNames).isEmpty;
      if (coreAgentSatisfied) {
        final excludeAgentSatisfied = excludeAgentNames
            .intersection(agentNames)
            .isEmpty;
        if (excludeAgentSatisfied) {
          return changedRoleFilters.entries.every((entry) {
            final MapEntry(key: role, value: range) = entry;
            final roleAgentCount = roleCounts[role] ?? 0;
            return range.isInRange(roleAgentCount);
          });
        }
      }
      return false;
    });
  }

  CompFiltersState reset() {
    return CompFiltersState(
      agentFilters: {...agentFilters}..updateAll((_, _) => AgentStatus.normal),
      roleFilters: {...roleFilters}..updateAll((_, _) => RoleRange.all),
      roles: roles,
    );
  }

  static Map<Agent, AgentStatus> _agentFilters(Agents agents) {
    return {for (final agent in agents) agent: AgentStatus.normal};
  }

  static Map<Role, RoleRange> _roleFilters(Agents agents) {
    return {for (final role in _roles(agents)) role: RoleRange.all};
  }

  static List<Role> _roles(Agents agents) {
    return [...agents.map((e) => e.role).toSet()]..sort();
  }
}
