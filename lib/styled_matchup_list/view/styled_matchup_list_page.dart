import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat/styled_matchup_list/styled_matchup_list.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyledMatchupListPage extends StatelessWidget {
  const StyledMatchupListPage({
    required this.collectionName,
    required this.acm,
    required this.opponentAcm,
    super.key,
  });

  final String collectionName;
  final StylePoints acm;
  final StylePoints opponentAcm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.stylisticMatchupLabel(acm.acm, opponentAcm.acm),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final matches = ref.watch(
            styledMatchupListProvider(
              collectionId: collectionName,
              acm: acm,
              opponentAcm: opponentAcm,
            ),
          );
          return MatchesListView(matches: matches);
        },
      ),
    );
  }
}
