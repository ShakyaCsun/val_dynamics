import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';
import 'package:url_launcher/link.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/combo_synergies/combo_synergies.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ComboSynergiesPage extends StatelessWidget {
  const ComboSynergiesPage({required this.collectionName, super.key});

  final String collectionName;

  @override
  Widget build(BuildContext context) {
    return SimpleProvider<String>(
      value: collectionName,
      child: Scaffold(
        appBar: AppBar(title: Text('$collectionName Agent Combo Synergies')),
        body: const ComboSynergiesBody(),
        drawer:
            context.showStandardDrawer
                ? null
                : ComboSynergiesFilterDrawer(collectionName: collectionName),
      ),
    );
  }
}

/// Requires [SimpleProvider] to provide the collectionName of matches
class ComboSynergiesBody extends StatelessWidget {
  @visibleForTesting
  const ComboSynergiesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final collectionName = context.getProperty<String>();
    return Row(
      children: [
        if (context.showStandardDrawer)
          ColoredBox(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            child: ComboSynergiesFilterDrawer(collectionName: collectionName),
          ),
        const DefaultTabController(
          length: 2,
          child: Expanded(
            child: Column(
              children: [
                TabBar(tabs: [Tab(text: 'Triangle'), Tab(text: 'Table')]),
                Expanded(
                  child: TabBarView(
                    children: [ComboSynergiesTriangle(), ComboSynergiesTable()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ComboSynergiesTriangle extends StatelessWidget {
  const ComboSynergiesTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    final collectionName = context.getProperty<String>();
    return Stack(
      children: [
        TernaryPlotHoverInfo<ComboData>(
          maxItems: 10,
          builder: (
            BuildContext context,
            void Function(List<ComboData>) hoveredItemsChanged,
          ) {
            return Consumer(
              builder: (context, ref, child) {
                final plotData = ref.watch(
                  comboSynergiesProvider(
                    collectionId: collectionName,
                  ).select((state) => state.plotData),
                );
                return StyleTriangle(
                  data: plotData,
                  onHover: hoveredItemsChanged,
                  onTap: (points) {
                    final ComboData(:agentOne, :agentTwo) = points.first;
                    AgentComboMatchesRoute.safe(
                      collectionName: collectionName,
                      agentCombo: (agentOne, agentTwo),
                    ).go(context);
                  },
                  builder: (comboData, _) {
                    return ComboAgentIndicator(comboData: comboData);
                  },
                );
              },
            );
          },
          itemBuilder: (comboData) {
            return HoveredSynergyStatCard(comboData: comboData);
          },
        ),
        const Positioned(top: 16, left: 16, child: AutoFilterButton()),
      ],
    );
  }
}

/// Requires [SimpleProvider] to provide the collectionName of matches
class ComboSynergiesTable extends StatefulWidget {
  @visibleForTesting
  const ComboSynergiesTable({super.key});

  @override
  State<ComboSynergiesTable> createState() => _ComboSynergiesTableState();
}

class _ComboSynergiesTableState extends State<ComboSynergiesTable> {
  late final ScrollController horizontalController;
  late final ScrollController verticalController;

  @override
  void initState() {
    super.initState();
    horizontalController = ScrollController();
    verticalController = ScrollController();
  }

  @override
  void dispose() {
    horizontalController.dispose();
    verticalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final collectionName = context.getProperty<String>();
    return Consumer(
      builder: (context, ref, child) {
        final tableData = ref.watch(
          sortedComboSynergiesListProvider(collectionId: collectionName),
        );
        return Scrollbar(
          controller: verticalController,
          scrollbarOrientation: ScrollbarOrientation.right,
          child: Scrollbar(
            controller: horizontalController,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: TableView.builder(
              horizontalDetails: ScrollableDetails.horizontal(
                controller: horizontalController,
              ),
              verticalDetails: ScrollableDetails.vertical(
                controller: verticalController,
              ),
              pinnedRowCount: 1,
              pinnedColumnCount: 1,
              columnCount: 8,
              rowCount: tableData.length + 1,
              columnBuilder: (index) {
                final borderColor =
                    Theme.of(context).colorScheme.outlineVariant;
                return TableSpan(
                  foregroundDecoration: TableSpanDecoration(
                    border: SpanBorder(
                      trailing: BorderSide(color: borderColor),
                    ),
                  ),
                  extent: const MaxSpanExtent(
                    FixedSpanExtent(200),
                    FractionalSpanExtent(1 / 9),
                  ),
                );
              },
              rowBuilder: (index) {
                if (index == 0) {
                  final borderColor =
                      Theme.of(context).colorScheme.outlineVariant;
                  return TableSpan(
                    foregroundDecoration: TableSpanDecoration(
                      border: TableSpanBorder(
                        trailing: BorderSide(width: 2, color: borderColor),
                      ),
                    ),
                    extent: const FixedSpanExtent(64),
                  );
                }
                final evenColor =
                    Theme.of(context).colorScheme.surfaceContainer;
                return TableSpan(
                  backgroundDecoration: TableSpanDecoration(
                    color: index.isOdd ? evenColor : null,
                  ),
                  extent: const FixedSpanExtent(60),
                );
              },
              cellBuilder: (context, vicinity) {
                final TableVicinity(:row, :column) = vicinity;
                if (row == 0) {
                  final textStyle = Theme.of(context).textTheme.labelLarge;
                  return switch (column) {
                    0 => CenteredTableViewCell(
                      child: Text('Agent Combo', style: textStyle),
                    ),
                    1 => CenteredTableViewCell(
                      child: const SynergySortHeader(
                        label: 'Combo NMRWR',
                        sort: SynergySort.comboWR,
                      ),
                    ),
                    2 => CenteredTableViewCell(
                      child: const SynergySortHeader(
                        label: 'Rounds Won/Played',
                        sort: SynergySort.rounds,
                      ),
                    ),
                    3 => CenteredTableViewCell(
                      child: Text('Agent 1 NMRWR', style: textStyle),
                    ),
                    4 => CenteredTableViewCell(
                      child: const SynergySortHeader(
                        label: 'Agent 1 Synergy',
                        sort: SynergySort.synergy,
                      ),
                    ),
                    5 => CenteredTableViewCell(
                      child: Text('Agent 2 NMRWR', style: textStyle),
                    ),
                    6 => CenteredTableViewCell(
                      child: Text('Agent 2 Synergy', style: textStyle),
                    ),
                    7 => CenteredTableViewCell(
                      child: const SynergySortHeader(
                        label: 'Combined Synergy',
                        sort: SynergySort.combinedSynergy,
                      ),
                    ),
                    _ =>
                      throw StateError(
                        'Number of Columns is more than expected',
                      ),
                  };
                }
                final ComboSynergyTableData(
                  combo: (agentOne, agentTwo),
                  :comboNmrwr,
                  :comboRounds,
                  :agent1Nmrwr,
                  :agent1Synergy,
                  :agent2Nmrwr,
                  :agent2Synergy,
                  :combinedSynergy,
                ) = tableData[row - 1];
                return switch (column) {
                  0 => CenteredTableViewCell(
                    child: Link(
                      uri: Uri(
                        path:
                            AgentComboMatchesRoute.safe(
                              collectionName: collectionName,
                              agentCombo: (agentOne, agentTwo),
                            ).location,
                      ),
                      builder:
                          (context, followLink) => GestureDetector(
                            onTap: followLink,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AgentIndicator(agent: agentOne, radius: 24),
                                const Text(' - '),
                                AgentIndicator(agent: agentTwo, radius: 24),
                              ],
                            ),
                          ),
                    ),
                  ),
                  1 => CenteredTableViewCell(child: Text(comboNmrwr)),
                  2 => CenteredTableViewCell(child: Text(comboRounds)),
                  3 => CenteredTableViewCell(child: Text(agent1Nmrwr)),
                  4 => CenteredTableViewCell(child: Text(agent1Synergy)),
                  5 => CenteredTableViewCell(child: Text(agent2Nmrwr)),
                  6 => CenteredTableViewCell(child: Text(agent2Synergy)),
                  7 => CenteredTableViewCell(child: Text(combinedSynergy)),
                  _ =>
                    throw StateError('Number of Columns is more than expected'),
                };
              },
            ),
          ),
        );
      },
    );
  }
}

class CenteredTableViewCell extends TableViewCell {
  CenteredTableViewCell({required Widget child, super.key})
    : super(child: Center(child: child));
}

class SynergySortHeader extends ConsumerWidget {
  @visibleForTesting
  const SynergySortHeader({required this.label, required this.sort, super.key});

  final String label;
  final SynergySort sort;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      comboSynergySortProvider.select((value) => value == sort),
    );
    return SortableTableHeader(
      label: label,
      selected: isSelected,
      onTap: () {
        ref.read(comboSynergySortProvider.notifier).changeSort(sort);
      },
    );
  }
}
