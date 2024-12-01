import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesListView extends StatelessWidget {
  const MatchesListView({required this.matches, super.key});

  final ValorantMatches matches;

  @override
  Widget build(BuildContext context) {
    return ResponsiveListView(
      items: matches,
      itemBuilder: (context, match) {
        return MatchTile(match: match);
      },
    );
  }
}
