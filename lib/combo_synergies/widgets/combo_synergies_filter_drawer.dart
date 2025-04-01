import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/combo_synergies/combo_synergies.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches/provider/matches_provider.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ComboSynergiesFilterDrawer extends StatelessWidget {
  const ComboSynergiesFilterDrawer({required this.collectionName, super.key});

  final String collectionName;

  static const List<(Role, Role)> allRoleCombos = [
    (Role.unknown, Role.unknown),
    (Role.duelist, Role.unknown),
    (Role.initiator, Role.unknown),
    (Role.sentinel, Role.unknown),
    (Role.controller, Role.unknown),
    (Role.duelist, Role.duelist),
    (Role.duelist, Role.initiator),
    (Role.duelist, Role.sentinel),
    (Role.duelist, Role.controller),
    (Role.initiator, Role.initiator),
    (Role.initiator, Role.sentinel),
    (Role.initiator, Role.controller),
    (Role.sentinel, Role.sentinel),
    (Role.sentinel, Role.controller),
    (Role.controller, Role.controller),
  ];

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
                comboSynergyFilterProvider(
                  collectionId: collectionName,
                ).select((state) => state.selectedMaps),
              );
              return FilterChipsWrap(
                options: mapNames.toList(),
                isSelected: selectedMaps.contains,
                onSelect: (mapName) {
                  ref
                      .read(
                        comboSynergyFilterProvider(
                          collectionId: collectionName,
                        ).notifier,
                      )
                      .toggleMap(mapName);
                },
                labelFor: (option) => option,
              );
            },
          ),
        ),
        DrawerHeaderText(l10n.comboNonMirrorCriteria),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Consumer(
            builder: (context, ref, child) {
              final selectedFilter = ref.watch(
                comboSynergyFilterProvider(
                  collectionId: collectionName,
                ).select((state) => state.comboCriteria),
              );
              return SegmentedButton<ComboCriteria>(
                segments: [
                  for (final filter in ComboCriteria.values)
                    ButtonSegment(
                      value: filter,
                      tooltip: switch (filter) {
                        ComboCriteria.solo => l10n.soloCriteriaTooltip,
                        ComboCriteria.composite =>
                          l10n.compositeCriteriaTooltip,
                      },
                      label: Text(switch (filter) {
                        ComboCriteria.solo => 'Solo',
                        ComboCriteria.composite => 'Composite',
                      }),
                    ),
                ],
                selected: {selectedFilter},
                onSelectionChanged: (filterSet) {
                  if (filterSet.isNotEmpty) {
                    ref
                        .read(
                          comboSynergyFilterProvider(
                            collectionId: collectionName,
                          ).notifier,
                        )
                        .changeComboCriteria(filterSet.first);
                  }
                },
              );
            },
          ),
        ),
        DrawerHeaderText(l10n.winRateFilter),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Consumer(
            builder: (context, ref, child) {
              final selectedFilter = ref.watch(
                comboSynergyFilterProvider(
                  collectionId: collectionName,
                ).select((state) => state.winLossFilter),
              );
              return SegmentedButton<WinLossFilter>(
                segments: [
                  for (final filter in WinLossFilter.values)
                    ButtonSegment(
                      value: filter,
                      tooltip: switch (filter) {
                        WinLossFilter.winning => l10n.winningFilterTooltip,
                        WinLossFilter.losing => l10n.losingFilterTooltip,
                        WinLossFilter.all => l10n.allCombosFilterTooltip,
                      },
                      label: Text(switch (filter) {
                        WinLossFilter.winning => '>=50%',
                        WinLossFilter.losing => '<50%',
                        WinLossFilter.all => 'All',
                      }),
                    ),
                ],
                selected: {selectedFilter},
                onSelectionChanged: (filterSet) {
                  if (filterSet.isNotEmpty) {
                    ref
                        .read(
                          comboSynergyFilterProvider(
                            collectionId: collectionName,
                          ).notifier,
                        )
                        .changeWinLossFilter(filterSet.first);
                  }
                },
              );
            },
          ),
        ),
        DrawerHeaderText(l10n.roleComboFilter),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Consumer(
            builder: (context, ref, child) {
              return DropdownButtonFormField<(Role, Role)>(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                value: ref.watch(
                  comboSynergyFilterProvider(
                    collectionId: collectionName,
                  ).select((state) => state.rolesCombo),
                ),
                items:
                    allRoleCombos.map((roleCombo) {
                      final roleComboText = switch (roleCombo) {
                        (Role.unknown, Role.unknown) => 'All',
                        (final role, Role.unknown) => '${role.value}-All',
                        (final roleA, final roleB) =>
                          '${roleA.value}-${roleB.value}',
                      };
                      return DropdownMenuItem(
                        value: roleCombo,
                        child: Text(roleComboText),
                      );
                    }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    ref
                        .read(
                          comboSynergyFilterProvider(
                            collectionId: collectionName,
                          ).notifier,
                        )
                        .changeRoleCombo(value);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
