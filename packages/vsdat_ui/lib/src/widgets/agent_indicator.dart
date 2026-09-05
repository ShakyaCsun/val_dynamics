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
      null => defaultAgentDisplayIcon(agent.name)?.provider(),
    };
    final hasIcon = icon != null;
    final indicator = CircleIndicator(
      radius: radius,
      color: color ?? agent.color,
      image: icon ?? defaultRoleIcons(agent.role)?.provider(),
      text: hasIcon ? null : agent.name[0],
    );
    return CircleAvatar(
      radius: radius + (isSelected ? 5 : 2),
      backgroundColor: agent.borderColor,
      child: indicator,
    );
  }
}
