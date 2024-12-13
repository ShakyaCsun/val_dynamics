import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';
import 'package:vsdat/styled_matches/styled_matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyledMatchesTriangle extends StatelessWidget {
  const StyledMatchesTriangle({
    required this.matches,
    required this.highlightStyle,
    super.key,
  });

  final Map<ValorantMatches, TernaryPoint> matches;
  final StylePoints highlightStyle;

  @override
  Widget build(BuildContext context) {
    return TernaryPlotHoverInfo<ValorantMatches>(
      builder:
          (context, hoveredItemsChanged) => StyleTriangle(
            data: matches,
            builder: (datum, radius) {
              var highlight = false;
              if (datum.matches.isEmpty ||
                  datum.matches.first.teamTwo.stylePoints == highlightStyle) {
                highlight = true;
              }
              final matchesCount = datum.length;
              final color = datum.collectTeamOneScore().color;
              if (highlight) {
                return CircleAvatar(
                  radius: radius,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  child: Text(matchesCount > 0 ? '$matchesCount' : 'H'),
                );
              }
              return CircleAvatar(
                radius: radius,
                backgroundColor: color,
                foregroundColor: color.onColor,
                child: Text('$matchesCount'),
              );
            },
            onHover: hoveredItemsChanged,
            onTap: (points) {
              final validPoints =
                  points.where((element) => element.isNotEmpty).toList();
              if (validPoints.isNotEmpty) {
                StyledMatchupListRoute.safe(
                  collectionName: context.collectionName!,
                  acm: highlightStyle,
                  opponentAcm: validPoints.first.matches.first.stylePoints2,
                ).go(context);
              }
            },
          ),
      itemBuilder: (valMatches) {
        if (valMatches.isEmpty ||
            valMatches.first.stylePoints2 == highlightStyle) {
          return StyledStyleHoveredCard(
            stylePoints: highlightStyle,
            matches: valMatches,
          );
        }
        return StyledMatchesHoveredCard(
          stylePoints: highlightStyle,
          opponentStyle: valMatches.first.stylePoints2,
          summary: MatchesSummary.fromMatches(valMatches),
        );
      },
    );
  }
}
