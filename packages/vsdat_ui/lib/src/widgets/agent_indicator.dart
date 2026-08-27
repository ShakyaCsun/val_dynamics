import 'package:material_ui/material_ui.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AgentIndicator extends StatelessWidget {
  const AgentIndicator({
    required this.agent,
    required this.radius,
    this.color,
    this.isSelected = false,
    super.key,
  });

  final Color? color;
  final Agent agent;
  final double radius;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final icon = switch (agent.iconUrl) {
      final url? => NetworkImage(url),
      null => defaultAgentIcon(agent.name)?.provider(),
    };
    final hasIcon = icon != null;
    final indicator = CircleIndicator(
      radius: radius,
      color: color ?? agent.color,
      image: icon ?? defaultRoleIcons(agent.role)?.provider(),
      text: hasIcon ? null : agent.name[0],
    );
    if (isSelected) {
      return CircleAvatar(
        radius: radius + 3,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        child: indicator,
      );
    }
    return indicator;
  }
}
