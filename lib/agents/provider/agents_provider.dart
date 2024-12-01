import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';

part 'agents_provider.g.dart';

@Riverpod(dependencies: [])
String rosterName(Ref ref) {
  throw UnimplementedError('rosterNameProvider not initialized properly.');
}

@riverpod
Agents agents(Ref ref, {required String rosterName}) {
  return ref.watch(agentsRepositoryProvider).getAgents(name: rosterName);
}

@riverpod
class SelectedAgent extends _$SelectedAgent {
  @override
  Agent? build({required String rosterName}) {
    return null;
  }

  void change(Agent? agent) {
    if (state == agent) {
      // Force re-render if user selects the same agent again.
      state = null;
    }
    state = agent;
  }
}
