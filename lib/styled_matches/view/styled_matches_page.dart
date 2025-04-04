import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches/matches.dart' show AutoFilterButton;
import 'package:vsdat/styled_matches/styled_matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyledMatchesPage extends StatelessWidget {
  const StyledMatchesPage({
    required this.collectionName,
    required this.stylePoints,
    super.key,
  });

  final String collectionName;
  final StylePoints stylePoints;

  @override
  Widget build(BuildContext context) {
    return SimpleProvider(
      value: collectionName,
      child: SimpleProvider(
        value: stylePoints,
        child: const StyledMatchesView(),
      ),
    );
  }
}

class StyledMatchesView extends ConsumerWidget {
  @visibleForTesting
  const StyledMatchesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final showStandardDrawer = context.showStandardDrawer;
    final collectionName = context.getProperty<String>();
    final stylePoints = context.getProperty<StylePoints>();
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(l10n.styledMatches(stylePoints.acm)),
        actions: [
          TextButton(
            onPressed: () {
              StyledMatchesListRoute.safe(
                collectionName: collectionName,
                acm: stylePoints,
              ).go(context);
            },
            child: Text(l10n.viewMatches),
          ),
        ],
      ),
      body: const StyledMatchesBody(),
      drawer: showStandardDrawer ? null : const StyledMatchesDrawerView(),
    );
  }
}

class StyledMatchesBody extends ConsumerWidget {
  @visibleForTesting
  const StyledMatchesBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showStandardDrawer = context.showStandardDrawer;
    return Row(
      children: [
        if (showStandardDrawer)
          ColoredBox(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: const StyledMatchesDrawerView(),
          ),
        const Expanded(
          child: Stack(
            children: [
              StyledMatchesTriangleView(),
              Positioned(top: 16, left: 16, child: AutoFilterButton()),
            ],
          ),
        ),
      ],
    );
  }
}

class StyledMatchesTriangleView extends ConsumerWidget {
  @visibleForTesting
  const StyledMatchesTriangleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionName = context.getProperty<String>();
    final stylePoints = context.getProperty<StylePoints>();
    return StyledMatchesTriangle(
      matches: ref.watch(
        styledMatchesProvider(
          collectionId: collectionName,
          acm: stylePoints,
        ).select((value) => value.plotData),
      ),
      highlightStyle: stylePoints,
    );
  }
}

class StyledMatchesDrawerView extends ConsumerWidget {
  @visibleForTesting
  const StyledMatchesDrawerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionName = context.getProperty<String>();
    final stylePoints = context.getProperty<StylePoints>();
    return StyledMatchesFilterDrawer(
      collectionName: collectionName,
      highlightStyle: stylePoints,
    );
  }
}
