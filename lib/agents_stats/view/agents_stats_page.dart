import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/agents/agents.dart';
import 'package:vsdat/agents_stats/widgets/agents_grid_view.dart';

class AgentsStatsPage extends StatelessWidget {
  const AgentsStatsPage({required this.rosterName, super.key});

  final String rosterName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rosterName),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final agents = ref.watch(agentsProvider(rosterName: rosterName));
          return AgentsGridView(agents: agents);
        },
      ),
    );
  }
}
