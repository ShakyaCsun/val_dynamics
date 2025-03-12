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
