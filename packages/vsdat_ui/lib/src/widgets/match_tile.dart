import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchTile extends StatelessWidget {
  const MatchTile({required this.match, super.key});

  final ValorantMatch match;

  @override
  Widget build(BuildContext context) {
    final ValorantMatch(
      teamOne: Team(name: nameOne, agents: compOne),
      teamTwo: Team(name: nameTwo, agents: compTwo),
      :stylePoints1,
      :stylePoints2,
      :mapName,
      :scoreOne,
      :isMirrorStyle,
    ) = match;
    final textTheme = Theme.of(context).textTheme;
    final iconSize = context.mediumAndUp ? 40.0 : 25.0;
    return Card(
      child: ResponsivePadding(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(nameOne, style: textTheme.titleMedium),
                  ColoredAcm(acm: stylePoints1),
                  CompositionsRow(comp: compOne, iconSize: iconSize),
                ],
              ),
            ),
            SizedBox.square(
              dimension: 96,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(mapName, style: textTheme.labelLarge),
                  ScoreText(score: scoreOne),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nameTwo, style: textTheme.titleMedium),
                  ColoredAcm(acm: stylePoints2),
                  CompositionsRow(comp: compTwo, iconSize: iconSize),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompositionsRow extends StatelessWidget {
  const CompositionsRow({
    required this.comp,
    this.iconSize = 40,
    this.backgroundColor,
    super.key,
  });

  final AgentComp comp;
  final double iconSize;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 2,
      children: comp.agentsGroup.fold(<Widget>[], (previousValue, element) {
        return [
          ...previousValue,
          ...element.map(
            (e) => Container(
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.onSecondaryContainer),
              ),
              child: AgentIcon(
                agent: e,
                size: iconSize,
                backgroundColor:
                    backgroundColor ?? colorScheme.secondaryContainer,
              ),
            ),
          ),
          const Text('-'),
        ];
      })..removeLast(),
    );
  }
}

class ScoreText extends StatelessWidget {
  const ScoreText({required this.score, super.key});

  final Score score;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    final winningTextStyle = textStyle?.copyWith(color: ValColors.winningScore);
    final wonMatch = score.won > score.lost;
    final lostMatch = score.lost > score.won;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${score.won}',
            style: wonMatch ? winningTextStyle : null,
          ),
          const TextSpan(text: '-'),
          TextSpan(
            text: '${score.lost}',
            style: lostMatch ? winningTextStyle : null,
          ),
        ],
      ),
      style: textStyle,
    );
  }
}
