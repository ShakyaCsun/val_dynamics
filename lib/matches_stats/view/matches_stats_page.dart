import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';

class MatchesStatsPage extends StatelessWidget {
  const MatchesStatsPage({
    required this.collectionName,
    super.key,
  });

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.statsFor(collectionName)),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final matchesStats = ref.watch(
            matchesStatsProvider(collectionId: collectionName),
          );
          return MatchesStatListView(matchesStats: matchesStats);
        },
      ),
    );
  }
}
