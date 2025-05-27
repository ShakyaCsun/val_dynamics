import 'package:custom_adaptive_scaffold/custom_adaptive_scaffold.dart';
import 'package:flutter/widgets.dart';

const _breakpoints = [
  Breakpoint.extraLarge(),
  Breakpoint.large(),
  Breakpoint.mediumLarge(),
  Breakpoint.medium(),
  Breakpoint.small(),
];

Breakpoint getBreakpointOf(BuildContext context) {
  final biggestBreakpoint = _breakpoints.firstWhere(
    (breakpoint) => breakpoint.isActive(context),
    orElse: () {
      // Should never happen, but a safe fallback regardless
      return Breakpoints.standard;
    },
  );
  return biggestBreakpoint;
}

/// returns 0 for smallest [Breakpoint] and increases accordingly.
int getBreakpointSize(Breakpoint breakpoint) {
  final index = _breakpoints.indexWhere((element) => element == breakpoint);
  if (index < 0) {
    return 0;
  }
  return (_breakpoints.length - 1) - index;
}

extension BreakpointAverageExtension on Breakpoint {
  double get averageWidth {
    return switch ((beginWidth, endWidth)) {
      (null, null) => 1,
      (final begin?, null) => begin,
      (null, final end?) => end,
      (final begin?, final end?) => (begin + end) / 2,
    };
  }
}

extension BuildContextBreakpointsExtension on BuildContext {
  bool get mediumLargeAndUp {
    return const Breakpoint.mediumLarge(andUp: true).isActive(this);
  }

  bool get largeAndUp {
    return const Breakpoint.large(andUp: true).isActive(this);
  }

  /// Show a standard drawer if true, else show modal drawer.
  ///
  /// https://m3.material.io/components/navigation-drawer/guidelines#38800092-0149-4251-ac75-4ce8a144042a
  bool get showStandardDrawer {
    return MediaQuery.sizeOf(this).width > 840;
  }
}
