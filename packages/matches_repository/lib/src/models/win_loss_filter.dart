import 'package:valorant_agents/valorant_agents.dart';

enum WinLossFilter {
  /// Filter 50% or higher win rates.
  winning,

  /// Filter less than 50% win rate.
  losing,

  /// Show all win rate.
  all;

  bool check(Score score) {
    return switch (this) {
      WinLossFilter.winning => score.winRate >= 0.5,
      WinLossFilter.losing => score.winRate < 0.5,
      WinLossFilter.all => true,
    };
  }
}
