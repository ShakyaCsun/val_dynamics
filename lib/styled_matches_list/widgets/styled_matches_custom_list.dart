import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';
import 'package:vsdat/styled_matches_list/styled_matches_list.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyledMatchesCustomList extends StatelessWidget {
  const StyledMatchesCustomList({required this.data, super.key});

  final List<(StyledMatchesSummaryData, ValorantMatches)> data;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (final (summary, matches) in data)
          SliverMainAxisGroup(
            key: ValueKey(summary),
            slivers: [
              PinnedHeaderSliver(
                child: WidthConstrainedBox(
                  child: StylesMatchesSummaryCard(summaryData: summary),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  final match = matches[index];
                  return WidthConstrainedBox(
                    maxWidth: 1000,
                    child: MatchTile(match: match),
                  );
                },
                itemCount: matches.length,
              ),
            ],
          ),
      ],
    );
  }
}

class StylesMatchesSummaryCard extends StatelessWidget {
  const StylesMatchesSummaryCard({required this.summaryData, super.key});

  final StyledMatchesSummaryData summaryData;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;

    final StyledMatchesSummaryData(
      acm: styleOne,
      opponentAcm: styleTwo,
      summary: MatchesSummary(
        :matchesCount,
        :scoreOne,
        :attackScoreOne,
        :compsOne,
        :compsTwo,
        :defenseScoreOne,
      ),
    ) = summaryData;
    return Card.filled(
      child: ResponsivePadding(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColoredAcm(acm: styleOne),
                    Text(l10n.nDifferentComps(compsOne.length)),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(l10n.versusLabel),
                    Text(l10n.nMatches(matchesCount)),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColoredAcm(acm: styleTwo),
                    Text(l10n.nDifferentComps(compsTwo.length)),
                  ],
                ),
              ],
            ),
            Text(scoreOne.winRatePercent, style: textTheme.titleLarge),
            Text('${l10n.overallScore}: $scoreOne'),
            Text(
              '${l10n.attack}: ${attackScoreOne.roundPercentStat} '
              '${l10n.defense}: ${defenseScoreOne.roundPercentStat}',
            ),
          ],
        ),
      ),
    );
  }
}
