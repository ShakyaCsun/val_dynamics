import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyledStyleHoveredCard extends StatelessWidget {
  const StyledStyleHoveredCard({
    required this.stylePoints,
    required this.matches,
    super.key,
  });

  final StylePoints stylePoints;
  final ValorantMatches matches;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (matches.isEmpty) {
      return Card.outlined(
        child: ResponsivePadding(
          child: Column(
            children: [
              ColoredAcm(acm: stylePoints),
              Text(l10n.statsForCurrentStyle),
            ],
          ),
        ),
      );
    }
    return Card.outlined(
      child: ResponsivePadding(
        child: Column(
          children: [
            ColoredAcm(acm: stylePoints),
            Text(l10n.nMirrorStyledMatches(matches.length)),
          ],
        ),
      ),
    );
  }
}
