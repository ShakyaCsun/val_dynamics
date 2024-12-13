import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

class Score extends Equatable implements Comparable<Score> {
  const Score({required this.won, required this.lost}) : played = won + lost;

  static const zero = Score(won: 0, lost: 0);

  final int won;
  final int lost;
  final int played;

  double get winRate => won / played;

  String get winRatePercent => winRate.asPercent;
  String get winRateFraction => '$won/$played';
  String get winLoss => '$won-$lost';

  ScoreType get scoreType => ScoreType.fromScore(this);

  @override
  String toString() {
    return winRateFraction;
  }

  @override
  int compareTo(Score other) {
    if (winRate == other.winRate) return played.compareTo(other.played);
    return winRate.compareTo(other.winRate);
  }

  Score operator +(Score other) {
    return Score(won: won + other.won, lost: lost + other.lost);
  }

  Score operator -(Score other) {
    return Score(won: won - other.won, lost: lost - other.lost);
  }

  Score reverse() {
    return Score(won: lost, lost: won);
  }

  @override
  List<Object> get props => [won, lost];
}

enum ScoreType {
  veryPositive,
  positive,
  tied,
  negative,
  veryNegative;

  static ScoreType fromScore(Score score) {
    final winRate = score.winRate;
    if (winRate >= 0.55) {
      return ScoreType.veryPositive;
    }
    if (winRate > 0.5) {
      return ScoreType.positive;
    }
    if (winRate == 0.5) {
      return ScoreType.tied;
    }
    if (winRate > 0.45) {
      return ScoreType.negative;
    }
    return ScoreType.veryNegative;
  }
}
