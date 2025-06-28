import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

class Score extends Equatable implements Comparable<Score> {
  const Score({required this.won, required this.lost})
    : played = won + lost,
      tuple = (won, lost),
      winRate = won / (won + lost);

  static const zero = Score(won: 0, lost: 0);

  final int won;
  final int lost;
  final int played;
  final (int, int) tuple;

  final double winRate;

  /// The current score with 2 decimal places and a percentage sign
  String get winRatePercent => winRate.asPercent;

  /// Won/Played or Won/(Won+Lost) fraction
  String get winRateFraction => '$won/$played';

  /// Won and Loss scores separated by '-'. Used to indicate the Map Score.
  String get winLoss => '$won-$lost';

  /// [winRatePercent] followed by [winRateFraction]
  String get roundPercentStat => '$winRatePercent ($winRateFraction)';

  /// Descriptive won lost string. e.g. Won 13 and Lost 6.
  String get wonLost => switch (this) {
    Score(won: 0) => 'Lost all',
    Score(lost: 0) => 'Won all',
    _ => 'Won $won and Lost $lost',
  };

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

  Score get reversed => Score(won: lost, lost: won);

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

extension ScoreTupleX on (int, int) {
  (int, int) operator +((int, int) other) {
    final (w, l) = this;
    final (otherW, otherL) = other;
    return (w + otherW, l + otherL);
  }

  Score get toScore => Score(won: $1, lost: $2);
}
