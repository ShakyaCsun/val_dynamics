import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vsdat/agents_overview/agents_overview.dart';
import 'package:vsdat/app/app.dart';
import 'package:vsdat/app/widgets/widgets.dart';
import 'package:vsdat/app_router/app_router.dart';
import 'package:vsdat/app_router/routes.dart';
import 'package:vsdat/constants.dart';
import 'package:vsdat/l10n/l10n.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider());
    return MaterialApp.router(
      title: 'Valorant Style Dynamics',
      theme: const VsdatTheme().lightTheme,
      darkTheme: const VsdatTheme().darkTheme,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      builder: (context, child) {
        return AppDataLoader(child: child!);
      },
    );
  }
}

class AppDataLoader extends ConsumerWidget {
  @visibleForTesting
  const AppDataLoader({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (message, isInitialized) = ref.watch(
      appDataInitializationStatusProvider,
    );
    if (isInitialized) {
      return child;
    }

    return Scaffold(
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisSize: MainAxisSize.min,
          children: [const CircularProgressIndicator.adaptive(), Text(message)],
        ),
      ),
    );
  }
}

class ValSD2HomeScreen extends ConsumerWidget {
  const ValSD2HomeScreen({required this.child, super.key});

  final Widget child;

  int? getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(const TeamCompsRedirectRoute().location)) {
      if (isRunningJs) {
        return null;
      }
      return 1;
    }
    if (location.startsWith(const MatchesOverviewRoute().location)) {
      return isRunningJs ? 1 : 2;
    }
    return 0;
  }

  static List<NavigationDestination> destinations(BuildContext context) {
    final l10n = context.l10n;
    return [
      NavigationDestination(
        icon: const Icon(Icons.people_alt_outlined),
        label: l10n.agents,
      ),
      if (!isRunningJs)
        NavigationDestination(
          icon: const Icon(Icons.spoke_outlined),
          label: l10n.comps,
        ),
      NavigationDestination(
        icon: const Icon(Icons.sports_esports_outlined),
        label: l10n.matches,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDestinationSelected(int index) {
      final location = GoRouterState.of(context).uri.path;
      switch (index) {
        case 0:
          if (location == const AgentsOverviewRoute().location) return;
          const AgentsOverviewRoute().go(context);
        case 1 when !isRunningJs:
          final defaultRoster = ref.read(defaultRosterNameProvider);
          final teamCompsRoute = TeamCompsRoute(rosterName: defaultRoster);
          if (location == teamCompsRoute.location) {
            return;
          }
          teamCompsRoute.go(context);
        case 1 when isRunningJs:
        case 2 when !isRunningJs:
          if (location == const MatchesOverviewRoute().location) return;
          const MatchesOverviewRoute().go(context);
      }
    }

    final showNavigationRail = const Breakpoint.medium(
      andUp: true,
    ).isActive(context);
    return Scaffold(
      body: Row(
        children: [
          if (showNavigationRail)
            SizedBox(
              width: 80,
              height: MediaQuery.sizeOf(context).height,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: NavigationRail(
                          labelType: NavigationRailLabelType.all,
                          onDestinationSelected: onDestinationSelected,
                          selectedIndex: getCurrentIndex(context),
                          destinations: destinations(context)
                              .map(
                                (e) => NavigationRailDestination(
                                  icon: e.icon,
                                  label: Text(e.label),
                                  selectedIcon: e.selectedIcon,
                                ),
                              )
                              .toList(),
                          trailing: const Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(
                                  kNavigationRailDefaultPadding,
                                ),
                                child: ViewSourceButton(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar: showNavigationRail
          ? null
          : NavigationBar(
              destinations: destinations(context),
              selectedIndex: getCurrentIndex(context) ?? 0,
              onDestinationSelected: onDestinationSelected,
            ),
    );
  }
}
