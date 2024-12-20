import 'package:flutter/material.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({required this.child, super.key});

  final Widget child;

  static double of(BuildContext context) {
    return getBreakpointOf(context).padding;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ResponsivePadding.of(context)),
      child: child,
    );
  }
}
