import 'dart:math';

import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

final _random = Random(65780);
const _mapNames = [
  'Abyss',
  'Ascent',
  'Bind',
  'Breeze',
  'Fracture',
  'Haven',
  'Icebox',
  'Lotus',
  'Pearl',
  'Split',
];

final _numberOfMaps = _mapNames.length;

List<RawMatch> generateRawMatches(Random random, [int count = 1000]) {
  return [for (var i = 0; i < count; i++) _generateMatch(random)];
}

MatchesRepository generateMatchesRepository(Random random, [int count = 1000]) {
  return MatchesRepository(
    matches: generateRawMatches(random, count),
    agentRoster: Agents.defaultRoster,
  );
}

RawMatch _generateMatch(Random random) {
  final teamOneWon = _random.nextBool();
  const winningScore = 13;
  final losingScore = _random.nextInt(12);
  final winnersAttackedFirst = _random.nextBool();
  final losersFirstHalf = _random.nextInt(losingScore + 1);
  final winningFirstHalf = 12 - losersFirstHalf;
  final losingSecondHalf = losingScore - losersFirstHalf;
  final winningSecondHalf = winningScore - winningFirstHalf;

  final agentsOne = _generateComp();
  final agentsTwo = _random.nextInt(10) == 0 ? agentsOne : _generateComp();
  if (teamOneWon) {
    return RawMatch(
      mapName: _mapNames[_random.nextInt(_numberOfMaps)],
      teamOneName: 'Team1',
      teamTwoName: 'Team2',
      teamOneScore: winningScore,
      teamTwoScore: losingScore,
      teamOneAttackScore:
          winnersAttackedFirst ? winningFirstHalf : winningSecondHalf,
      teamTwoAttackScore:
          winnersAttackedFirst ? losingSecondHalf : losersFirstHalf,
      teamOneAgents: agentsOne,
      teamTwoAgents: agentsTwo,
    );
  }
  return RawMatch(
    mapName: _mapNames[_random.nextInt(_numberOfMaps)],
    teamOneName: 'Team1',
    teamTwoName: 'Team2',
    teamOneScore: losingScore,
    teamTwoScore: winningScore,
    teamOneAttackScore:
        winnersAttackedFirst ? losingSecondHalf : losersFirstHalf,
    teamTwoAttackScore:
        winnersAttackedFirst ? winningFirstHalf : winningSecondHalf,
    teamOneAgents: agentsOne,
    teamTwoAgents: agentsTwo,
  );
}

String _generateComp() {
  final agents = Agents.defaultRoster.map((e) => e.name).toList();
  final numberOfAgents = agents.length;
  final comp = <String>{};
  while (true) {
    comp.add(agents[_random.nextInt(numberOfAgents)]);
    if (comp.length == 5) {
      return comp.join(',');
    }
  }
}
