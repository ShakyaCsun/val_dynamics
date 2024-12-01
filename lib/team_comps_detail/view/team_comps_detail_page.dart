import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/team_comps_detail/team_comps_detail.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class TeamCompsDetailPage extends StatelessWidget {
  const TeamCompsDetailPage({
    required this.rosterName,
    required this.stylePoints,
    super.key,
  });

  final String rosterName;
  final StylePoints stylePoints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.styledComps(stylePoints.acm)),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final comps = ref.watch(
            selectedAgentCompsProvider(
              rosterName: rosterName,
              stylePoints: stylePoints,
            ),
          );
          return TeamCompsDetailView(
            teamComps: comps,
          );
        },
      ),
    );
  }
}

class TeamCompsDetailView extends StatelessWidget {
  const TeamCompsDetailView({
    required this.teamComps,
    super.key,
  });

  final List<AgentComp> teamComps;

  @override
  Widget build(BuildContext context) {
    return ResponsiveListView(
      items: teamComps,
      itemBuilder: (context, comp) {
        return ListTile(
          title: Text(comp.agentNames),
        );
      },
    );
  }
}
