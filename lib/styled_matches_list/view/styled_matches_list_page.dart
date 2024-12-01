import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/styled_matches_list/styled_matches_list.dart';

class StyledMatchesListPage extends StatelessWidget {
  const StyledMatchesListPage({
    required this.collectionName,
    required this.stylePoints,
    super.key,
  });

  final String collectionName;
  final StylePoints stylePoints;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.styledMatches(stylePoints.acm)),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final matchesData = ref.watch(
            styledMatchesDataListProvider(
              collectionId: collectionName,
              acm: stylePoints,
            ),
          );
          return StyledMatchesCustomList(data: matchesData);
        },
      ),
    );
  }
}
