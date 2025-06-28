import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ternary_plot/ternary_plot.dart';
import 'package:valorant_agents/valorant_agents.dart';
import 'package:vsdat_ui/vsdat_ui.dart';

/// {@template counter_triangle_arrow_plot}
/// Draws a triangle from given [stylePoints] indicating it's natural prey and
/// predator using arrows in a [TernaryPlot].
/// {@endtemplate}
class CounterTriangleArrowPlot extends TernaryPlotArea {
  /// {@macro counter_triangle_arrow_plot}
  CounterTriangleArrowPlot({
    required this.stylePoints,
    this.radius = 20,
    this.color = Colors.blueGrey,
    this.circleColor = Colors.white,
  }) : super(
         points: [
           stylePoints.ternaryPoint,
           stylePoints.prey.ternaryPoint,
           stylePoints.predator.ternaryPoint,
         ],
       );

  final StylePoints stylePoints;
  final double radius;
  final Color color;
  final Color circleColor;

  @override
  void paint(Canvas canvas, EquilateralTriangle triangle, _, _) {
    final [current, prey, predator] = points
        .map((point) => triangle.correctedPosition(point: point))
        .toList();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final lengthOfSide = (current - prey).distance;
    if (lengthOfSide < 2 * radius) {
      canvas.drawPath(triangle.getAreaPath(points: points), paint);
      return;
    }
    const circleStrokeWidth = 6.0;

    void drawArrowLines(Offset start, Offset end) {
      final (paddedStart, paddedEnd) = getPaddedLine(
        start,
        end,
        radius + circleStrokeWidth / 2,
      );
      final path = getArrowHead(paddedStart, paddedEnd)
        ..moveTo(paddedStart.dx, paddedStart.dy)
        ..lineTo(paddedEnd.dx, paddedEnd.dy);
      canvas.drawPath(path, paint);
    }

    drawArrowLines(current, prey);
    drawArrowLines(prey, predator);
    drawArrowLines(predator, current);

    final path = Path()
      ..addOval(Rect.fromCircle(center: current, radius: radius))
      ..addOval(Rect.fromCircle(center: prey, radius: radius))
      ..addOval(Rect.fromCircle(center: predator, radius: radius));

    final circlePaint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleStrokeWidth;
    canvas.drawPath(path, circlePaint);
  }

  (Offset paddedStart, Offset paddedEnd) getPaddedLine(
    Offset start,
    Offset end,
    double padding,
  ) {
    final directionOffset = end - start;
    final length = directionOffset.distance;
    final paddedStart = start + directionOffset * (padding / length);
    final paddedEnd = end - directionOffset * (padding / length);
    return (paddedStart, paddedEnd);
  }

  Path getArrowHead(
    Offset start,
    Offset end, {
    double angle = pi / 6,
    double wingLength = 20,
  }) {
    final Offset(dx: x2, dy: y2) = end;
    final directionOffset = end - start;
    final Offset(dx: udx, dy: udy) =
        -directionOffset / directionOffset.distance;
    final cosine = cos(angle);
    final sine = sin(angle);
    final ax = udx * cosine - udy * sine;
    final ay = udx * sine + udy * cosine;
    final bx = udx * cosine + udy * sine;
    final by = -udx * sine + udy * cosine;
    return Path()
      ..moveTo(x2 + wingLength * ax, y2 + wingLength * ay)
      ..lineTo(x2, y2)
      ..lineTo(x2 + wingLength * bx, y2 + wingLength * by);
  }
}
