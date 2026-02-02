import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_stats/matches_stats.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesStatsPage extends StatefulWidget {
  const MatchesStatsPage({required this.collectionName, super.key});

  final String collectionName;

  @override
  State<MatchesStatsPage> createState() => _MatchesStatsPageState();
}

class _MatchesStatsPageState extends State<MatchesStatsPage> {
  bool showTriangularInteractions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.statsFor(widget.collectionName)),
        actions: [
          Switch(
            value: showTriangularInteractions,
            onChanged: (value) {
              setState(() {
                showTriangularInteractions = value;
              });
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          if (showTriangularInteractions) {
            final interactions = ref.watch(
              triangularInteractionsProvider(
                collectionId: widget.collectionName,
              ),
            );
            return ResponsiveListView(
              items: interactions,
              itemBuilder: (context, item) {
                return NonTransitiveInteractionCard(interaction: item);
              },
            );
          }
          final matchesStats = ref.watch(
            matchesStatsProvider(collectionId: widget.collectionName),
          );
          return MatchesStatListView(matchesStats: matchesStats);
        },
      ),
    );
  }
}
