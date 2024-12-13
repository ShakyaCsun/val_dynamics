import 'dart:math' as math;

import 'package:flutter/material.dart' hide InteractiveViewer;
import 'package:vsdat_ui/src/widgets/_interactive_viewer_transform.dart'
    show InteractiveViewer;

class InteractiveChartViewer extends StatefulWidget {
  const InteractiveChartViewer({required this.builder, super.key});

  final Widget Function(double scaleFactor) builder;

  @override
  State<InteractiveChartViewer> createState() => _InteractiveChartViewerState();
}

class _InteractiveChartViewerState extends State<InteractiveChartViewer> {
  late final TransformationController controller;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final BoxConstraints(:maxHeight, :maxWidth) = constraints;
        final maxSmallSide = math.min(maxWidth, maxHeight);
        final maxScale =
            maxSmallSide <= 0.0 ? 3 : math.max(4000 ~/ maxSmallSide, 3);
        return InteractiveViewer(
          maxScale: maxScale.toDouble(),
          transformationController: controller,
          transformChild: false,
          child: Stack(
            children: [
              ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, matrix, child) {
                  final rect = Offset.zero & constraints.biggest;
                  var transformRect = MatrixUtils.transformRect(matrix, rect);
                  final rightNeedsClamping = transformRect.right < maxWidth;
                  final bottomNeedsClamping = transformRect.bottom < maxHeight;
                  if (rightNeedsClamping) {
                    transformRect = transformRect.translate(
                      maxWidth - transformRect.right,
                      0,
                    );
                  }
                  if (bottomNeedsClamping) {
                    transformRect = transformRect.translate(
                      0,
                      maxHeight - transformRect.bottom,
                    );
                  }

                  return Positioned.fromRect(
                    rect: transformRect,
                    child: widget.builder(matrix.getMaxScaleOnAxis()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
