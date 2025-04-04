import 'package:valorant_agents/valorant_agents.dart';

enum SynergySort {
  rounds,
  comboWR,
  combinedSynergy,
  agentWR,
  synergy;

  Map<(Agent, Agent), ComboSynergyStat> apply(
    Map<(Agent, Agent), ComboSynergyStat> stats,
  ) {
    if (this == SynergySort.synergy || this == SynergySort.agentWR) {
      final sortedSynergyStats =
          stats.entries.expand((entry) {
              final MapEntry(key: combo, value: stat) = entry;
              final reversedEntry = MapEntry((
                combo.$2,
                combo.$1,
              ), stat.reversed);
              return [entry, reversedEntry];
            }).toList()
            ..sort((a, b) {
              final compareResult =
                  this == SynergySort.synergy
                      ? b.value.synergyOne.compareTo(a.value.synergyOne)
                      : b.value.oneWR.compareTo(a.value.oneWR);
              return switch (compareResult) {
                0 => b.value.comboWR.compareTo(a.value.comboWR),
                _ => compareResult,
              };
            });
      return {
        for (final MapEntry(:key, :value) in sortedSynergyStats) key: value,
      };
    }
    final sortedStats =
        stats.entries.toList()..sort((a, b) {
          final compareResult = switch (this) {
            SynergySort.rounds => b.value.comboWR.played.compareTo(
              a.value.comboWR.played,
            ),
            SynergySort.comboWR => b.value.comboWR.compareTo(a.value.comboWR),
            SynergySort.combinedSynergy => b.value.compareTo(a.value),
            _ => throw StateError('Bad State. $this should not reach here.'),
          };
          if (compareResult == 0) {
            if (this == SynergySort.comboWR) {
              // Use number of rounds played as secondary sort
              return b.value.comboWR.played.compareTo(a.value.comboWR.played);
            }
            // Use ComboWR as secondary sort when comboWR is not the primary
            return b.value.comboWR.compareTo(a.value.comboWR);
          }
          return compareResult;
        });
    return {for (final MapEntry(:key, :value) in sortedStats) key: value};
  }
}
