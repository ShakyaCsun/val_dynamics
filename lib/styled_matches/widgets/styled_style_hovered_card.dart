import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
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
    if (matches.isEmpty) {
      return Card.outlined(
        child: ResponsivePadding(
          child: Column(
            children: [
              ColoredAcm(acm: stylePoints),
              const Text('You are looking at stats for this style'),
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
            Text('${matches.length} mirror styled matches'),
          ],
        ),
      ),
    );
  }
}
