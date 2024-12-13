import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/team_comps/provider/team_comps_provider.dart';

part 'team_comps_detail_provider.g.dart';

@riverpod
List<AgentComp> selectedAgentComps(
  Ref ref, {
  required String rosterName,
  required StylePoints stylePoints,
}) {
  final filteredCompositions = ref.watch(
    filteredCompositionsProvider(rosterName: rosterName),
  );
  return filteredCompositions
      .where((comp) => comp.stylePoints == stylePoints)
      .toList();
}
