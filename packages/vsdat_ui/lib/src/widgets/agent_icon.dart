import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AgentIcon extends StatelessWidget {
  const AgentIcon({
    required this.agent,
    required this.size,
    super.key,
    this.backgroundColor,
    this.fallback,
  });

  final Agent agent;
  final double size;
  final Color? backgroundColor;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ColoredBox(
        color:
            backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
        child: AgentPortrait(agent: agent, fallback: fallback),
      ),
    );
  }
}

class AgentPortrait extends StatelessWidget {
  const AgentPortrait({required this.agent, super.key, this.fallback});

  final Agent agent;
  final Widget? fallback;

  @override
  Widget build(BuildContext context) {
    return switch (agent.iconUrl) {
      final url? => Image.network(url),
      null =>
        defaultAgentIcon(agent.name)?.image() ??
            fallback ??
            Center(
              child: FittedBox(
                child: Text(
                  agent.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
    };
  }
}
