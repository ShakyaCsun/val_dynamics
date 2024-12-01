// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $teamCompsRedirectRoute,
      $homeScreenRoute,
    ];

RouteBase get $teamCompsRedirectRoute => GoRouteData.$route(
      path: '/comps',
      factory: $TeamCompsRedirectRouteExtension._fromState,
    );

extension $TeamCompsRedirectRouteExtension on TeamCompsRedirectRoute {
  static TeamCompsRedirectRoute _fromState(GoRouterState state) =>
      const TeamCompsRedirectRoute();

  String get location => GoRouteData.$location(
        '/comps',
      );

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
          factory: $AgentsOverviewRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'agents/add',
              factory: $AddAgentsRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'agents/:rosterName',
              factory: $AgentsRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'stats',
                  factory: $AgentsStatRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/comps/:rosterName',
          factory: $TeamCompsRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'filter',
              factory: $TeamCompsFilterRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: 'details/:acm',
              factory: $TeamCompsDetailRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/matches',
          factory: $MatchesOverviewRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'add',
              factory: $AddMatchesRouteExtension._fromState,
            ),
            GoRouteData.$route(
              path: ':collectionName',
              factory: $MatchesRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'stats',
                  factory: $MatchesStatsRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'acm/:acm',
                  factory: $StyledMatchesRouteExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'matches',
                      factory: $StyledMatchesListRouteExtension._fromState,
                    ),
                    GoRouteData.$route(
                      path: 'vs/:opponentAcm',
                      factory: $StyledMatchupListRouteExtension._fromState,
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

extension $AgentsOverviewRouteExtension on AgentsOverviewRoute {
  static AgentsOverviewRoute _fromState(GoRouterState state) =>
      const AgentsOverviewRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddAgentsRouteExtension on AddAgentsRoute {
  static AddAgentsRoute _fromState(GoRouterState state) =>
      const AddAgentsRoute();

  String get location => GoRouteData.$location(
        '/agents/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AgentsRouteExtension on AgentsRoute {
  static AgentsRoute _fromState(GoRouterState state) => AgentsRoute(
        rosterName: state.pathParameters['rosterName']!,
      );

  String get location => GoRouteData.$location(
        '/agents/${Uri.encodeComponent(rosterName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AgentsStatRouteExtension on AgentsStatRoute {
  static AgentsStatRoute _fromState(GoRouterState state) => AgentsStatRoute(
        rosterName: state.pathParameters['rosterName']!,
      );

  String get location => GoRouteData.$location(
        '/agents/${Uri.encodeComponent(rosterName)}/stats',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TeamCompsRouteExtension on TeamCompsRoute {
  static TeamCompsRoute _fromState(GoRouterState state) => TeamCompsRoute(
        rosterName: state.pathParameters['rosterName']!,
      );

  String get location => GoRouteData.$location(
        '/comps/${Uri.encodeComponent(rosterName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TeamCompsFilterRouteExtension on TeamCompsFilterRoute {
  static TeamCompsFilterRoute _fromState(GoRouterState state) =>
      TeamCompsFilterRoute(
        rosterName: state.pathParameters['rosterName']!,
      );

  String get location => GoRouteData.$location(
        '/comps/${Uri.encodeComponent(rosterName)}/filter',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TeamCompsDetailRouteExtension on TeamCompsDetailRoute {
  static TeamCompsDetailRoute _fromState(GoRouterState state) =>
      TeamCompsDetailRoute(
        rosterName: state.pathParameters['rosterName']!,
        acm: state.pathParameters['acm']!,
      );

  String get location => GoRouteData.$location(
        '/comps/${Uri.encodeComponent(rosterName)}/details/${Uri.encodeComponent(acm)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MatchesOverviewRouteExtension on MatchesOverviewRoute {
  static MatchesOverviewRoute _fromState(GoRouterState state) =>
      const MatchesOverviewRoute();

  String get location => GoRouteData.$location(
        '/matches',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AddMatchesRouteExtension on AddMatchesRoute {
  static AddMatchesRoute _fromState(GoRouterState state) =>
      const AddMatchesRoute();

  String get location => GoRouteData.$location(
        '/matches/add',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MatchesRouteExtension on MatchesRoute {
  static MatchesRoute _fromState(GoRouterState state) => MatchesRoute(
        collectionName: state.pathParameters['collectionName']!,
      );

  String get location => GoRouteData.$location(
        '/matches/${Uri.encodeComponent(collectionName)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $MatchesStatsRouteExtension on MatchesStatsRoute {
  static MatchesStatsRoute _fromState(GoRouterState state) => MatchesStatsRoute(
        collectionName: state.pathParameters['collectionName']!,
      );

  String get location => GoRouteData.$location(
        '/matches/${Uri.encodeComponent(collectionName)}/stats',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StyledMatchesRouteExtension on StyledMatchesRoute {
  static StyledMatchesRoute _fromState(GoRouterState state) =>
      StyledMatchesRoute(
        state.pathParameters['collectionName']!,
        state.pathParameters['acm']!,
      );

  String get location => GoRouteData.$location(
        '/matches/${Uri.encodeComponent(collectionName)}/acm/${Uri.encodeComponent(acm)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StyledMatchesListRouteExtension on StyledMatchesListRoute {
  static StyledMatchesListRoute _fromState(GoRouterState state) =>
      StyledMatchesListRoute(
        state.pathParameters['collectionName']!,
        state.pathParameters['acm']!,
      );

  String get location => GoRouteData.$location(
        '/matches/${Uri.encodeComponent(collectionName)}/acm/${Uri.encodeComponent(acm)}/matches',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StyledMatchupListRouteExtension on StyledMatchupListRoute {
  static StyledMatchupListRoute _fromState(GoRouterState state) =>
      StyledMatchupListRoute(
        collectionName: state.pathParameters['collectionName']!,
        acm: state.pathParameters['acm']!,
        opponentAcm: state.pathParameters['opponentAcm']!,
      );

  String get location => GoRouteData.$location(
        '/matches/${Uri.encodeComponent(collectionName)}/acm/${Uri.encodeComponent(acm)}/vs/${Uri.encodeComponent(opponentAcm)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
