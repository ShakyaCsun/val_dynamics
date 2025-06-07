// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$teamCompsRedirectRoute, $homeScreenRoute];

RouteBase get $teamCompsRedirectRoute => GoRouteData.$route(
  path: '/comps',

  factory: _$TeamCompsRedirectRoute._fromState,
);

mixin _$TeamCompsRedirectRoute on GoRouteData {
  static TeamCompsRedirectRoute _fromState(GoRouterState state) =>
      const TeamCompsRedirectRoute();

  String get location => GoRouteData.$location('/comps');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeScreenRoute => ShellRouteData.$route(
  factory: $HomeScreenRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/',

      factory: _$AgentsOverviewRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'agents/add',

          factory: _$AddAgentsRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'agents/:rosterName',

          factory: _$AgentsRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'stats',

              factory: _$AgentsStatRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/comps/:rosterName',

      factory: _$TeamCompsRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'filter',

          factory: _$TeamCompsFilterRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'details/:acm',

          factory: _$TeamCompsDetailRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/matches',

      factory: _$MatchesOverviewRoute._fromState,
      routes: [
        GoRouteData.$route(path: 'add', factory: _$AddMatchesRoute._fromState),
        GoRouteData.$route(
          path: ':collectionName',

          factory: _$MatchesRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'synergies',

              factory: _$ComboSynergiesRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: ':comboName',

                  factory: _$AgentComboMatchesRoute._fromState,
                ),
              ],
            ),
            GoRouteData.$route(
              path: 'stats',

              factory: _$MatchesStatsRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'acm/:acm',

              factory: _$StyledMatchesRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'matches',

                  factory: _$StyledMatchesListRoute._fromState,
                ),
                GoRouteData.$route(
                  path: 'vs/:opponentAcm',

                  factory: _$StyledMatchupListRoute._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) =>
      const HomeScreenRoute();
}

mixin _$AgentsOverviewRoute on GoRouteData {
  static AgentsOverviewRoute _fromState(GoRouterState state) =>
      const AgentsOverviewRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$AddAgentsRoute on GoRouteData {
  static AddAgentsRoute _fromState(GoRouterState state) =>
      const AddAgentsRoute();

  String get location => GoRouteData.$location('/agents/add');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$AgentsRoute on GoRouteData {
  static AgentsRoute _fromState(GoRouterState state) =>
      AgentsRoute(rosterName: state.pathParameters['rosterName']!);

  AgentsRoute get _self => this as AgentsRoute;

  String get location =>
      GoRouteData.$location('/agents/${Uri.encodeComponent(_self.rosterName)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$AgentsStatRoute on GoRouteData {
  static AgentsStatRoute _fromState(GoRouterState state) =>
      AgentsStatRoute(rosterName: state.pathParameters['rosterName']!);

  AgentsStatRoute get _self => this as AgentsStatRoute;

  String get location => GoRouteData.$location(
    '/agents/${Uri.encodeComponent(_self.rosterName)}/stats',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$TeamCompsRoute on GoRouteData {
  static TeamCompsRoute _fromState(GoRouterState state) =>
      TeamCompsRoute(rosterName: state.pathParameters['rosterName']!);

  TeamCompsRoute get _self => this as TeamCompsRoute;

  String get location =>
      GoRouteData.$location('/comps/${Uri.encodeComponent(_self.rosterName)}');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$TeamCompsFilterRoute on GoRouteData {
  static TeamCompsFilterRoute _fromState(GoRouterState state) =>
      TeamCompsFilterRoute(rosterName: state.pathParameters['rosterName']!);

  TeamCompsFilterRoute get _self => this as TeamCompsFilterRoute;

  String get location => GoRouteData.$location(
    '/comps/${Uri.encodeComponent(_self.rosterName)}/filter',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$TeamCompsDetailRoute on GoRouteData {
  static TeamCompsDetailRoute _fromState(GoRouterState state) =>
      TeamCompsDetailRoute(
        rosterName: state.pathParameters['rosterName']!,
        acm: state.pathParameters['acm']!,
      );

  TeamCompsDetailRoute get _self => this as TeamCompsDetailRoute;

  String get location => GoRouteData.$location(
    '/comps/${Uri.encodeComponent(_self.rosterName)}/details/${Uri.encodeComponent(_self.acm)}',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$MatchesOverviewRoute on GoRouteData {
  static MatchesOverviewRoute _fromState(GoRouterState state) =>
      const MatchesOverviewRoute();

  String get location => GoRouteData.$location('/matches');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$AddMatchesRoute on GoRouteData {
  static AddMatchesRoute _fromState(GoRouterState state) =>
      const AddMatchesRoute();

  String get location => GoRouteData.$location('/matches/add');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$MatchesRoute on GoRouteData {
  static MatchesRoute _fromState(GoRouterState state) =>
      MatchesRoute(collectionName: state.pathParameters['collectionName']!);

  MatchesRoute get _self => this as MatchesRoute;

  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.collectionName)}',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$ComboSynergiesRoute on GoRouteData {
  static ComboSynergiesRoute _fromState(GoRouterState state) =>
      ComboSynergiesRoute(
        collectionName: state.pathParameters['collectionName']!,
      );

  ComboSynergiesRoute get _self => this as ComboSynergiesRoute;

  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.collectionName)}/synergies',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$AgentComboMatchesRoute on GoRouteData {
  static AgentComboMatchesRoute _fromState(GoRouterState state) =>
      AgentComboMatchesRoute(
        collectionName: state.pathParameters['collectionName']!,
        comboName: state.pathParameters['comboName']!,
      );

  AgentComboMatchesRoute get _self => this as AgentComboMatchesRoute;

  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.collectionName)}/synergies/${Uri.encodeComponent(_self.comboName)}',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$MatchesStatsRoute on GoRouteData {
  static MatchesStatsRoute _fromState(GoRouterState state) => MatchesStatsRoute(
    collectionName: state.pathParameters['collectionName']!,
  );

  MatchesStatsRoute get _self => this as MatchesStatsRoute;

  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.collectionName)}/stats',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$StyledMatchesRoute on GoRouteData {
  static StyledMatchesRoute _fromState(GoRouterState state) =>
      StyledMatchesRoute(
        state.pathParameters['collectionName']!,
        state.pathParameters['acm']!,
      );

  StyledMatchesRoute get _self => this as StyledMatchesRoute;

  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.collectionName)}/acm/${Uri.encodeComponent(_self.acm)}',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$StyledMatchesListRoute on GoRouteData {
  static StyledMatchesListRoute _fromState(GoRouterState state) =>
      StyledMatchesListRoute(
        state.pathParameters['collectionName']!,
        state.pathParameters['acm']!,
      );

  StyledMatchesListRoute get _self => this as StyledMatchesListRoute;

  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.collectionName)}/acm/${Uri.encodeComponent(_self.acm)}/matches',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

mixin _$StyledMatchupListRoute on GoRouteData {
  static StyledMatchupListRoute _fromState(GoRouterState state) =>
      StyledMatchupListRoute(
        collectionName: state.pathParameters['collectionName']!,
        acm: state.pathParameters['acm']!,
        opponentAcm: state.pathParameters['opponentAcm']!,
      );

  StyledMatchupListRoute get _self => this as StyledMatchupListRoute;

  String get location => GoRouteData.$location(
    '/matches/${Uri.encodeComponent(_self.collectionName)}/acm/${Uri.encodeComponent(_self.acm)}/vs/${Uri.encodeComponent(_self.opponentAcm)}',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
