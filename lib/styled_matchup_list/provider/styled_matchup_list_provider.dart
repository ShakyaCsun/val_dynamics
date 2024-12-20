import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/matches/matches.dart';

part 'styled_matchup_list_provider.g.dart';

@riverpod
ValorantMatches styledMatchupList(
  Ref ref, {
  required String collectionId,
  required StylePoints acm,
  required StylePoints opponentAcm,
}) {
  final matches = ref.watch(
    matchesProvider(collectionId: collectionId).select(
      (value) =>
          [...(value.matchesByStyle[acm] ?? ValorantMatches([]))]
            ..retainWhere((element) => element.stylePoints2 == opponentAcm),
    ),
  );
  return ValorantMatches(matches);
}
