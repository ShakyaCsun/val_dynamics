import 'package:flutter/material.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_stats/widgets/widgets.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyleTypeMatchupStatCard extends StatelessWidget {
  const StyleTypeMatchupStatCard({required this.styleTypeStats, super.key});

  final StyleTypeMatches styleTypeStats;

  @override
  Widget build(BuildContext context) {
    final StyleTypeMatches(
      styleTypePair: (styleTypeOne, styleTypeTwo),
      scoreData: MatchesSummary(
        :count,
        :score,
        :mapScore,
        :attackScore,
        :defenseScore,
        :compPicksOne,
        :compPicksTwo,
        :isMirroredData,
      ),
    ) = styleTypeStats;
    final l10n = context.l10n;
    if (isMirroredData) {
      return Card.outlined(
        child: ResponsivePadding(
          child: Column(
            children: [
              Text('${styleTypeOne.label} (Mirror)'),
              StyleTypeIcon(styleType: styleTypeOne),
              Text(l10n.nMatches(count)),
              Text(l10n.nDifferentComps(compPicksOne.length)),
              AgentCompWithCount(
                comp: compPicksOne.keys.first,
                count: compPicksOne.values.first,
                hideCount: compPicksOne.length == 1,
              ),
            ],
          ),
        ),
      );
    }
    return Card.filled(
      child: ResponsivePadding(
        child: Row(
          children: [
            Flexible(
              child: Column(
                children: [
                  Text(styleTypeOne.label),
                  Center(child: StyleTypeIcon(styleType: styleTypeOne)),
                  Text(l10n.nDifferentComps(compPicksOne.length)),
                  AgentCompWithCount(
                    comp: compPicksOne.keys.first,
                    count: compPicksOne.values.first,
                    hideCount: compPicksOne.length == 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: MatchesSummaryText(summary: styleTypeStats.scoreData),
            ),
            Flexible(
              child: Column(
                children: [
                  Text(styleTypeTwo.label),
                  Center(child: StyleTypeIcon(styleType: styleTypeTwo)),
                  Text(l10n.nDifferentComps(compPicksTwo.length)),
                  AgentCompWithCount(
                    comp: compPicksTwo.keys.first,
                    count: compPicksTwo.values.first,
                    hideCount: compPicksTwo.length == 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgentCompWithCount extends StatelessWidget {
  const AgentCompWithCount({
    required this.comp,
    required this.count,
    this.hideCount = false,
    super.key,
  });

  final AgentComp comp;
  final int count;
  final bool hideCount;

  @override
  Widget build(BuildContext context) {
    if (hideCount) {
      return Center(child: CompositionsRow(comp: comp));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CompositionsRow(comp: comp),
        const SizedBox(width: 8),
        Text('($count)'),
      ],
    );
  }
}
