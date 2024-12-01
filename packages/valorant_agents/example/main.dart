// ignore_for_file: avoid_print, curly_braces_in_flow_control_structures

import 'package:valorant_agents/valorant_agents.dart';

void main() async {
  const team = AgentComp(
    Agent.viper,
    Agent.fade,
    Agent.omen,
    Agent.raze,
    Agent.killjoy,
  );
  print(team);
  print(team.stylePoints);

  for (final e in team.agents) {
    print('${e.name} ${e.stylePoints.prettyPrint(sorted: true)}');
  }

  final agentList = Agents.defaultRoster;
  final possibleComps = <AgentComp>[
    for (final (one, agent1) in agentList.indexed)
      for (final (two, agent2) in agentList.skip(one + 1).indexed)
        for (final (three, agent3) in agentList.skip(one + two + 2).indexed)
          for (final (four, agent4)
              in agentList.skip(one + two + three + 3).indexed)
            for (final agent5 in agentList.skip(one + two + three + four + 4))
              AgentComp(agent1, agent2, agent3, agent4, agent5),
  ];
  print(possibleComps.length == possibleComps.toSet().length);
  print('All Possible Comps: ${possibleComps.length}');
  // print(possibleComps.whereType<(int, int, int, int)>().length);
  final matches = await ValorantMatches.fromCsvFile(
    './matches.csv',
    agentsMap: Agents.defaultRoster.nameMap,
    ignoreTeamParserExceptions: true,
    ignoredExceptionHandler: (exception) {
      for (final e in exception) {
        print(e.message);
      }
    },
  );
  final clashMatches = matches.groupMatchesByStylisticClash();
  final stylisticMatchupMatches = matches.groupByMatchupType();
  print(clashMatches.length);
  print(stylisticMatchupMatches.length);
  for (final MapEntry(key: matchupType, value: matches)
      in stylisticMatchupMatches.entries) {
    final winRate = matches.collectTeamOneScore().winRatePercent;
    final matchesCount = matches.length;
    switch (matchupType) {
      case AggroVsControl():
        print('Aggro beat Control $winRate of time in $matchesCount matches');
      case ControlVsMidrange():
        print(
          'Control beat Midrange $winRate of time in $matchesCount matches',
        );
      case MidrangeVsAggro():
        print('Midrange beat Aggro $winRate of time in $matchesCount matches');
      case NonHybridVsHybrid():
        print(
          'Non-hybrid beat Hybrid $winRate of time in $matchesCount matches',
        );
      case StylisticallySimilar():
        print('Similar $winRate of time in $matchesCount matches');
        continue;
    }
    // print(
    //   matches.groupMatchesByStylisticClash().keys.map(
    //     (stylePair) {
    //       final (a, b) = stylePair;
    //       return '${a.acm} vs ${b.acm} (${(a - b).acm})';
    //     },
    //   ).join('\t'),
    // );
  }
  print(matches.length);
}
