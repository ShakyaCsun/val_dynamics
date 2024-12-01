import 'package:flutter/material.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesStatListView extends StatelessWidget {
  const MatchesStatListView({required this.matchesStats, super.key});

  final List<StyledMatchesStat> matchesStats;

  @override
  Widget build(BuildContext context) {
    return ResponsiveListView(
      items: matchesStats,
      itemBuilder: (context, item) {
        return MatchesStatCard(matchesStat: item);
      },
    );
  }
}
