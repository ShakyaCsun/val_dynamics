import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

/// {@template agents_list_view}
/// Displays the provided [rosters] in a [ListView]
/// {@endtemplate}
class AgentsListView extends StatelessWidget {
  /// {@macro agents_list_view}
  const AgentsListView({
    required this.rosters,
    required this.onTap,
    required this.selectedRoster,
    super.key,
  });

  final List<AgentsOverview> rosters;
  final void Function(String rosterName) onTap;
  final String selectedRoster;

  @override
  Widget build(BuildContext context) {
    final rosterCount = rosters.length;
    return ListView.builder(
      itemCount: rosterCount + 1,
      itemBuilder: (context, index) {
        if (index < rosterCount) {
          final agents = rosters[index];
          return AgentsListTile(
            agentsDetail: agents,
            isSelected: selectedRoster == agents.rosterName,
            onTap: () {
              onTap(agents.rosterName);
            },
          );
        }
        if (index == rosterCount) {
          // Return an extra [SizedBox] at the end for FloatingActionButton.
          return const SizedBox(height: 80);
        }
        return null;
      },
    );
  }
}

class AgentsListTile extends StatelessWidget {
  const AgentsListTile({
    required this.agentsDetail,
    this.onTap,
    this.isSelected = false,
    super.key,
  });

  final AgentsOverview agentsDetail;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final AgentsOverview(:rosterName, :agentCount, :isBuiltIn, :range) =
        agentsDetail;
    final l10n = context.l10n;
    final rangeDetail = switch (range) {
      SinglePoint(:final total) => l10n.equalPoints(total),
      NearlyEqualPoints(:final total) => l10n.nearlyEqualPoints(total),
      VariedPointsRange(:final low, :final high, :final count) =>
        l10n.differentPointsRange(count, low, high),
    };
    final subtitle = '${l10n.nAgents(agentCount)}, $rangeDetail';
    final chipLabel = isSelected
        ? l10n.defaultLabel
        : isBuiltIn
        ? l10n.builtIn
        : null;

    return WidthConstrainedBox(
      child: ListTile(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(agentsDetail.rosterName),
            if (chipLabel != null) ...[
              const SizedBox(width: 8),
              Chip(label: Text(chipLabel)),
            ],
          ],
        ),
        subtitle: Text(subtitle),
        trailing: getTrailing(isSelected: isSelected, isBuiltIn: isBuiltIn),
        onTap: onTap,
      ),
    );
  }

  Widget? getTrailing({required bool isSelected, required bool isBuiltIn}) {
    if (isSelected && isBuiltIn) {
      return null;
    }
    return Consumer(
      builder: (context, ref, child) {
        final deleteButton = IconButton(
          onPressed: () {
            ref
                .read(agentsOverviewNotifierProvider.notifier)
                .removeRoster(agentsDetail.rosterName);
          },
          icon: const Icon(Icons.delete_outline),
        );
        final setDefaultButton = IconButton(
          onPressed: () {
            ref
                .read(agentsOverviewNotifierProvider.notifier)
                .changeDefaultRoster(agentsDetail.rosterName);
          },
          icon: const Icon(Icons.check_box_outlined),
        );
        return switch ((isSelected, isBuiltIn)) {
          (true, true) => const SizedBox.shrink(),
          (true, false) => deleteButton,
          (false, true) => setDefaultButton,
          (false, false) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [setDefaultButton, deleteButton],
          ),
        };
      },
    );
  }
}
