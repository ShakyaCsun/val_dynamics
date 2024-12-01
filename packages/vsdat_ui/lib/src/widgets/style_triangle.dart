import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class StyleTriangle<T> extends StatelessWidget {
  const StyleTriangle({
    required this.data,
    required this.builder,
    this.onHover,
    this.onTap,
    this.minRadius = 16,
    this.showLabels = false,
    this.labelStyle,
    super.key,
  });

  final Map<T, TernaryPoint> data;
  final Widget Function(T datum, double radius) builder;
  final PointsHitCallback<T>? onHover;
  final PointsHitCallback<T>? onTap;
  final double minRadius;
  final bool showLabels;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final breakpoint = getBreakpointOf(context);
    final ternaryPlotStyles = TernaryPlotStyles(context);
    return InteractiveChartViewer(
      builder: (scaleFactor) {
        final radius = minRadius + getBreakpointSize(breakpoint);
        final effectiveRadius = math.min(
          radius + (scaleFactor - 1) / 10 * radius,
          radius + 3,
        );
        return TernaryPlot<T>(
          plotData: TernaryPlotData(
            data: data,
            builder: (value) {
              return builder(value, effectiveRadius);
            },
          ),
          settings: TernaryPlotSettings(
            minPadding: breakpoint.padding + minRadius,
            ternaryLabels: showLabels ? ternaryPlotStyles.label() : null,
          ),
          areas: ternaryPlotStyles.areas(),
          onPointHovered: onHover,
          onPointTap: onTap,
        );
      },
    );
  }
}
