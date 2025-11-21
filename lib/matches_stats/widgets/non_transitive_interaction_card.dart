import 'package:flutter/material.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/matches_stats/widgets/widgets.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class NonTransitiveInteractionCard extends StatelessWidget {
  const NonTransitiveInteractionCard({required this.interaction, super.key});

  final NonTransitiveInteraction interaction;

  @override
  Widget build(BuildContext context) {
    final NonTransitiveInteraction(
      styles: StyleTriplet(:a, :b, :c),
      :aVsB,
      :bVsC,
      :cVsA,
    ) = interaction;
    return Card(
      child: Column(
        children: [
          Text('${a.acm}(X) beats ${b.acm}(Y)'),
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompositionsRow(comp: aVsB.compOne),
              CompositionsRow(comp: aVsB.compTwo),
            ],
          ),
          MatchesSummaryText(summary: aVsB),
          Text('${b.acm}(Y) beats ${c.acm}(Z)'),
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompositionsRow(comp: bVsC.compOne),
              CompositionsRow(comp: bVsC.compTwo),
            ],
          ),
          MatchesSummaryText(summary: bVsC),
          Text('${c.acm}(Z) beats ${a.acm}(X)'),
          Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CompositionsRow(comp: cVsA.compOne),
              CompositionsRow(comp: cVsA.compTwo),
            ],
          ),
          MatchesSummaryText(summary: cVsA),
          OverflowBar(
            children: [
              FilledButton(
                onPressed: () {
                  StyledMatchupListRoute.safe(
                    collectionName: context.collectionName!,
                    acm: a,
                    opponentAcm: b,
                  ).go(context);
                },
                child: const Text('View X vs Y Matches'),
              ),
              FilledButton(
                onPressed: () {
                  StyledMatchupListRoute.safe(
                    collectionName: context.collectionName!,
                    acm: b,
                    opponentAcm: c,
                  ).go(context);
                },
                child: const Text('View Y vs Z Matches'),
              ),
              FilledButton(
                onPressed: () {
                  StyledMatchupListRoute.safe(
                    collectionName: context.collectionName!,
                    acm: c,
                    opponentAcm: a,
                  ).go(context);
                },
                child: const Text('View Z vs X Matches'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
