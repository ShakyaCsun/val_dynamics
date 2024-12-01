import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AgentsGridView extends StatelessWidget {
  const AgentsGridView({required this.agents, super.key});

  final Agents agents;

  @override
  Widget build(BuildContext context) {
    final breakpoint = getBreakpointOf(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        const desiredWidth = 700.0;
        final count = math.max(constraints.maxWidth ~/ desiredWidth, 1);
        final horizontalPadding = math.max(
          (constraints.maxWidth - count * desiredWidth) / 2,
          breakpoint.padding,
        );
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            crossAxisSpacing: breakpoint.margin,
            mainAxisSpacing: breakpoint.margin,
            childAspectRatio: 4 / 3,
          ),
          itemBuilder: (context, index) {
            final agent = agents[index];
            return Card.filled(
              margin: EdgeInsets.zero,
              child: ResponsivePadding(
                child: AgentPointBreakdown(agent: agent),
              ),
            );
          },
          itemCount: agents.length,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: breakpoint.padding,
          ),
        );
      },
    );
  }
}
