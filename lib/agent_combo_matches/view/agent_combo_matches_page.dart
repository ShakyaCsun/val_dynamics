import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/agent_combo_matches/agent_combo_matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class AgentComboMatchesPage extends StatelessWidget {
  const AgentComboMatchesPage({
    required this.collectionName,
    required this.comboName,
    super.key,
  });

  final String collectionName;
  final String comboName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$collectionName Matches for $comboName')),
      body: Consumer(
        builder: (context, ref, child) {
          final matches = ref.watch(
            agentComboMatchesProvider(
              collectionId: collectionName,
              comboName: comboName,
            ),
          );
          if (matches.isEmpty) {
            return Center(
              child: Text('No matches for $comboName with selected filters'),
            );
          }
          return MatchesListView(matches: matches);
        },
      ),
    );
  }
}
