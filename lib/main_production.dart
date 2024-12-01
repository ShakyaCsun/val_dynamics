import 'package:logging/logging.dart';
import 'package:vsdat/app/app.dart';
import 'package:vsdat/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() async {
    Logger.root.level = Level.WARNING;
    return const App();
  });
}
