import 'package:flutter/material.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches_overview/matches_overview.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesCollectionTile extends StatelessWidget {
  const MatchesCollectionTile({
    required this.collection,
    required this.onTap,
    required this.rosterNames,
    required this.onRosterChange,
    super.key,
  });

  final MatchesCollection collection;
  final VoidCallback onTap;
  final List<String> rosterNames;
  final RosterChangeCallback onRosterChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(collection.collectionName),
      subtitle: Text(context.l10n.nMatches(collection.matchesCount)),
      trailing: RosterSelectButton(
        rosterNames: rosterNames,
        selectedRoster: collection.rosterName,
        onChange: onRosterChange,
      ),
    );
  }
}
