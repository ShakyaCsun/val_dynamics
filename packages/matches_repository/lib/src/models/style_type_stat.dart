import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

class StyleTypeStat extends Equatable {
  const StyleTypeStat({
    required this.type,
    required this.picks,
    required this.pickRate,
    required this.nonMirrorWR,
    required this.winRates,
  });

  final StyleType type;
  final int picks;
  final double pickRate;
  final Score nonMirrorWR;
  final Map<StyleType, Score> winRates;

  @override
  List<Object> get props => [type, picks, pickRate, nonMirrorWR, winRates];
}
