import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/team_comps/team_comps.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class TeamCompsPage extends StatelessWidget {
  const TeamCompsPage({required this.rosterName, super.key});

  final String rosterName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: !context.mediumLargeAndUp
            ? Builder(
                builder: (context) {
                  return IconButton(
                    onPressed: () {
                      TeamCompsFilterRoute(rosterName: rosterName).go(context);
                    },
                    icon: const Icon(Icons.filter_alt_outlined),
                  );
                },
              )
            : null,
        title: Consumer(
          builder: (context, ref, child) {
            final compsReady = ref.watch(
              compositionsReadyProvider(rosterName: rosterName),
            );
            final description = switch (compsReady) {
              true => ref.watch(
                  filteredCompositionsProvider(rosterName: rosterName).select(
                    (comps) {
                      final compsCount = comps.length;
                      if (compsCount == 0) {
                        return context.l10n.noCompsForFilter;
                      }
                      return context.l10n.nCompsOfDifferentStyle(
                        compsCount,
                        comps.stylesCount,
                      );
                    },
                  ),
                ),
              false => rosterName,
            };
            return Text(description);
          },
        ),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final rosterNames = ref.watch(availableRostersProvider);
              return RosterSelectButton(
                rosterNames: rosterNames,
                selectedRoster: rosterName,
                onChange: (rosterName) {
                  TeamCompsRoute(rosterName: rosterName).go(context);
                },
              );
            },
          ),
        ],
      ),
      body: const TeamCompsView(),
    );
  }
}

class TeamCompsView extends ConsumerWidget {
  const TeamCompsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamComps = ref.watch(
      compositionsProvider(
        rosterName: context.compRosterName!,
      ),
    );
    switch (teamComps) {
      case AsyncData():
        final mediumLargeAndUp = context.mediumLargeAndUp;
        return Row(
          children: [
            const Expanded(
              flex: 2,
              child: TeamCompsTriangleView(),
            ),
            if (mediumLargeAndUp)
              const Expanded(
                child: TeamCompsFilter(),
              ),
          ],
        );

      case AsyncError(:final error):
        return Center(
          child: Text(error.toString()),
        );
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}

class TeamCompsTriangleView extends ConsumerWidget {
  @visibleForTesting
  const TeamCompsTriangleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamCompsData = ref.watch(
      teamCompsTernaryDataProvider(rosterName: context.compRosterName!),
    );
    return TeamCompsTriangle(teamCompsData: teamCompsData);
  }
}
