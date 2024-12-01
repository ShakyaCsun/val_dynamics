import 'package:flutter/widgets.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

extension ResponsiveTextStyleExtensions on TextStyle {
  TextStyle responsive(
    BuildContext context, {
    bool isMax = true,
    double scale = 1,
  }) {
    final breakpointSize = 5 - getBreakpointSize(getBreakpointOf(context));
    return copyWith(
      fontSize:
          (fontSize ?? 14) + scale * (isMax ? -breakpointSize : breakpointSize),
    );
  }
}
