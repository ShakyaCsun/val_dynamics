import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyleTypeIcon extends StatelessWidget {
  const StyleTypeIcon({required this.styleType, this.size = 48, super.key});

  final StyleType styleType;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: TernaryPlot<int>(
        plotData: TernaryPlotData(
          data: const {},
          builder: (_) => const SizedBox.shrink(),
        ),
        settings: TernaryPlotSettings(
          gridLines: 4,
          minPadding: 0,
          gridLineColor: ThemedColor.textColor.of(context).withAlpha(100),
        ),
        areas: [
          ...TernaryPlotStyles(context).areas(),
          styleType.plotArea,
          styleType.outlinedArea(MediaQuery.platformBrightnessOf(context)),
        ],
      ),
    );
  }
}

extension on StyleType {
  List<TernaryPoint> get pointsArea {
    final acmStrings = switch (this) {
      StyleType.heavyAggro => ['4-0-0', '3-1-0', '3-0-1'],
      StyleType.heavyControl => ['0-4-0', '1-3-0', '0-3-1'],
      StyleType.heavyMidrange => ['0-0-4', '1-0-3', '0-1-3'],
      StyleType.aggroSubControl => ['3-1-0', '2-1-1', '2-2-0'],
      StyleType.aggroSubMidrange => ['3-0-1', '2-1-1', '2-0-2'],
      StyleType.aggroSubHybrid => ['3-1-0', '2-1-1', '3-0-1'],
      StyleType.controlSubAggro => ['1-2-1', '1-3-0', '2-2-0'],
      StyleType.controlSubMidrange => ['1-2-1', '0-3-1', '0-2-2'],
      StyleType.controlSubHybrid => ['1-2-1', '1-3-0', '0-3-1'],
      StyleType.midrangeSubControl => ['1-1-2', '0-1-3', '0-2-2'],
      StyleType.midrangeSubAggro => ['1-1-2', '1-0-3', '2-0-2'],
      StyleType.midrangeSubHybrid => ['1-1-2', '1-0-3', '0-1-3'],
      StyleType.aggroControl => ['2-1-1', '2-2-0', '1-2-1'],
      StyleType.controlMidrange => ['1-2-1', '0-2-2', '1-1-2'],
      StyleType.midrangeAggro => ['2-1-1', '2-0-2', '1-1-2'],
      StyleType.center => ['2-1-1', '1-2-1', '1-1-2'],
    };
    return acmStrings
        .map((e) => AcmString(e).stylePoints.ternaryPoint)
        .toList();
  }

  TernaryPlotArea get plotArea {
    return SolidTernaryPlotArea(
      points: pointsArea,
      color: ValColors.forStyleType(this),
    );
  }

  TernaryPlotArea outlinedArea(Brightness brightness) {
    return OutlinedTernaryPlotArea(
      points: pointsArea,
      color: ThemedColor.textColor.getValue(brightness),
      thickness: 2,
    );
  }
}
