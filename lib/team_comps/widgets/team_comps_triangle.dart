import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class TeamCompsTriangle extends StatelessWidget {
  const TeamCompsTriangle({required this.teamCompsData, super.key});

  final Map<AgentCompsTernaryData, TernaryPoint> teamCompsData;

  @override
  Widget build(BuildContext context) {
    final maxComps = teamCompsData.keys.map((e) => e.count).fold(0, (
      previousValue,
      element,
    ) {
      if (element > previousValue) {
        return element;
      }
      return previousValue;
    });
    final colorScheme = Theme.of(context).colorScheme;
    return TernaryPlotHoverInfo<AgentCompsTernaryData>(
      builder: (context, hoveredItemsChanged) {
        return StyleTriangle(
          data: teamCompsData,
          builder: (datum, radius) {
            final maxedComp = datum.count == maxComps;
            return CircleIndicator.bordered(
              borderColor: maxedComp
                  ? colorScheme.primary
                  : ValColors.forStyleType(datum.stylePoints.styleType),
              text: '${datum.count}',
              radius: radius,
            );
          },
          minRadius: 14,
          onHover: hoveredItemsChanged,
          onTap: (compsDataList) {
            final currentRoster = context.compRosterName!;
            if (compsDataList.length > 1) {
              showDialog<void>(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text(context.l10n.selectAcmLabel),
                    children: [
                      for (final compsData in compsDataList)
                        SimpleDialogOption(
                          onPressed: () {
                            TeamCompsDetailRoute.safe(
                              rosterName: currentRoster,
                              acm: compsData.stylePoints,
                            ).go(context);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            context.l10n.nCompsOfStyle(
                              compsData.count,
                              compsData.stylePoints.acm,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              );
            } else {
              TeamCompsDetailRoute.safe(
                rosterName: currentRoster,
                acm: compsDataList.first.stylePoints,
              ).go(context);
            }
          },
          offsetChildren: false,
        );
      },
      itemBuilder: (compsData) => Text(
        context.l10n.nCompsOfStyle(compsData.count, compsData.stylePoints.acm),
      ),
    );
  }
}
