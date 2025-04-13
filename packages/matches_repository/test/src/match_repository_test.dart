import 'dart:math' show Random;

import 'package:matches_repository/matches_repository.dart';
import 'package:test/test.dart';
import 'package:valorant_agents/valorant_agents.dart';

import '../../benchmark/matches.dart';

void main() {
  final random = Random(42);
  group('MatchRepository', () {
    final matchesRepository = generateMatchesRepository(random);
    group('.getStyleTypeStats', () {
      final styleStats = matchesRepository.getStyleTypeStats();
      test('generates correct pick rate stats', () {
        final totalPicks = styleStats.values.fold(
          0,
          (previousValue, element) => previousValue + element.picks,
        );
        expect(
          totalPicks,
          matchesRepository.getMatches(filter: MatchUpFilter.none).length * 2,
        );

        final totalPickRates = styleStats.values.fold<double>(
          0,
          (previousValue, element) => previousValue + element.pickRate,
        );
        expect(totalPickRates, closeTo(1, 1e-10));
      });

      test('generates correct NMWR and typed WR stats', () {
        expect(
          styleStats.values.map(
            (e) =>
                e.nonMirrorWR ==
                e.winRates.values.fold(
                  Score.zero,
                  (previousValue, element) => previousValue + element,
                ),
          ),
          everyElement(true),
        );
      });
    });
  });
}
