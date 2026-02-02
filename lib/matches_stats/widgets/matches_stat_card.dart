import 'package:flutter/material.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesStatCard extends StatelessWidget {
  const MatchesStatCard({required this.matchesStat, super.key});

  final (StylePair, MatchesSummary) matchesStat;

  @override
  Widget build(BuildContext context) {
    final ((styleOne, styleTwo), scoreData) = matchesStat;
    final l10n = context.l10n;
    final isMediumAndUp = context.mediumAndUp;
    if (styleOne == styleTwo) {
      return Card(
        child: ResponsivePadding(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColoredAcm(acm: styleOne),
              Text(l10n.nMirrorStyledMatches(scoreData.count)),
              StyleTypeIcon(styleType: styleOne.styleType),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 16,
                children: [
                  CompositionsRow(comp: scoreData.compOne),
                  Text('(${scoreData.compPicksOne.values.first})'),
                ],
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
    return Card(
      child: ResponsivePadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ColoredAcm(acm: styleOne),
                Text(l10n.versusLabel),
                ColoredAcm(acm: styleTwo),
              ].map((e) => Expanded(child: Center(child: e))).toList(),
            ),
            Row(
              children: [
                if (isMediumAndUp)
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: StyleTypeIcon(styleType: styleOne.styleType),
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Center(child: MatchesSummaryText(summary: scoreData)),
                ),
                if (isMediumAndUp)
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: StyleTypeIcon(styleType: styleTwo.styleType),
                    ),
                  ),
              ],
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

class MatchesSummaryText extends StatelessWidget {
  const MatchesSummaryText({required this.summary, super.key});

  final MatchesSummary summary;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    final MatchesSummary(
      :count,
      :score,
      :mapScore,
      :attackScore,
      :defenseScore,
    ) = summary;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${l10n.nMatches(count)}: ${mapScore.wonLost}'),
        Text(score.winRatePercent, style: textTheme.titleLarge),
        Text('${l10n.overallScore}: $score'),
        Text('${l10n.attackScore}: ${attackScore.roundPercentStat}'),
        Text('${l10n.defenseScore}: ${defenseScore.roundPercentStat}'),
      ],
    );
  }
}

class MatchUpNoteIcon extends StatelessWidget {
  const MatchUpNoteIcon({required this.note, super.key});

  final MatchUpNote note;

  @override
  Widget build(BuildContext context) {
    return Text(
      note.symbol,
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
        color: switch (note) {
          MatchUpNote.prey => ValColors.positiveTween.transform(1),
          MatchUpNote.preyType => ValColors.positiveTween.transform(1),
          MatchUpNote.predator => ValColors.negativeTween.transform(1),
          MatchUpNote.predatorType => ValColors.negativeTween.transform(1),
          MatchUpNote.mirror => ValColors.tiedWR,
          MatchUpNote.mirrorType => ValColors.tiedWR,
          MatchUpNote.none => ValColors.tiedWR,
        },
      ),
    );
  }
}
