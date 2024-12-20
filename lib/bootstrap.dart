import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat/bundled_csv/bundled_csv.dart';
import 'package:vsdat/gen/gen.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

final _logger = Logger('val_sd_analyzer');

class AppProviderObserver extends ProviderObserver {
  static final _logger = Logger('AppProviderObserver');

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    final providerName =
        provider.from != null
            ? '${provider.name}(${provider.argument})'
            : provider.name;
    _logger.info('$providerName created');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _logger.warning(provider, error, stackTrace);
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _logger.finest('${provider.name} -> $newValue');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    _logger.info('${provider.name} was disposed.');
  }
}

Future<void> bootstrap(Future<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    }
    _logger.severe(
      details.exceptionAsString(),
      details.exception,
      details.stack,
    );
  };

  // Add cross-flavor configuration here.
  Logger.root.onRecord.listen((event) {
    log(
      event.message,
      level: event.level.value,
      error: event.error,
      stackTrace: event.stackTrace,
      time: event.time,
      name: event.loggerName,
    );
  });

  final agentCsvs = <String, Agents>{
    for (final agentCsv in Assets.csv.agents.values)
      agentCsv.split('/').last: Agents.fromCsv(
        await rootBundle.loadString(agentCsv),
      ),
  };
  final matchesCsvs = <String, List<RawMatch>>{
    for (final matchesCsv in Assets.csv.matches.values)
      matchesCsv.split('/').last: ValorantMatches.rawMatchesFrom(
        csv: await rootBundle.loadString(matchesCsv),
      ),
  };
  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      overrides: [
        bundledAgentsCsvsProvider.overrideWithValue(agentCsvs),
        bundledMatchesCsvsProvider.overrideWithValue(matchesCsvs),
      ],
      child: Portal(child: await builder()),
    ),
  );
}
