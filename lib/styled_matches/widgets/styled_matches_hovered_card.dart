import 'package:flutter/material.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyledMatchesHoveredCard extends StatelessWidget {
  const StyledMatchesHoveredCard({
    required this.stylePoints,
    required this.opponentStyle,
    required this.summary,
    super.key,
  });

  final StylePoints stylePoints;
  final StylePoints opponentStyle;
  final MatchesSummary summary;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final MatchesSummary(
      :attackScore,
      :score,
      :mapScore,
      :compPicksOne,
      :compPicksTwo,
      :defenseScore,
      :count,
    ) = summary;
    final acmOne = stylePoints.acm;
    final opponentAcm = opponentStyle.acm;
    final scoreDescription = switch (score.scoreType) {
      ScoreType.veryPositive => l10n.veryPositiveWinRate(acmOne, opponentAcm),
      ScoreType.positive => l10n.positiveWinRate(acmOne, opponentAcm),
      ScoreType.tied => l10n.tiedWinRate(acmOne, opponentAcm),
      ScoreType.negative => l10n.negativeWinRate(acmOne, opponentAcm),
      ScoreType.veryNegative => l10n.veryNegativeWinRate(acmOne, opponentAcm),
    };
    final compsMatchUp =
        '${l10n.nDifferentComps(compPicksOne.length)} ${l10n.versusLabel} '
        '${l10n.nDifferentComps(compPicksTwo.length)}';
    return Card.outlined(
      child: ResponsivePadding(
        child: Column(
          children: [
            Text('$scoreDescription ${score.roundPercentStat}'),
            Text('${l10n.nMatches(count)}: ${mapScore.wonLost}'),
            Text('${l10n.attack}: ${attackScore.roundPercentStat}'),
            Text('${l10n.defense}: ${defenseScore.roundPercentStat}'),
            Text(compsMatchUp),
          ],
        ),
      ),
    );
  }
}
