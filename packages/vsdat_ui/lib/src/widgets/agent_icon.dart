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
    final iconUrl = agent.iconUrl;
    final icon =
        iconUrl == null
            ? defaultAgentIcon(agent.name)?.image() ??
                fallback ??
                Center(
                  child: FittedBox(
                    child: Text(
                      agent.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                )
            : Image.network(iconUrl);
    return SizedBox.square(
      dimension: size,
      child: ColoredBox(
        color:
            backgroundColor ?? Theme.of(context).colorScheme.surfaceContainer,
        child: icon,
      ),
    );
  }
}
