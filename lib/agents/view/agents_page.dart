import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents/agents.dart' hide AgentsTriangleView;
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AgentsPage extends StatelessWidget {
  const AgentsPage({required this.rosterName, super.key});

  final String rosterName;

  @override
  Widget build(BuildContext context) {
    return SimpleProvider<String>(value: rosterName, child: const AgentsView());
  }
}

class AgentsView extends ConsumerWidget {
  @visibleForTesting
  const AgentsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rosterName = context.getProperty<String>();
    return Scaffold(
      appBar: AppBar(
        title: Text(rosterName),
        actions: [
          TextButton(
            onPressed: () {
              AgentsStatRoute(rosterName: rosterName).go(context);
            },
            child: Text(context.l10n.agentsStats),
          ),
        ],
      ),
      body: const AgentsBodyView(),
    );
  }
}

class AgentsBodyView extends ConsumerWidget {
  @visibleForTesting
  const AgentsBodyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSpace = context.largeAndUp;
    final rosterName = context.getProperty<String>();
    final agentSelected = ref.watch(
      selectedAgentProvider(
        rosterName: rosterName,
      ).select((value) => value != null),
    );
    ref.listen(selectedAgentProvider(rosterName: rosterName), (
      previous,
      next,
    ) async {
      if (!hasSpace && next != null) {
        await showModalBottomSheet<void>(
          context: context,
          constraints: const BoxConstraints(maxWidth: 800),
          showDragHandle: true,
          scrollControlDisabledMaxHeightRatio: 0.8,
          builder: (context) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.8,
              ),
              child: SimpleProvider<String>(
                value: rosterName,
                child: const SelectedAgentBreakdown(),
              ),
            );
          },
        );
        ref
            .read(selectedAgentProvider(rosterName: rosterName).notifier)
            .change(null);
      }
    });
    final showBreakdown = hasSpace && agentSelected;
    return Stack(
      fit: StackFit.expand,
      children: [
        Row(
          children: [
            const Expanded(flex: 6, child: AgentsTriangleView()),
            if (showBreakdown) const Spacer(flex: 4),
          ],
        ),
        if (showBreakdown)
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Expanded(child: ResponsivePadding(child: AgentBreakdownCard())),
            ],
          ),
      ],
    );
  }
}

class AgentBreakdownCard extends StatelessWidget {
  @visibleForTesting
  const AgentBreakdownCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: min(620, MediaQuery.sizeOf(context).height * 0.7),
        ),
        child: const SelectedAgentBreakdown(),
      ),
    );
  }
}

class SelectedAgentBreakdown extends ConsumerWidget {
  @visibleForTesting
  const SelectedAgentBreakdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rosterName = context.getProperty<String>();
    final selectedAgent = ref.watch(
      selectedAgentProvider(rosterName: rosterName),
    );
    if (selectedAgent == null) {
      return const SizedBox.shrink();
    }
    return ResponsivePadding(child: AgentPointBreakdown(agent: selectedAgent));
  }
}

class AgentsTriangleView extends StatelessWidget {
  @visibleForTesting
  const AgentsTriangleView({super.key});

  @override
  Widget build(BuildContext context) {
    final rosterName = context.getProperty<String>();
    return TernaryPlotHoverInfo<Agent>(
      anchor: HoverAnchor.left,
      itemBuilder: (agent) {
        return Text('${agent.name}: ${agent.stylePoints.acm}');
      },
      builder: (context, hoveredAgentsChanged) {
        return Consumer(
          builder: (context, ref, child) {
            final agents = ref.watch(agentsProvider(rosterName: rosterName));
            return StyleTriangle(
              data: {
                for (final agent in agents)
                  agent: agent.stylePoints.ternaryPoint,
              },
              builder: (agent, radius) {
                return Consumer(
                  builder: (context, ref, child) {
                    final isSelected = ref.watch(
                      selectedAgentProvider(
                        rosterName: rosterName,
                      ).select((value) => value == agent),
                    );
                    return AgentIndicator(
                      agent: agent,
                      isSelected: isSelected,
                      radius: radius,
                    );
                  },
                );
              },
              onHover: hoveredAgentsChanged,
              onTap: (tappedAgents) {
                final agent = tappedAgents.first;
                ref
                    .read(
                      selectedAgentProvider(rosterName: rosterName).notifier,
                    )
                    .change(agent);
              },
              minRadius: 20,
            );
          },
        );
      },
    );
  }
}
