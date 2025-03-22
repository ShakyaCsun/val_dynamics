import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/add_agents/view/add_agents_page.dart';
import 'package:vsdat/add_matches/view/add_matches_page.dart';
import 'package:vsdat/agent_combo_matches/view/agent_combo_matches_page.dart';
import 'package:vsdat/agents/view/agents_page.dart';
import 'package:vsdat/agents_overview/view/agents_overview_page.dart';
import 'package:vsdat/agents_stats/view/agents_stats_page.dart';
import 'package:vsdat/app/view/app.dart';
import 'package:vsdat/app_router/pages.dart';
import 'package:vsdat/combo_synergies/view/combo_synergies_page.dart';
import 'package:vsdat/matches/view/matches_page.dart';
import 'package:vsdat/matches_overview/view/matches_overview_page.dart';
import 'package:vsdat/matches_stats/view/matches_stats_page.dart';
import 'package:vsdat/styled_matches/view/styled_matches_page.dart';
import 'package:vsdat/styled_matches_list/view/styled_matches_list_page.dart';
import 'package:vsdat/styled_matchup_list/view/styled_matchup_list_page.dart';
import 'package:vsdat/team_comps/view/team_comps_page.dart';
import 'package:vsdat/team_comps/widgets/team_comps_filter.dart';
import 'package:vsdat/team_comps_detail/view/team_comps_detail_page.dart';

part 'routes.g.dart';

extension GoRouterStateX on BuildContext {
  String? get compRosterName {
    return GoRouterState.of(this).pathParameters['rosterName'];
  }

  String? get collectionName {
    return GoRouterState.of(this).pathParameters['collectionName'];
  }
}

@immutable
@TypedGoRoute<TeamCompsRedirectRoute>(path: '/comps')
class TeamCompsRedirectRoute extends GoRouteData {
  const TeamCompsRedirectRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Center(child: Text('Please do not build this'));
  }
}

@TypedShellRoute<HomeScreenRoute>(
  routes: [
    TypedGoRoute<AgentsOverviewRoute>(
      path: '/',
      routes: [
        TypedGoRoute<AddAgentsRoute>(path: 'agents/add'),
        TypedGoRoute<AgentsRoute>(
          path: 'agents/:rosterName',
          routes: [TypedGoRoute<AgentsStatRoute>(path: 'stats')],
        ),
      ],
    ),
    TypedGoRoute<TeamCompsRoute>(
      path: '/comps/:rosterName',
      routes: [
        TypedGoRoute<TeamCompsFilterRoute>(path: 'filter'),
        TypedGoRoute<TeamCompsDetailRoute>(path: 'details/:acm'),
      ],
    ),
    TypedGoRoute<MatchesOverviewRoute>(
      path: '/matches',
      routes: [
        TypedGoRoute<AddMatchesRoute>(path: 'add'),
        TypedGoRoute<MatchesRoute>(
          path: ':collectionName',
          routes: [
            TypedGoRoute<ComboSynergiesRoute>(
              path: 'synergies',
              routes: [
                TypedGoRoute<AgentComboMatchesRoute>(path: ':comboName'),
              ],
            ),
            TypedGoRoute<MatchesStatsRoute>(path: 'stats'),
            TypedGoRoute<StyledMatchesRoute>(
              path: 'acm/:acm',
              routes: [
                TypedGoRoute<StyledMatchesListRoute>(path: 'matches'),
                TypedGoRoute<StyledMatchupListRoute>(path: 'vs/:opponentAcm'),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
)
@immutable
class HomeScreenRoute extends ShellRouteData {
  const HomeScreenRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return ValSD2HomeScreen(child: navigator);
  }
}

@immutable
class AgentsRoute extends GoRouteData {
  const AgentsRoute({required this.rosterName});

  final String rosterName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AgentsPage(rosterName: rosterName);
  }
}

@immutable
class AgentsStatRoute extends GoRouteData {
  const AgentsStatRoute({required this.rosterName});

  final String rosterName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AgentsStatsPage(rosterName: rosterName);
  }
}

@immutable
class AddAgentsRoute extends GoRouteData {
  const AddAgentsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddAgentsPage();
  }
}

@immutable
class AgentsOverviewRoute extends GoRouteData {
  const AgentsOverviewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AgentsOverviewPage();
  }
}

@immutable
class MatchesOverviewRoute extends GoRouteData {
  const MatchesOverviewRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MatchesOverviewPage();
  }
}

@immutable
class MatchesRoute extends GoRouteData {
  const MatchesRoute({required this.collectionName});

  final String collectionName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MatchesPage(collectionName: collectionName);
  }
}

@immutable
class AddMatchesRoute extends GoRouteData {
  const AddMatchesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddMatchesPage();
  }
}

@immutable
class ComboSynergiesRoute extends GoRouteData {
  const ComboSynergiesRoute({required this.collectionName});

  final String collectionName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ComboSynergiesPage(collectionName: collectionName);
  }
}

@immutable
class AgentComboMatchesRoute extends GoRouteData {
  @visibleForTesting
  const AgentComboMatchesRoute({
    required this.collectionName,
    required this.comboName,
  });

  AgentComboMatchesRoute.safe({
    required this.collectionName,
    required (Agent, Agent) agentCombo,
  }) : comboName = agentCombo.comboName;

  final String collectionName;
  final String comboName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AgentComboMatchesPage(
      collectionName: collectionName,
      comboName: comboName,
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    if (comboName.split('-') case [_, _]) {
      return null;
    }
    return ComboSynergiesRoute(collectionName: collectionName).location;
  }
}

@immutable
class MatchesStatsRoute extends GoRouteData {
  const MatchesStatsRoute({required this.collectionName});

  final String collectionName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MatchesStatsPage(collectionName: collectionName);
  }
}

@immutable
class StyledMatchesRoute extends GoRouteData {
  @visibleForTesting
  const StyledMatchesRoute(this.collectionName, this.acm);

  StyledMatchesRoute.safe({
    required this.collectionName,
    required StylePoints acm,
  }) : acm = AcmString.fromStyles(acm);

  final String collectionName;
  final String acm;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StyledMatchesPage(
      collectionName: collectionName,
      stylePoints: AcmString(acm).stylePoints,
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    try {
      final _ = AcmString(acm);
    } on InvalidFormatException {
      return MatchesRoute(collectionName: collectionName).location;
    }
    return null;
  }
}

@immutable
class StyledMatchesListRoute extends GoRouteData {
  @visibleForTesting
  const StyledMatchesListRoute(this.collectionName, this.acm);

  StyledMatchesListRoute.safe({
    required this.collectionName,
    required StylePoints acm,
  }) : acm = AcmString.fromStyles(acm);

  final String collectionName;
  final String acm;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StyledMatchesListPage(
      collectionName: collectionName,
      stylePoints: AcmString(acm).stylePoints,
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    try {
      final _ = AcmString(acm);
    } on InvalidFormatException {
      return MatchesRoute(collectionName: collectionName).location;
    }
    return null;
  }
}

@immutable
class StyledMatchupListRoute extends GoRouteData {
  @visibleForTesting
  const StyledMatchupListRoute({
    required this.collectionName,
    required this.acm,
    required this.opponentAcm,
  });

  StyledMatchupListRoute.safe({
    required this.collectionName,
    required StylePoints acm,
    required StylePoints opponentAcm,
  }) : acm = AcmString.fromStyles(acm),
       opponentAcm = AcmString.fromStyles(opponentAcm);

  final String collectionName;
  final String acm;
  final String opponentAcm;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return StyledMatchupListPage(
      collectionName: collectionName,
      acm: AcmString(acm).stylePoints,
      opponentAcm: AcmString(opponentAcm).stylePoints,
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    try {
      final _ = AcmString(opponentAcm);
    } on InvalidFormatException {
      try {
        final acmString = AcmString(acm);
        return StyledMatchesRoute(collectionName, acmString).location;
      } on InvalidFormatException {
        return MatchesRoute(collectionName: collectionName).location;
      }
    }
    return null;
  }
}

@immutable
class TeamCompsRoute extends GoRouteData {
  const TeamCompsRoute({required this.rosterName});

  final String rosterName;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TeamCompsPage(rosterName: rosterName);
  }
}

class TeamCompsFilterRoute extends GoRouteData {
  const TeamCompsFilterRoute({required this.rosterName});

  final String rosterName;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return ModalBottomSheetPage(
      builder: (context) => const TeamCompsFilterSheetView(),
      isScrollControlled: true,
    );
  }
}

@immutable
class TeamCompsDetailRoute extends GoRouteData {
  @visibleForTesting
  const TeamCompsDetailRoute({required this.rosterName, required this.acm});

  TeamCompsDetailRoute.safe({
    required this.rosterName,
    required StylePoints acm,
  }) : acm = AcmString.fromStyles(acm);

  final String rosterName;
  final String acm;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return TeamCompsDetailPage(
      rosterName: rosterName,
      stylePoints: AcmString(acm).stylePoints,
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    try {
      final _ = AcmString(acm);
    } on InvalidFormatException {
      return TeamCompsRoute(rosterName: rosterName).location;
    }
    return null;
  }
}
