import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesStatCard extends StatelessWidget {
  const MatchesStatCard({required this.matchesStat, super.key});

  final StyledMatchesStat matchesStat;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final (
      :styleOne,
      :styleTwo,
      summary: MatchesSummary(
        :matchesCount,
        :scoreOne,
        :attackScoreOne,
        :defenseScoreOne
      )
    ) = matchesStat;
    final l10n = context.l10n;
    return Card(
      child: ResponsivePadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ColoredAcm(acm: styleOne),
                Text(l10n.versusLabel),
                ColoredAcm(acm: styleTwo),
              ],
            ),
            Text(l10n.nMatches(matchesCount)),
            Text(
              scoreOne.winRatePercent,
              style: textTheme.titleLarge,
            ),
            Text(
              '${l10n.overallScore}: ${scoreOne.winRateFraction}',
            ),
            Text(
              '${l10n.attackScore}: ${attackScoreOne.winRateFraction}',
            ),
            Text(
              '${l10n.defenseScore}: ${defenseScoreOne.winRateFraction}',
            ),
            OverflowBar(
              spacing: getBreakpointOf(context).padding,
              overflowSpacing: getBreakpointOf(context).padding,
              children: [
                FilledButton(
                  onPressed: () {
                    StyledMatchesListRoute.safe(
                      collectionName: context.collectionName!,
                      acm: styleOne,
                    ).go(context);
                  },
                  child: Text(l10n.styledMatches(styleOne.acm)),
                ),
                FilledButton(
                  onPressed: () {
                    StyledMatchesListRoute.safe(
                      collectionName: context.collectionName!,
                      acm: styleTwo,
                    ).go(context);
                  },
                  child: Text(l10n.styledMatches(styleTwo.acm)),
                ),
                FilledButton(
                  onPressed: () {
                    StyledMatchupListRoute.safe(
                      collectionName: context.collectionName!,
                      acm: styleOne,
                      opponentAcm: styleTwo,
                    ).go(context);
                  },
                  child: Text(l10n.viewMatches),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
