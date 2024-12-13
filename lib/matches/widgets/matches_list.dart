import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class MatchesList extends StatelessWidget {
  const MatchesList({required this.matchesByStyle, super.key});

  final Map<StylePoints, ValorantMatches> matchesByStyle;

  @override
  Widget build(BuildContext context) {
    final sortedMatches = matchesByStyle.entries.sortedBy<MatchesComparator>((
      element,
    ) {
      return element.value.compareKey;
    });
    return ListView.builder(
      itemBuilder: (context, index) {
        final MapEntry(key: style, value: matches) = sortedMatches[index];
        return ExpansionTile(
          title: Text(style.acm),
          children: [for (final match in matches) MatchTile(match: match)],
        );
      },
      itemCount: sortedMatches.length,
    );
  }
}
