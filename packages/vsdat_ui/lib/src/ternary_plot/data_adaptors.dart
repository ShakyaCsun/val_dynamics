import 'package:equatable/equatable.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';

extension AgentCompToTernaryDataAdaptor on Iterable<AgentComp> {
  Map<StylePoints, List<AgentComp>> get groupedByStylePoints {
    return fold(<StylePoints, List<AgentComp>>{}, (resultingGroup, comp) {
      resultingGroup.update(
        comp.stylePoints,
        (value) => [...value, comp],
        ifAbsent: () => [comp],
      );
      return resultingGroup;
    });
  }

  Map<AgentCompsTernaryData, TernaryPoint> get asTernaryData {
    return {
      for (final MapEntry(key: stylePoints, value: comps)
          in groupedByStylePoints.entries)
        AgentCompsTernaryData(stylePoints, comps.length):
            stylePoints.ternaryPoint,
    };
  }
}

extension StylePointsTernaryAdaptor on StylePoints {
  TernaryPoint get ternaryPoint {
    return TernaryPoint(a: control, b: midrange, c: aggro);
  }
}

class AgentCompsTernaryData extends Equatable {
  const AgentCompsTernaryData(this.stylePoints, this.count);

  final StylePoints stylePoints;
  final int count;

  @override
  List<Object> get props => [count, stylePoints];
}
