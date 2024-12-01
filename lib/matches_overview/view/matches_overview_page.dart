import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_overview/matches_overview.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesOverviewPage extends StatelessWidget {
  const MatchesOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.matchesTitle),
      ),
      body: const MatchesOverviewView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const AddMatchesRoute().go(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MatchesOverviewView extends ConsumerWidget {
  const MatchesOverviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(matchesCollectionListProvider);

    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final collection = collections[index];
        return WidthConstrainedBox(
          child: MatchesCollectionTile(
            collection: collection,
            onTap: () {
              MatchesRoute(
                collectionName: collection.collectionName,
              ).go(context);
            },
            rosterNames: ref.watch(availableRostersProvider),
            onRosterChange: (rosterName) {
              ref
                  .read(matchesCollectionListProvider.notifier)
                  .changeRosterToUse(
                    index,
                    rosterName,
                  );
            },
          ),
        );
      },
    );
  }
}
