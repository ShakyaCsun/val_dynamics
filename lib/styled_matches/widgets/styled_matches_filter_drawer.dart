import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/matches/matches.dart';
import 'package:vsdat/styled_matches/styled_matches.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyledMatchesFilterDrawer extends StatelessWidget {
  const StyledMatchesFilterDrawer({
    required this.collectionName,
    required this.highlightStyle,
    super.key,
  });

  final String collectionName;
  final StylePoints highlightStyle;

  @override
  Widget build(BuildContext context) {
    return MatchesFilterDrawer(
      collectionName: collectionName,
      trailing: [
        DrawerHeaderText(context.l10n.compositions),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Consumer(
            builder: (context, ref, child) {
              final compositions = ref.watch(
                styledMatchesProvider(
                  collectionId: collectionName,
                  acm: highlightStyle,
                ).select(
                  (value) => value.comps,
                ),
              );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  for (final comp in compositions)
                    CompositionsRow(comp: comp, iconSize: 40),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
