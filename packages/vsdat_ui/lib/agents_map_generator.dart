import 'dart:io';

import 'package:valorant_agents/valorant_agents.dart';

Future<void> main() async {
  final outputFile = File('./lib/gen/agents_map.dart');
  final buffer = StringBuffer(_importHeaders())
    ..writeln(generate(funcName: 'defaultAgentIcon', property: 'icon'))
    ..writeln(
      generate(funcName: 'defaultAgentDisplayIcon', property: 'displayIcon'),
    )
    ..writeln(generate(funcName: 'defaultAgentPortrait', property: 'portrait'))
    ..writeln(generate(funcName: 'defaultAbility1Icon', property: 'ability1'))
    ..writeln(generate(funcName: 'defaultAbility2Icon', property: 'ability2'))
    ..writeln(generate(funcName: 'defaultAbility3Icon', property: 'ability3'))
    ..writeln(generate(funcName: 'defaultUltimateIcon', property: 'ultimate'));
  await outputFile.writeAsString(buffer.toString());

  // Ensure agents_map is generated for all default agents
  switch (Agents.defaultRoster.length - agents.length) {
    case 0:
      return;
    case final difference:
      stdout.write('You likely forgot to add $difference agent/s.');
  }
}

String _importHeaders() {
  return '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// See: agents_map_generator.dart to regenerate this file

import 'package:vsdat_ui/vsdat_ui.dart';

''';
}

const agents = {
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
  'miks',
  'neon',
  'omen',
  'phoenix',
  'raze',
  'reyna',
  'sage',
  'skye',
  'sova',
  'tejo',
  'veto',
  'viper',
  'vyse',
  'waylay',
  'yoru',
};
String generate({required String funcName, required String property}) {
  final prefix =
      '''
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
