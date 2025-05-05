import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat/matches/widgets/min_matches_input.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({required this.collectionName, super.key});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return SimpleProvider(value: collectionName, child: const MatchesView());
  }
}

class MatchesView extends ConsumerWidget {
  @visibleForTesting
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionName = context.getProperty<String>();
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
        actions: [
          TextButton(
            onPressed: () {
              ComboSynergiesRoute(collectionName: collectionName).go(context);
            },
            child: Text(l10n.synergiesLabel),
          ),
          TextButton(
            onPressed: () {
              MatchesStatsRoute(collectionName: collectionName).go(context);
            },
            child: Text(l10n.statsLabel),
          ),
        ],
        leading: const BackButton(),
      ),
      body: const MatchesBody(),
      drawer:
          context.showStandardDrawer ? null : const MinMatchesFilterDrawer(),
      drawerEnableOpenDragGesture: false,
    );
  }
}

class MatchesBody extends ConsumerWidget {
  @visibleForTesting
  const MatchesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionName = context.getProperty<String>();
    final isEmptyMatches = ref.watch(
      matchesProvider(
        collectionId: collectionName,
      ).select((state) => state.isEmpty),
    );

    if (isEmptyMatches) {
      return MatchesNotFoundView(collectionName: collectionName);
    }
    final showStandardDrawer = context.showStandardDrawer;
    return Row(
      children: [
        if (showStandardDrawer)
          ColoredBox(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: const MinMatchesFilterDrawer(),
          ),
        const Expanded(child: MatchesTriangleView()),
      ],
    );
  }
}

class MinMatchesFilterDrawer extends StatelessWidget {
  @visibleForTesting
  const MinMatchesFilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final collectionName = context.getProperty<String>();
    return MatchesFilterDrawer(
      collectionName: collectionName,
      trailing: [
        DrawerHeaderText(context.l10n.minMatchesLabel),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: MinMatchesInput(collectionName: collectionName),
        ),
      ],
    );
  }
}

/// {@template matches_triangle_view}
/// A const-able MatchesTriangle
/// {@endtemplate}
class MatchesTriangleView extends StatelessWidget {
  @visibleForTesting
  const MatchesTriangleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer(
          builder: (context, ref, child) {
            final collectionName = context.getProperty<String>();
            final minMatches = ref.watch(
              matchesFilterProvider(
                collectionId: collectionName,
              ).select((state) => state.minMatches),
            );
            return MatchesTriangle(
              matches: ref.watch(
                matchesProvider(
                  collectionId: collectionName,
                ).select((value) => value.filteredPlotData(minMatches)),
              ),
              onTap: (tappedMatches) {
                final matches = tappedMatches.first;
                StyledMatchesRoute.safe(
                  collectionName: collectionName,
                  acm: matches.first.stylePoints1,
                ).go(context);
              },
            );
          },
        ),
        const Positioned(top: 16, left: 16, child: AutoFilterButton()),
      ],
    );
  }
}

class MatchesNotFoundView extends StatelessWidget {
  @visibleForTesting
  const MatchesNotFoundView({required this.collectionName, super.key});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(l10n.noMatchesForCollection(collectionName)),
        TextButton(onPressed: () {}, child: Text(l10n.backButtonLabel)),
      ],
    );
  }
}
