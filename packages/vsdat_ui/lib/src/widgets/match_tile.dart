import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/src/widgets/widgets.dart';

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
      :isMirrorStyle
    ) = match;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: ResponsivePadding(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    nameOne,
                    style: textTheme.titleMedium,
                  ),
                  ColoredAcm(acm: stylePoints1),
                  CompositionsRow(
                    comp: compOne,
                    iconSize: 40,
                  ),
                ],
              ),
            ),
            SizedBox.square(
              dimension: 96,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    mapName,
                    style: textTheme.labelLarge,
                  ),
                  Text(
                    scoreOne.winLoss,
                    style: textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameTwo,
                    style: textTheme.titleMedium,
                  ),
                  ColoredAcm(acm: stylePoints2),
                  CompositionsRow(
                    comp: compTwo,
                    iconSize: 40,
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

class CompositionsRow extends StatelessWidget {
  const CompositionsRow({
    required this.comp,
    required this.iconSize,
    super.key,
  });

  final AgentComp comp;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: comp.agentsGroup.fold(
        <Widget>[],
        (previousValue, element) {
          return [
            ...previousValue,
            ...element.map(
              (e) => AgentIcon(
                agent: e,
                size: iconSize,
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
              ),
            ),
            const Text('-'),
          ];
        },
      )..removeLast(),
    );
  }
}
