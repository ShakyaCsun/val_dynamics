import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class TernaryPlotStyles {
  TernaryPlotStyles(this.context);

  final BuildContext context;

  List<TernaryPlotArea> areas({
    double opacity = 0.4,
    bool colorCenter = false,
  }) {
    return [
      TernaryPlotArea.top(
        color: aggro.withValues(alpha: opacity),
      ),
      TernaryPlotArea.bottomLeft(
        color: control.withValues(alpha: opacity),
      ),
      TernaryPlotArea.bottomRight(
        color: midrange.withValues(alpha: opacity),
      ),
      if (colorCenter)
        TernaryPlotArea.center(
          color: center.withValues(alpha: opacity),
        ),
    ];
  }

  ThemeData get _theme => Theme.of(context);

  Color get aggro => ValColors.aggro.of(context);

  Color get control => ValColors.control.of(context);

  Color get midrange => ValColors.midrange.of(context);

  Color get center => _theme.colorScheme.surfaceBright;

  TernaryLabelData label({TextStyle? textStyle}) {
    return TernaryLabelData.sharedStyle(
      topLabel: 'AGGRO',
      leftLabel: 'CONTROL',
      rightLabel: 'MIDRANGE',
      style: textStyle ?? Theme.of(context).textTheme.titleMedium,
    );
  }
}
