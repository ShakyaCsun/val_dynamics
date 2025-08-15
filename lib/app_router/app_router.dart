import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/app_router/routes.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref, {bool debugLogDiagnostics = false}) {
  final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'GoRouterKey');
  final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: debugLogDiagnostics,
    routes: $appRoutes,
    redirect: (context, state) {
      final defaultRoster = ref.read(defaultRosterNameProvider);
      if (state.uri.path == const TeamCompsRedirectRoute().location) {
        return TeamCompsRoute(rosterName: defaultRoster).location;
      }
      return null;
    },
  );
  return router;
}
