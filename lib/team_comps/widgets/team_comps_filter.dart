import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/team_comps/team_comps.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class TeamCompsFilterSheetView extends StatelessWidget {
  const TeamCompsFilterSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return TeamCompsFilter(
          padding: const EdgeInsets.all(16),
          scrollController: scrollController,
        );
      },
    );
  }
}

class TeamCompsFilter extends ConsumerWidget {
  const TeamCompsFilter({this.padding, this.scrollController, super.key});

  final EdgeInsetsGeometry? padding;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rosterName = context.compRosterName!;
    final agents = ref.watch(
      compFiltersProvider(rosterName: rosterName).select((value) {
        return value.agentsWithStatus;
      }),
    );
    List<List<(Agent, AgentStatus)>> groupedAgents(int count) {
      return [
        for (var i = 0; i < agents.length; i += count)
          agents.skip(i).take(count).toList(),
      ];
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final agentsPerRow = switch (constraints.maxWidth) {
          < 500 => 4,
          _ => 5,
        };
        final groupedAgentsList = groupedAgents(agentsPerRow);
        final agentsRowCount = groupedAgentsList.length;
        return ListView.builder(
          controller: scrollController,
          padding: padding,
          itemCount: agentsRowCount + 2,
          itemBuilder: (context, index) {
            if (index < agentsRowCount) {
              return AspectRatio(
                aspectRatio: agentsPerRow.toDouble(),
                child: AgentsRow(
                  agents: groupedAgentsList[index],
                  onAgentTap: (agent) {
                    ref
                        .read(
                          compFiltersProvider(rosterName: rosterName).notifier,
                        )
                        .toggleAgent(agent);
                  },
                ),
              );
            }
            if (index == agentsRowCount) {
              return const RoleRangeSlider();
            }
            if (index == agentsRowCount + 1) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: FilledButton.tonal(
                  onPressed: () {
                    ref
                        .read(
                          compFiltersProvider(rosterName: rosterName).notifier,
                        )
                        .resetFilters();
                  },
                  child: Text(context.l10n.resetFilters),
                ),
              );
            }
            return null;
          },
        );
      },
    );
  }
}

class AgentsRow extends StatelessWidget {
  const AgentsRow({required this.agents, required this.onAgentTap, super.key});

  final List<(Agent, AgentStatus)> agents;
  final void Function(Agent agent) onAgentTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final (agent, status) in agents)
          AspectRatio(
            aspectRatio: 1,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: GestureDetector(
                onTap: () {
                  onAgentTap(agent);
                },
                child: ColoredBox(
                  color: switch (status) {
                    AgentStatus.normal => Colors.grey,
                    AgentStatus.core => Colors.green,
                    AgentStatus.exclude => Colors.red,
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child:
                        agent.iconUrl == null
                            ? defaultAgentIcon(agent.name)?.image() ??
                                Center(
                                  child: Text(
                                    agent.name,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                )
                            : Image.network(agent.iconUrl!),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class RoleRangeSlider extends ConsumerWidget {
  const RoleRangeSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rosterName = context.compRosterName!;
    final roleRanges = ref.watch(
      compFiltersProvider(rosterName: rosterName).select((value) {
        return value.roleFilters;
      }),
    );
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final MapEntry(key: role, value: range) in roleRanges.entries)
          Column(
            children: [
              Text(role.value, style: textTheme.titleMedium),
              RangeSlider(
                values: RangeValues(range.min.toDouble(), range.max.toDouble()),
                onChanged: (value) {
                  ref
                      .read(
                        compFiltersProvider(rosterName: rosterName).notifier,
                      )
                      .changeRoleRange(
                        role,
                        RoleRange(
                          min: value.start.toInt(),
                          max: value.end.toInt(),
                        ),
                      );
                },
                divisions: 5,
                max: 5,
                labels: RangeLabels('${range.min}', '${range.max}'),
              ),
            ],
          ),
      ],
    );
  }
}
