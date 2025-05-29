import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant_agents/valorant_agents.dart';

class AgentsOverview extends Equatable {
  const AgentsOverview({
    required this.rosterName,
    required this.agentCount,
    required this.range,
    this.isBuiltIn = false,
  });

  final String rosterName;
  final int agentCount;
  final PointsRange range;
  final bool isBuiltIn;

  @override
  List<Object> get props => [rosterName, agentCount, range, isBuiltIn];
}

sealed class PointsRange extends Equatable {
  const PointsRange();

  factory PointsRange.from({required Agents agents, double? tolerance}) {
    if (agents.validPowerLevels) {
      return SinglePoint(total: agents.first.totalPoints);
    }
    final nearlyEqualPower = tolerance == null
        ? agents.haveCloseToEqualPower()
        : agents.haveCloseToEqualPower(tolerance: tolerance);
    if (nearlyEqualPower) {
      final averagePower =
          (agents.map((e) => e.totalPoints).reduce((value, element) {
                    return value + element;
                  }) /
                  agents.length)
              .toStringAsFixed(2);
      return NearlyEqualPoints(total: parseDouble(averagePower));
    }
    final agentPowerBudgets = agents.map((agent) => agent.totalPoints).toSet();
    final low = agentPowerBudgets.min;
    final high = agentPowerBudgets.max;
    return VariedPointsRange(
      low: low,
      high: high,
      count: agentPowerBudgets.length,
    );
  }
}

class SinglePoint extends PointsRange {
  const SinglePoint({required this.total});

  final double total;

  @override
  List<Object> get props => [total];
}

class NearlyEqualPoints extends PointsRange {
  const NearlyEqualPoints({required this.total});

  final double total;

  @override
  List<Object> get props => [total];
}

class VariedPointsRange extends PointsRange {
  const VariedPointsRange({
    required this.low,
    required this.high,
    required this.count,
  });

  final double low;
  final double high;
  final int count;

  @override
  List<Object> get props => [count, low, high];
}
