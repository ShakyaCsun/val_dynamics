import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';

class AgentsOverviewPage extends StatelessWidget {
  const AgentsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.agents),
      ),
      body: const AgentsOverviewView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const AddAgentsRoute().go(context);
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}

class AgentsOverviewView extends ConsumerWidget {
  const AgentsOverviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agentRosters = ref.watch(
      agentsOverviewNotifierProvider.select(
        (value) => value.agentDetails,
      ),
    );
    final defaultRosterName = ref.watch(defaultRosterNameProvider);
    return AgentsListView(
      rosters: agentRosters,
      onTap: (rosterName) {
        AgentsRoute(rosterName: rosterName).go(context);
      },
      selectedRoster: defaultRosterName,
    );
  }
}
