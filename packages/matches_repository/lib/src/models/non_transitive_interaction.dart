import 'package:equatable/equatable.dart';
import 'package:matches_repository/matches_repository.dart';
import 'package:valorant_agents/valorant_agents.dart';

class NonTransitiveInteraction extends Equatable {
  NonTransitiveInteraction({
    required this.styles,
    required this.aVsB,
    required this.bVsC,
    required this.cVsA,
  }) : total = aVsB.score + bVsC.score + cVsA.score;

  final StyleTriplet styles;
  final MatchesSummary aVsB;
  final MatchesSummary bVsC;
  final MatchesSummary cVsA;

  final Score total;

  @override
  List<Object> get props => [styles, aVsB, bVsC, cVsA];
}
