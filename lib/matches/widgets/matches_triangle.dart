import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesTriangle extends StatelessWidget {
  const MatchesTriangle({
    required this.matches,
    required this.onTap,
    super.key,
  });

  final Map<ValorantMatches, TernaryPoint> matches;
  final void Function(List<ValorantMatches> tappedMatches) onTap;

  @override
  Widget build(BuildContext context) {
    return TernaryPlotHoverInfo<ValorantMatches>(
      builder:
          (context, hoveredItemsChanged) => StyleTriangle(
            data: matches,
            builder: (datum, radius) {
              final matchesCount = datum.length;
              final color = datum.collectTeamOneScore().color;
              return CircleAvatar(
                radius: radius,
                backgroundColor: color,
                foregroundColor: color.onColor,
                child: Text('$matchesCount'),
              );
            },
            onHover: hoveredItemsChanged,
            onTap: onTap,
          ),
      itemBuilder: (valMatches) {
        final matchesData = MatchesTernaryData.fromMatches(valMatches);
        return MatchesHoverInfoCard(matchesData: matchesData);
      },
    );
  }
}
