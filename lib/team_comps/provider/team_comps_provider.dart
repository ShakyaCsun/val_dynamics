import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/agents/agents.dart';
import 'package:vsdat/constants.dart';
import 'package:vsdat/team_comps/team_comps.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

part 'team_comps_provider.freezed.dart';
part 'team_comps_provider.g.dart';

extension AgentCompStylesExtension on Iterable<AgentComp> {
  int get stylesCount => {...map((comp) => comp.stylePoints)}.length;
}

@riverpod
Iterable<AgentComp> filteredCompositions(
  Ref ref, {
  required String rosterName,
}) {
  final filters = ref.watch(compFiltersProvider(rosterName: rosterName));
  final compositions = ref.watch(compositionsProvider(rosterName: rosterName));
  return switch (compositions) {
    AsyncData(value: CompositionsState(:final allCompositions)) =>
      filters.apply(allCompositions),
    _ => throw StateError('compositionsProvider not ready'),
  };
}

@riverpod
Map<AgentCompsTernaryData, TernaryPoint> teamCompsTernaryData(
  Ref ref, {
  required String rosterName,
}) {
  final filters = ref.watch(compFiltersProvider(rosterName: rosterName));
  if (filters.hasDefaultFilters) {
    return ref.watch(
      compositionsProvider(
        rosterName: rosterName,
      ).select((value) => value.requireValue.ternaryData),
    );
  }
  return ref.watch(
    filteredCompositionsProvider(
      rosterName: rosterName,
    ).select((value) => value.asTernaryData),
  );
}

@riverpod
bool compositionsReady(Ref ref, {required String rosterName}) {
  return ref.watch(
    compositionsProvider(rosterName: rosterName).select<bool>((value) {
      return switch (value) {
        AsyncData() => true,
        _ => false,
      };
    }),
  );
}

@riverpod
class Compositions extends _$Compositions {
  @override
  Future<CompositionsState> build({required String rosterName}) async {
    final agents = ref.watch(agentsProvider(rosterName: rosterName));
    ref.onDispose(() {
      _subscription?.cancel();
    });
    if (isRunningJs) {
      // If on web, stream the agents loading to try and mitigate UI freeze
      listenSelf((previous, next) {
        switch ((previous, next)) {
          case (AsyncLoading(), AsyncData()):
            _animateComps();
          default:
            break;
        }
      });
      return CompositionsState.empty(agents: agents);
    }

    return CompositionsState.initial(agents: agents);
  }

  StreamSubscription<List<AgentComp>>? _subscription;

  void _animateComps() {
    final oldState = state.requireValue.copyWith();
    _subscription = oldState.fillComps().listen((event) {
      final compState = state.requireValue;
      state = AsyncData(
        compState.copyWith(
          allCompositions: [...compState.allCompositions, ...event],
        ),
      );
    });
  }
}

List<AgentComp> generateAllComps(Agents agents) {
  return <AgentComp>[
    for (final (one, agent1) in agents.indexed)
      for (final (two, agent2) in agents.skip(one + 1).indexed)
        for (final (three, agent3) in agents.skip(one + two + 2).indexed)
          for (final (four, agent4)
              in agents.skip(one + two + three + 3).indexed)
            for (final agent5 in agents.skip(one + two + three + four + 4))
              AgentComp(agent1, agent2, agent3, agent4, agent5),
  ];
}

@freezed
abstract class CompositionsState with _$CompositionsState {
  factory CompositionsState({
    required Agents agents,
    required List<AgentComp> allCompositions,
  }) = _CompositionsState;

  CompositionsState._();

  factory CompositionsState.empty({required Agents agents}) {
    return CompositionsState(agents: agents, allCompositions: []);
  }

  static Future<CompositionsState> initial({required Agents agents}) async {
    final allCompositions = await compute(generateAllComps, agents);
    return CompositionsState(agents: agents, allCompositions: allCompositions);
  }

  Stream<List<AgentComp>> fillComps({int atEvery = 1000}) async* {
    var i = 0;
    final comps = <AgentComp>[];
    for (final (one, agent1) in agents.indexed) {
      for (final (two, agent2) in agents.skip(one + 1).indexed) {
        for (final (three, agent3) in agents.skip(one + two + 2).indexed) {
          for (final (four, agent4)
              in agents.skip(one + two + three + 3).indexed) {
            for (final agent5 in agents.skip(one + two + three + four + 4)) {
              i++;
              comps.add(AgentComp(agent1, agent2, agent3, agent4, agent5));
              if (i % atEvery == 0) {
                yield comps;
                await Future<void>.delayed(Duration.zero);
                comps.clear();
              }
            }
          }
        }
      }
    }
    yield comps;
  }

  @override
  late final Map<AgentCompsTernaryData, TernaryPoint> ternaryData =
      allCompositions.asTernaryData;
}

@freezed
abstract class RoleRange with _$RoleRange {
  @Assert('min >= 0 && min <= 5', 'min value must be between 0 to 5.')
  @Assert('max >= 0 && max <= 5', 'max value must be between 0 to 5.')
  @Assert('min <= max', 'min value cannot be more than max.')
  const factory RoleRange({required int min, required int max}) = _RoleRange;

  const RoleRange._();

  static const all = RoleRange(min: 0, max: 5);

  bool isInRange(int count) {
    return count >= min && count <= max;
  }
}
