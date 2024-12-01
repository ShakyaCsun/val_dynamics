import 'package:flutter/widgets.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class TriangleIcon extends StatelessWidget {
  const TriangleIcon({this.size, super.key});

  final double? size;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final iconSize = size ?? iconTheme.size;
    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: TernaryPlot<int>(
        plotData: TernaryPlotData(
          data: const {},
          builder: (value) => const SizedBox.shrink(),
        ),
        areas: TernaryPlotStyles(context).areas(opacity: 1),
      ),
    );
  }
}
