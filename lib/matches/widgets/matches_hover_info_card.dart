import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesHoverInfoCard extends StatelessWidget {
  const MatchesHoverInfoCard({required this.matchesData, super.key});

  final MatchesTernaryData matchesData;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final MatchesTernaryData(
      :stylePoints,
      :matchesCount,
      :score,
      :compositions,
      :oppositionCompositions,
      :attackScore,
      :defenseScore,
    ) = matchesData;
    final compsCount = compositions.length;
    final infoText =
        '${l10n.nMatches(matchesCount)} ($score) ${score.winRatePercent}';
    final compText = l10n.nDifferentComps(compsCount);
    final wrStat = '${l10n.attack}: $attackScore '
        '${l10n.defense}: $defenseScore';
    return Card.outlined(
      child: ResponsivePadding(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stylePoints.acm,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Text(infoText),
            Text(wrStat),
            Text(compText),
          ],
        ),
      ),
    );
  }
}
