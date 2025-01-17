import 'dart:io';

Future<void> main() async {
  final outputFile = File('./lib/gen/agents_map.dart');
  final buffer =
      StringBuffer(_importHeaders())
        ..writeln(generate(funcName: 'defaultAgentIcon', property: 'icon'))
        ..writeln(
          generate(funcName: 'defaultAgentPortrait', property: 'portrait'),
        )
        ..writeln(
          generate(funcName: 'defaultAbility1Icon', property: 'ability1'),
        )
        ..writeln(
          generate(funcName: 'defaultAbility2Icon', property: 'ability2'),
        )
        ..writeln(
          generate(funcName: 'defaultAbility3Icon', property: 'ability3'),
        )
        ..writeln(
          generate(funcName: 'defaultUltimateIcon', property: 'ultimate'),
        );
  await outputFile.writeAsString(buffer.toString());
}

String _importHeaders() {
  return '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// See: agents_map_generator.dart to regenerate this file

import 'package:vsdat_ui/vsdat_ui.dart';

''';
}

String generate({required String funcName, required String property}) {
  const agents = [
    'astra',
    'breach',
    'brimstone',
    'chamber',
    'clove',
    'cypher',
    'deadlock',
    'fade',
    'gekko',
    'harbor',
    'iso',
    'jett',
    'kayo',
    'killjoy',
    'neon',
    'omen',
    'phoenix',
    'raze',
    'reyna',
    'sage',
    'skye',
    'sova',
    'tejo',
    'viper',
    'vyse',
    'yoru',
  ];
  final prefix = '''
AssetGenImage? $funcName(String agent) {
  return switch (agent.toLowerCase()) {
''';
  final buffer = StringBuffer(prefix);
  for (final agent in agents) {
    if (agent == 'kayo') {
      buffer.writeln(
        "'$agent' || 'kay/o' => ValAssets.agents.$agent.$property,",
      );
    } else {
      buffer.writeln("'$agent' => ValAssets.agents.$agent.$property,");
    }
  }
  buffer.writeln('''
  _ => null,
  };
}''');
  return buffer.toString();
}
