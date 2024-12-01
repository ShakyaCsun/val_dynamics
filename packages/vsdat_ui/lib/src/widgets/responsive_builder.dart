import 'package:flutter/widgets.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.small,
    this.medium,
    this.mediumLarge,
    this.large,
    this.extraLarge,
    this.useLayoutBuilder = false,
    this.child,
    super.key,
  });

  final Widget Function(BuildContext context, Widget? child) small;
  final Widget Function(BuildContext context, Widget? child)? medium;
  final Widget Function(BuildContext context, Widget? child)? mediumLarge;
  final Widget Function(BuildContext context, Widget? child)? large;
  final Widget Function(BuildContext context, Widget? child)? extraLarge;
  final Widget? child;
  final bool useLayoutBuilder;

  @override
  Widget build(BuildContext context) {
    final breakpoint = getBreakpointOf(context);
    final builder = switch (breakpoint) {
      Breakpoints.extraLarge =>
        extraLarge ?? large ?? mediumLarge ?? medium ?? small,
      Breakpoints.large => large ?? mediumLarge ?? medium ?? small,
      Breakpoints.mediumLarge => mediumLarge ?? medium ?? small,
      Breakpoints.medium => medium ?? small,
      _ => small,
    };
    return builder(context, child);
  }
}
