import 'package:flutter/material.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesStatListView extends StatefulWidget {
  const MatchesStatListView({required this.matchesStats, super.key});

  final List<StyleTypeMatches> matchesStats;

  @override
  State<MatchesStatListView> createState() => _MatchesStatListViewState();
}

class _MatchesStatListViewState extends State<MatchesStatListView> {
  int expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        for (final (index, styleTypeStats) in widget.matchesStats.indexed)
          _buildSliver(index, styleTypeStats),
      ],
    );
  }

  Widget _buildSliver(int index, StyleTypeMatches styleTypeStats) {
    if (index != expandedIndex) {
      return SliverMainAxisGroup(
        key: ValueKey(styleTypeStats),
        slivers: [
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  expandedIndex = index;
                });
              },
              child: WidthConstrainedBox(
                child: StyleTypeMatchupStatCard(styleTypeStats: styleTypeStats),
              ),
            ),
          ),
        ],
      );
    }
    return SliverMainAxisGroup(
      key: ValueKey(styleTypeStats),
      slivers: [
        PinnedHeaderSliver(
          child: GestureDetector(
            onTap: () {
              setState(() {
                expandedIndex = -1;
              });
            },
            child: WidthConstrainedBox(
              child: StyleTypeMatchupStatCard(styleTypeStats: styleTypeStats),
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            final styleClashStats = styleTypeStats.styleMatchUpData[index];
            return WidthConstrainedBox(
              maxWidth: 1000,
              child: MatchesStatCard(matchesStat: styleClashStats),
            );
          },
          itemCount: styleTypeStats.styleMatchUpData.length,
        ),
      ],
    );
  }
}
