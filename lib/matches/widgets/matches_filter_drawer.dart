import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesFilterDrawer extends StatelessWidget {
  const MatchesFilterDrawer({
    required this.collectionName,
    this.trailing,
    super.key,
  });

  final String collectionName;
  final List<Widget>? trailing;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return NavigationDrawer(
      children: [
        DrawerHeaderText(l10n.mapSelect),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Consumer(
            builder: (context, ref, child) {
              final mapNames = ref.watch(
                availableMapsProvider(collectionName: collectionName),
              );
              final selectedMaps = ref.watch(
                selectedMapsProvider(collectionName: collectionName),
              );
              return FilterChipsWrap(
                options: mapNames.toList(),
                isSelected: selectedMaps.contains,
                onSelect: (mapName) {
                  ref
                      .read(
                        matchesProvider(collectionId: collectionName).notifier,
                      )
                      .changeMaps(mapName);
                },
                labelFor: (option) => option,
              );
            },
          ),
        ),
        DrawerHeaderText(l10n.excludeMatches),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Consumer(
            builder: (context, ref, child) {
              final selectedFilter = ref.watch(
                matchesProvider(collectionId: collectionName).select(
                  (state) => state.filter,
                ),
              );
              return SegmentedButton<MatchUpFilter>(
                segments: [
                  for (final filter in MatchUpFilter.values)
                    ButtonSegment(
                      value: filter,
                      label: Text(
                        switch (filter) {
                          MatchUpFilter.styles => l10n.sameStyles,
                          MatchUpFilter.composition => l10n.sameComps,
                          MatchUpFilter.none => l10n.excludeNone,
                        },
                      ),
                    ),
                ],
                selected: {selectedFilter},
                onSelectionChanged: (filterSet) {
                  if (filterSet.isNotEmpty) {
                    ref
                        .read(
                          matchesProvider(collectionId: collectionName)
                              .notifier,
                        )
                        .changeMatchUpFilter(filterSet.first);
                  }
                },
              );
            },
          ),
        ),
        ...?trailing,
      ],
    );
  }
}
