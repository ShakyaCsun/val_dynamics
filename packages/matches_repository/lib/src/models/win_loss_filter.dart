import 'package:valorant_agents/valorant_agents.dart';

enum WinLossFilter {
  /// Filter Agent Combos that have 50% or higher win rate.
  winning,

  /// Filter Agent Combos that have less than 50% win rate.
  losing,

  /// Show all Agent Combos regardless of win rate.
  all;

  Map<(Agent, Agent), ComboSynergyStat> apply(
    Map<(Agent, Agent), ComboSynergyStat> synergyStats,
  ) {
    return {
      for (final MapEntry(key: combo, value: stat) in synergyStats.entries)
        if (switch (this) {
          WinLossFilter.winning => stat.comboWR.winRate >= 0.5,
          WinLossFilter.losing => stat.comboWR.winRate < 0.5,
          WinLossFilter.all => true,
        })
          combo: stat,
    };
  }
}
