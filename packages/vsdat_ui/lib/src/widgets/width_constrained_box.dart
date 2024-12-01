import 'package:flutter/material.dart';

class WidthConstrainedBox extends StatelessWidget {
  const WidthConstrainedBox({
    required this.child,
    this.alignment = Alignment.center,
    this.maxWidth = 1200,
    super.key,
  });

  final AlignmentGeometry alignment;
  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < maxWidth) {
          return child;
        }
        return Align(
          alignment: alignment,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: child,
          ),
        );
      },
    );
  }
}
