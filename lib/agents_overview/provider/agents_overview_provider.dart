import 'package:agents_repository/agents_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/app/app.dart';

part 'agents_overview_provider.g.dart';

@riverpod
class AgentsOverviewNotifier extends _$AgentsOverviewNotifier {
  @override
  AgentsOverviewState build() {
    final agentsRepository = ref.watch(agentsRepositoryProvider);
    final rosterSubscription = agentsRepository.getRosters().listen((rosters) {
      final agentDetails =
          rosters.entries.map((entry) {
            final MapEntry(key: name, value: agents) = entry;
            return AgentsOverview(
              rosterName: name,
              agentCount: agents.length,
              range: PointsRange.from(agents: agents),
              isBuiltIn: agentsRepository.builtInRosterNames.contains(name),
            );
          }).toList();
      state = state.copyWith(agentDetails: agentDetails);
    });
    final defaultNameSubscription = agentsRepository.defaultName.listen((name) {
      state = state.copyWith(defaultRosterName: name);
    });
    ref.onDispose(() {
      rosterSubscription.cancel();
      defaultNameSubscription.cancel();
    });

    return const AgentsOverviewState(agentDetails: [], defaultRosterName: '');
  }

  void changeDefaultRoster(String name) {
    ref.read(agentsRepositoryProvider).changeDefaultRoster(name);
  }

  Future<String> addRoster(Agents roster, String name) async {
    return ref.read(agentsRepositoryProvider).addNewAgentRoster(roster, name);
  }

  Future<void> removeRoster(String name) async {
    await ref.read(agentsRepositoryProvider).deleteAgentRoster(name);
  }
}

class AgentsOverviewState extends Equatable {
  const AgentsOverviewState({
    required this.agentDetails,
    required this.defaultRosterName,
  });

  final List<AgentsOverview> agentDetails;
  final String defaultRosterName;

  List<String> get availableRosters {
    return agentDetails.map((e) {
      return e.rosterName;
    }).toList();
  }

  AgentsOverviewState copyWith({
    List<AgentsOverview>? agentDetails,
    String? defaultRosterName,
  }) {
    return AgentsOverviewState(
      agentDetails: agentDetails ?? this.agentDetails,
      defaultRosterName: defaultRosterName ?? this.defaultRosterName,
    );
  }

  @override
  List<Object> get props => [defaultRosterName, agentDetails];
}

@Riverpod(keepAlive: true)
AgentsRepository agentsRepository(Ref ref) {
  final repository = AgentsRepository.basic(
    agentsCsvs: {
      ...ref.watch(bundledAgentsProvider),
      'Guessing (+Waylay)': Agents([...Agents.defaultRoster, Agent.waylay]),
    },
  );
  ref.onDispose(repository.dispose);
  return repository;
}

@riverpod
String defaultRosterName(Ref ref) {
  return ref.watch(
    agentsOverviewNotifierProvider.select((value) => value.defaultRosterName),
  );
}

@riverpod
List<String> availableRosters(Ref ref) {
  return ref.watch(
    agentsOverviewNotifierProvider.select((value) => value.availableRosters),
  );
}
