import 'dart:math';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

abstract class MatchesBenchmarkBase extends BenchmarkBase {
  MatchesBenchmarkBase(super.name, {int seed = 65780, this.matchesCount = 1000})
    : random = Random(seed);

  final Random random;
  final int matchesCount;
}

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

final int _numberOfMaps = _mapNames.length;

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
  final teamOneWon = random.nextBool();
  const winningScore = 13;
  final losingScore = random.nextInt(12);
  final winnersAttackedFirst = random.nextBool();
  final losersFirstHalf = random.nextInt(losingScore + 1);
  final winningFirstHalf = 12 - losersFirstHalf;
  final losingSecondHalf = losingScore - losersFirstHalf;
  final winningSecondHalf = winningScore - winningFirstHalf;

  final agentsOne = _generateComp(random);
  final agentsTwo = random.nextInt(10) == 0 ? agentsOne : _generateComp(random);
  if (teamOneWon) {
    return RawMatch(
      mapName: _mapNames[random.nextInt(_numberOfMaps)],
      teamOneName: 'Team1',
      teamTwoName: 'Team2',
      teamOneScore: winningScore,
      teamTwoScore: losingScore,
      teamOneAttackScore: winnersAttackedFirst
          ? winningFirstHalf
          : winningSecondHalf,
      teamTwoAttackScore: winnersAttackedFirst
          ? losingSecondHalf
          : losersFirstHalf,
      teamOneAgents: agentsOne,
      teamTwoAgents: agentsTwo,
    );
  }
  return RawMatch(
    mapName: _mapNames[random.nextInt(_numberOfMaps)],
    teamOneName: 'Team1',
    teamTwoName: 'Team2',
    teamOneScore: losingScore,
    teamTwoScore: winningScore,
    teamOneAttackScore: winnersAttackedFirst
        ? losingSecondHalf
        : losersFirstHalf,
    teamTwoAttackScore: winnersAttackedFirst
        ? winningFirstHalf
        : winningSecondHalf,
    teamOneAgents: agentsOne,
    teamTwoAgents: agentsTwo,
  );
}

String _generateComp(Random random) {
  final agents = Agents.defaultRoster.map((e) => e.name).toList();
  final numberOfAgents = agents.length;
  final comp = <String>{};
  while (true) {
    comp.add(agents[random.nextInt(numberOfAgents)]);
    if (comp.length == 5) {
      return comp.join(',');
    }
  }
}
