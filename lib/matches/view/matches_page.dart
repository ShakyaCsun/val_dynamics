import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

@visibleForTesting
final collectionNameProvider = Provider<String>(
  (ref) => throw UnimplementedError(),
);

class MatchesPage extends StatelessWidget {
  const MatchesPage({required this.collectionName, super.key});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [collectionNameProvider.overrideWithValue(collectionName)],
      child: const MatchesView(),
    );
  }
}

class MatchesView extends ConsumerWidget {
  @visibleForTesting
  const MatchesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionName = ref.watch(collectionNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(collectionName),
        actions: [
          TextButton(
            onPressed: () {
              MatchesStatsRoute(collectionName: collectionName).go(context);
            },
            child: Text(context.l10n.viewStats),
          ),
        ],
        leading: const BackButton(),
      ),
      body: const MatchesBody(),
      drawer:
          context.showStandardDrawer
              ? null
              : MatchesFilterDrawer(collectionName: collectionName),
      drawerEnableOpenDragGesture: false,
    );
  }
}

class MatchesBody extends ConsumerWidget {
  @visibleForTesting
  const MatchesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionName = ref.watch(collectionNameProvider);
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
            child: MatchesFilterDrawer(collectionName: collectionName),
          ),
        const Expanded(child: MatchesTriangleView()),
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
            final collectionName = ref.watch(collectionNameProvider);
            return MatchesTriangle(
              matches: ref.watch(
                matchesProvider(
                  collectionId: collectionName,
                ).select((value) => value.plotData),
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
    return Column(
      children: [
        Text('$collectionName Matches not found'),
        TextButton(onPressed: () {}, child: const Text('Go back')),
      ],
    );
  }
}
