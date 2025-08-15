import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

final _logger = Logger('val_sd_analyzer');

class AppProviderObserver extends ProviderObserver {
  static final _logger = Logger('AppProviderObserver');

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    final provider = context.provider;
    final providerName = provider.from != null
        ? '${provider.name}(${provider.argument})'
        : provider.name;
    _logger.info('$providerName created');
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    _logger.warning(context.provider, error, stackTrace);
  }

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    _logger.finest('${context.provider.name} -> $newValue');
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    _logger.info('${context.provider.name} was disposed.');
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
    if (kReleaseMode && kIsWeb) {
      debugPrint(
        '${event.level.name}: ${event.time}: '
        '${event.loggerName}: ${event.message}',
      );
    }
  });

  runApp(
    ProviderScope(
      observers: [AppProviderObserver()],
      child: Portal(child: await builder()),
    ),
  );
}
